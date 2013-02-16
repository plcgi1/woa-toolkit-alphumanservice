package Ahs::REST::Auth::SP;
use strict;
use Ahs::REST::Auth::Backend;
use Ahs::REST::Auth::Map;
use Ahs::REST::Engine;
use Ahs::REST::View;

use base 'WOA::REST::ServiceProvider';

__PACKAGE__->mk_accessors(qw/model session formatter config/);

sub init {
    my ( $self, $env ) = @_;
    $self->{param} = $env;
    return;
}

sub service_object {
    my ( $self, $env ) = @_;

    my $view    = Ahs::REST::View->new();
    my $backend = Ahs::REST::Auth::Backend->new(
        {
            model       => $env->{model},
            formatter   => $env->{formatter},
            request     => $env->{request},
            fast_storage => $env->{fast_storage},
            config    => $env->{config},
            session   => $env->{session},
            env       => $env->{env}
        }
    );

    my $rest = Ahs::REST::Engine->new(
        {
            map       => Ahs::REST::Auth::Map->get_map,
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

=head1 Ahs::REST::Auth


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
