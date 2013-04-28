package Ahs::REST::Confirm::Backend;
use common::sense;
use Data::Dumper;
use base qw/Ahs::REST::Backend Ahs::Component::ProjectData/;

sub save {
    my ( $self, $param ) = @_;

    my $config  = $self->get_config;
    my $session = $self->get_session();
    my $model = $self->get_model();
     
    # make return with values - for tests
    my $res = $self->process($model,$session,$param);
    unless ( $res->{errors} ) {
        delete $session->{geodata};
        delete $session->{users};
        delete $session->{project_data};
        delete $session->{goals};
    }
    return $res;
}

1;

__END__

=head1 Ahs::REST::Confirm::Backend


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
