package Alphumanservice::REST::DischargeData::SP;
use strict;
use Alphumanservice::REST::DischargeData::Backend;
use Alphumanservice::REST::DischargeData::Map;
use Alphumanservice::REST::Engine;
use Alphumanservice::REST::View;

use base 'WOA::REST::ServiceProvider';

__PACKAGE__->mk_accessors(qw/model session formatter config/);

sub init {
    my ( $self, $env ) = @_;
    $self->{param} = $env;
    return;
}

sub service_object {
    my ( $self, $env ) = @_;

    my $view    = Alphumanservice::REST::View->new();
    my $backend = Alphumanservice::REST::DischargeData::Backend->new(
        {
            model     => $env->{model},
            formatter => $env->{formatter},
            config    => $env->{config},
            session   => $env->{session},
            env       => $env->{env}
        }
    );

    my $rest = Alphumanservice::REST::Engine->new(
        {
            map       => Alphumanservice::REST::DischargeData::Map->get_map,
            backend   => $backend,
            view      => $view,
            session   => $env->{session},
            model     => $env->{model},
            formatter => $env->{formatter},
        }
    );

    return $rest;
}

1;

__END__

=head1 Alphumanservice::REST::DischargeData


=head2 SYNOPSIS

[TODO]

=head2 DESCRIPTION

[TODO]

=head2 SEE ALSO

[TODO]

=head1 AUTHOR

plcgi E<lt>plcgi1 at gmail dot com<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2010 by plcgi1

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.7 or,
at your option, any later version of Perl 5 you may have available.


=cut
