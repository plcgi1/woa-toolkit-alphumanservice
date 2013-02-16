package Ahs::REST::Engine;
use strict;
use Data::Dumper;
use JSON::XS;
use URI::Escape qw/uri_unescape/;
use parent 'WOA::REST::Engine';

__PACKAGE__->mk_accessors(qw/model session formatter config logger res/);

my $BAD_STATUS_MAP = {
    400 => '[WOA] Bad request',
    401 => '[WOA] Forbidden',
    404 => '[WOA] Not found'
};

my $OK_STATUS_MAP = {
    PUT         =>  200,
    GET         =>  200,
    POST        =>  200,
    DELETE      =>  200
};

sub process {
    my($self,$query_args)=@_;
    $self->formatter(Ahs::Formatter->new);
    $self->SUPER::process($query_args);
    return;
}

sub finalize {
    my($self,$method_data,$res)=@_;

    $self->ok_status_map($OK_STATUS_MAP);
    $self->SUPER::finalize($method_data,$res);
    $self->res($res);
    
    return;
}

sub log_request {}

sub _fill_args {
    my ( $self, $data ) = @_;

    my $ct = $self->request->{env}->{CONTENT_TYPE};
    my $session = $self->backend->get_session;
    my $param;

    if ( $ct =~/application\/json/ ) {
        eval {
            $param = JSON::XS->new->utf8->allow_nonref->decode($self->request->content);
        };
    }
     
    if( $session && $session->{user} ){
        $param->{user_id} = $session->{user}->{id};
    }
    $self->SUPER::_fill_args($data);
    if ( $param ) {
        if(ref $param eq 'ARRAY'){
            $param = $param->[0];
        }
        if( exists $param->{url} ){
            $param->{url} =~s/&#47;/\//g;
        }
        foreach ( @{$data} ) {
            if( $param->{$_->{name}} ) {
                my $v = $param->{$_->{name}};
                $_->{value} = $v;
            }
        }

    }
    else {
        
    }
    
    $self->args_filled(1);

    return;
}
# sub check_access { return 1; }

sub check_access {
    my($self, $method, $method_data ) = @_;
    
    my $user_data = $self->backend->get_session();
    my $request = $self->request;
    
    if ( $method_data->{public} && $method_data->{public} eq 1 ) {
        return 1;
    }
    my $path = $request->request_uri;
    my $access  = 0;
    if ( $request->method =~ /get|delete|post|put/i ) {
        $path = ( split '\?', $path )[0];
    }
    if ( $user_data && ref $user_data eq 'HASH' && $user_data->{user} ) {
        my $acl     = $user_data->{acl};
        my $rest    = $user_data->{rest};
        #   acl - { path => [POST, GET, PUT, DELETE] }
        if ($acl || $rest) {
            my $re = qr|$method_data->{regexp}|;
            
            my $iterator = sub {
                my($c_path,$method_types)=@_;
                my $access;
                if ( $c_path =~ /$re/ ) {
                    my $access_count = 0;
                    foreach my $method_type( @{ $method_types } ) {
                        if ( $method_type eq $method_data->{req_method} ) {
                            $access = 1;
                            
                            last;
                        }
                    }
                }
                return $access;
            };
            
            foreach ( @$acl ) {
                $access = $iterator->($_->{path},$_->{method_types});
                
                if ( $_->{children} ) {
                    foreach my $ch ( @{$_->{children}} ) {
                        $access = $iterator->($ch->{path},$ch->{method_types});
                        if ( $access ) {
                            last;
                        }
                    }
                }
                if ( $access ) {
                    if ( $_->{type} eq 'page' ) {
                        $user_data->{active_page} = $_->{name};
                    }
                    last;
                }
            }
            unless ( $access ) {
                $acl    = $user_data->{rest};
                foreach ( @$acl ) {
                    $access = $iterator->($_->{path},$_->{method_types});
                    
                    if ( $_->{children} ) {
                        foreach my $ch ( @{$_->{children}} ) {
                            $access = $iterator->($ch->{path},$ch->{method_types});
                            if ( $access ) {
                                last;
                            }
                        }
                    }
                    if ( $access ) {
                        if ( $_->{type} eq 'page' ) {
                            $user_data->{active_page} = $_->{name};
                        }
                        last;
                    }
                }
            }
            
        }
        return $access;
    }
    else {
        foreach ( @{$user_data->{nav}} ) {
            if( $path eq $_->{path} && $_->{is_public} ) {
                $access = 1;
                last;
            }
        }
    }
   
    if($method eq 'login') {
       $access = 1;
    }
    return $access;
}

sub set_error {
    my($self,$http_status,$msg,$message_data,$is_valid)=@_;
    
    my $user_data = $self->backend->get_session();
    
    $self->status($http_status);
    my $error_obj;
    my $fmt = $self->formatter();
    $msg = $fmt->encode_utf($msg);
    my $session = $self->backend->{'session'};
    my $config = $self->backend->get_config;
    
    my $user = $session->{'user'};
    if ( ref $message_data eq 'WOA::Validator::ErrorCode' ) {
        $error_obj = $message_data;
    }
    elsif ( ref $is_valid eq 'WOA::Validator::ErrorCode' ) {
        $error_obj = $is_valid;
    }
    elsif ( ref $message_data eq 'HASH' ) {
        if( $message_data->{out}->{mime_type} eq 'text/html' && !$message_data->{public} && !$user && !$session->{redirected} ){
            $self->status(303);
            $session->{redirected} = 1;
            $self->location($config->{default}->{path});
        }
        if( $message_data->{out}->{mime_type} eq 'text/html' && !$message_data->{public} && $user ){
            $self->error_message(Dumper $message_data);
            my $out = $self->view->as_json({
                Message => $msg,
                Class   => 'error'
            });
            $self->output($out);
        }
        else {
            $self->status(303);
            $session->{redirected} = 1;
            $self->location($config->{default}->{401});
        }
    }
    
    if ( $error_obj && ref $error_obj eq 'WOA::Validator::ErrorCode' ){
        my $errFields = $error_obj->errorFields;
        my @newFields;
        my %hash;
        if ( ref $errFields eq 'ARRAY' ){
            
            foreach ( @$errFields ){
                if ( ref $_ eq 'HASH' && $_->{name} ){
                    #push @newFields,$_;
                    $hash{$_->{name}} = $_;
                }
            }
        }
        my $data = \%hash;
        my $out = $self->view->as_json($data);
        
        $self->output($out);
        $self->error_message(Dumper $error_obj);
        $self->content_type("application/json");
    }
    else {
        if ( $BAD_STATUS_MAP->{$http_status} ) {
            $self->error_message($msg);
        }
    }
    
    return;
}

1;


__END__

=head1 NAME

Ahs::REST::Engine - extended WOA::REST::Engine engine for Maillist

=head2 SYNOPSIS

[TODO]

=head2 DESCRIPTION

[TODO]

=head2 EXAMPLES

[TODO]

=head2 EXPORT

[TODO]

=head2 SEE ALSO

[TODO]

=head2 AUTHOR

plcgi E<lt>plcgi1 at gmail dot com<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2010 by plcgi1

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.7 or,
at your option, any later version of Perl 5 you may have available.


=cut
