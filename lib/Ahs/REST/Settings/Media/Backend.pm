package Ahs::REST::Settings::Media::Backend;
use common::sense;
use base 'Ahs::REST::Backend';
use Data::Dumper;


sub save {
    my ( $self, $param ) = @_;

    my $config  = $self->get_config;
    my $session = $self->get_session();
    my $model = $self->get_model;
    my $fmt = $self->get_formatter;
    $param->{media} = $self->get_request->uploads->{media};
    
    my $rs = $model->resultset('UserMedia')->find_or_create(
        {'user_id' => $session->{user}->{id} },
    );
    
    if ( $rs ) {
        my @arr;
        open F,$param->{media}->tempname || die "Cant open file ".$param->{media}->tempname." - '$!'";
        while ( my $line = <F> ) {
            push @arr,$line;
        }
        close F;
        $rs->content(join '',@arr);
        $rs->filename($param->{media}->filename);
        $rs->content_type($param->{media}->content_type);
        $rs->size($param->{media}->size);
        $rs->update();
        $param->{id} = $rs->get_column('id');
    }        

    #warn Dumper $file;
    # make return with values - for tests
    my $res = {
        content_type    => $param->{media}->content_type,
        size            => $param->{media}->size,
        filename        => $param->{media}->filename
    };

    return $res;
}


sub get {
    my ( $self, $param ) = @_;

    my $config  = $self->get_config;
    my $session = $self->get_session();
    my $model   = $self->get_model;
    my $fmt     = $self->get_formatter;
    
    my $rs = $model->resultset('UserMedia')->single(
        {'user_id' => $session->{user}->{id} },
    );
        
    # make return with values - for tests
    my $res = {};
    if($rs) {
        $res = {
            filename        => $rs->get_column('filename'),
            content_type    => $rs->get_column('content_type'),
            content         => $rs->get_column('content'),
            size            => $rs->get_column('size')    
        }
    }
    return $res;
}

sub remove {
    my ( $self, $param ) = @_;

    my $config  = $self->get_config;
    my $session = $self->get_session();
    
    # make return with values - for tests
    my $res = { status => 'ok' };

    return $res;

}



1;

__END__

=head1 Ahs::REST::Settings::Passport::Backend


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
