package Alphumanservice::REST::Engine;
use strict;
use Data::Dumper;
use JSON::XS;
use parent 'WOA::REST::Engine';

my $OK_STATUS_MAP = {
    PUT         =>  200,
    GET         =>  200,
    POST        =>  200,
    DELETE      =>  200
};
my $BAD_STATUS_MAP = {
    400 => 'Bad request',
    401 => 'Forbidden',
    404 => 'Not found'
};

sub process {
    my ( $self, $query_args ) = @_;
    return $self->SUPER::process($query_args);
}

sub finalize {
    my($self,$method_data,$res)=@_;

    $self->ok_status_map($OK_STATUS_MAP);
    $self->SUPER::finalize($method_data,$res);
    return;
}

sub check_access { 1; }

sub _fill_args {
    my ( $self, $data ) = @_;

    my $ct = $self->request->{env}->{CONTENT_TYPE};
    my $param;
    if ( $ct =~/application\/json/ ) {
        my $json = JSON::XS->new->allow_nonref;

        eval { $param = $json->decode($self->request->content) };
    }
    
    my $session = $self->backend->get_session;
    if( $session && $session->{user} ){
        $param->{user_id} = $session->{user}->{id};
    }
    
    if ( $param ) {
        if(ref $param eq 'ARRAY'){
            $param = $param->[0];
        }
        if( exists $param->{url} ){
            $param->{url} =~s/&#47;/\//g;
        }
        foreach ( @{$data} ) {
           my $v = $param->{$_->{name}};
           $_->{value} = $v;
        }

    }
    else {
        $self->SUPER::_fill_args($data)
    }
    
    $self->args_filled(1);

    return;
}

sub set_error {
    my($self,$http_status,$msg,$message_data,$is_valid)=@_;
    
    my $user_data = $self->backend->get_session()->{user};
    
    $self->status($http_status);
    my $error_obj;
    my $fmt = $self->formatter();
    $msg = $fmt->encode_utf($msg);
    my $session = $self->backend->{'session'};
    my $user = $session->{'user'};
    if ( ref $message_data eq 'WOA::Validator::ErrorCode' ) {
        $error_obj = $message_data;
    }
    elsif ( ref $is_valid eq 'WOA::Validator::ErrorCode' ) {
        $error_obj = $is_valid;
    }
    elsif ( ref $message_data eq 'HASH' ) {
        if( $message_data->{out}->{mime_type} eq 'text/html' && !$message_data->{public} && !$user ){
            $self->status(303);
            $self->location('/login?'.$self->env->{QUERY_STRING});
        }
        if( $message_data->{out}->{mime_type} eq 'text/html' && !$message_data->{public} && $user ){
            $self->error_message(Dumper $message_data);
            my $out = $self->view->as_json({
                Message => $msg,
                Class   => 'error'
            });
            $self->output($out);
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

Alphumanservice::REST::Engine - extended WOA::REST::Engine engine for Frontend

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

Copyright (C) 2012 by plcgi1

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.7 or,
at your option, any later version of Perl 5 you may have available.


=cut
