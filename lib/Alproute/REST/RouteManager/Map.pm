package Alproute::REST::RouteManager::Map;
use strict;

my $map = [
    {
        regexp    => '/rest/alproute(\/\d)*$',
        func_name => 'list',
        in        => {
            #skip_from_uri => 1,
            how => { method => 'from_uri', pattern => '/rest/alproute/:id' },
            public        => 1,
            param         => [
                # some patterns to define field names and validation rules
                # all rule names - in WOA::Validator::Rules::Base
                { name => 'id',         rules => [ {rule => 'integer' } ], error => "Bad id" },
            ]
        },
        out			=>	{ mime_type => 'text/javascript', view_method => 'as_json' },
        req_method => 'GET'
    },
    {
        regexp    => '/rest/alproute/leaf/(\d+)$',
        func_name => 'leafs',
        in        => {
            #skip_from_uri => 1,
            how => { method => 'from_uri', pattern => '/rest/alproute/leaf/:id' },
            public        => 1,
            param         => [
                # some patterns to define field names and validation rules
                # all rule names - in WOA::Validator::Rules::Base
                { name => 'id',         rules => [ {rule => 'integer' } ], required => 1, error => "Bad id" },
            ]
        },
        out			=>	{ mime_type => 'text/javascript', view_method => 'as_json' },
        req_method => 'GET'
    },
];

sub get_map { return $map; }

1;

__END__


=head1 Alproute::REST::RouteManager::Map - [TODO]

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
