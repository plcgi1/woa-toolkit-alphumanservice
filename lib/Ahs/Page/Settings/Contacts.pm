package Ahs::Page::Settings::Contacts;
use common::sense;
use base 'Ahs::Page';
use Data::Dumper;
use Ahs::REST::Settings::Contacts::Backend;

sub get_map {
    my $map = [
        {
            regexp    => '/settings/contacts',
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
    
    if($session->{user}){
        my $be = Ahs::REST::Settings::Contacts::Backend->new({
            session => $session,config=>$config,model => $self->get_model
        });
        my $rs = $be->get();
        foreach ( keys %$rs ) {
            $self->get_stash->{$_} = $rs->{$_}; 
        }
    }
    
    $self->get_stash->{template} = 'Ahs/Page/Settings/Contacts.tpl';

    return $self->get_stash;
}

1;

__END__

=head1 Ahs::Page::Settings::Contacts


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
