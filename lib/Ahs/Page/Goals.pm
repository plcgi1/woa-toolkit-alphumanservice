package Ahs::Page::Goals;
use common::sense;
use base 'Ahs::Page';
use Ahs::REST::Goals::Backend;
use Data::Dumper;

sub get_map {
    my $map = [
        {
            regexp    => '/part-form/goals',
            func_name => 'index',
            out       => { mime_type => 'text/html', view_method => 'as_html' },
            req_method => 'GET'
        },
    ];
    return $map;
}

sub index {
    my ( $self, $param ) = @_;

    my $config  = $self->get_config;
    my $session = $self->get_session();
    my $fmt     = $self->get_formatter;
    if($session->{goals}){
        my $be = Ahs::REST::Goals::Backend->new({
            session => $session,config=>$config
        });
        $self->get_stash->{goals}           = $be->get();
        $self->get_stash->{geodata}         = $be->_hash_to_array($session->{geodata});
        $self->get_stash->{usersdata}       = $be->_hash_to_array($session->{usersdata});
        $self->get_stash->{project_data}    = $be->_hash_to_array($session->{project_data});
    }

    $self->get_stash->{template} = 'Ahs/Page/Goals.tpl';

    return $self->get_stash;
}

1;

__END__

=head1 Ahs::Page::Goals


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
