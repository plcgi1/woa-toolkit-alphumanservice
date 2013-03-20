package Ahs::REST::Settings::Media::Engine;
use strict;
use Data::Dumper;
use JSON::XS;
use URI::Escape qw/uri_unescape/;
use IO::File;
use WOA::Validator::ErrorCode;
use parent 'Ahs::REST::Engine';

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

sub validate {
    my( $self,$validator,$args )=@_;
    
    my $config = $self->backend->get_config;
    my $fmt = $self->formatter;
    # делаем стандартную валидацию
    my $res = $self->SUPER::validate($validator,$args);
    if( ref $res eq 'WOA::REST::Error' ){
        return $self->set_error($res->status,$res->message);
    }
    if ( $self->request->method eq 'POST' ){
        # допустимый размер    
        if ( $self->request->uploads->{media}->size > $config->{media}->{user_image}->{maxsize} ) {
            $res = WOA::Validator::ErrorCode->new();
            $res->errorFields([
                { name => 'media', error => $fmt->encode_utf('Недопустимый размер файла') }
            ]);
        }
        # допустимый типа файла
        my $file_type = $self->request->uploads->{media}->content_type;
        my $accept;
        unless ( ref $config->{media}->{user_image}->{accept} eq 'ARRAY' ) {
            $config->{media}->{user_image}->{accept} = [$config->{media}->{user_image}->{accept}];
        }
        foreach ( @{$config->{media}->{user_image}->{accept}} ) {
            if( $file_type eq $_ ) {
                $accept = 1;
                last;
            }
        }
        unless ( $accept ) {
            $res = WOA::Validator::ErrorCode->new();
            $res->errorFields([
                { name => 'media', error => $fmt->encode_utf('Недопустимый формат файла') }
            ]);
        }
    }
    return $res;
}

sub process {
    my($self,$query_args)=@_;
    
    $self->SUPER::process($query_args);
    
    return;
}

#sub finalize {
#    my($self,$method_data,$res)=@_;
#
#    $self->ok_status_map($OK_STATUS_MAP);
#        
#    if ( $self->request->method eq 'GET' ){
#        # output headers content_type
#        my %headers;
#        $self->content_type($res->{content_type}.';name="'.$res->{filename}.'"');
#        
#        #$headers{last_modified} = $res->{mtime};
#        $headers{'Content-Disposition'} = 'attachment; filename="'.$res->{filename}.'"';
#        $headers{'Accept-Ranges'} = 'bytes';
#        $headers{'Content-Type'} = $self->content_type;
#        $self->headers(\%headers);
#        
#        binmode $res->{content};
#        $self->output( $res->{content} );
#        $self->status(200);
#    }
#    else {
#        $self->SUPER::finalize($method_data,$res);
#    }
#    $self->res($res);
#    
#    return;
#}


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
