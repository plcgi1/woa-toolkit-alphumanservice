package Ahs::REST::Auth::Map;
use strict;

my $map = [
    {
        regexp    => '/ahs/auth',
        func_name => 'login',
        public    => 1,
        in        => {
            skip_from_uri => 1,
            param         => [
                { name => 'login',         rules => [ {rule => 'latinString' } ], required => 1,error => "Bad login" },
                { name => 'password',      rules => [ {rule => 'anyText'} ], required => 1, error => "Bad password" },
                #{ name => 'token',       rules => [ {rule => 'latinString',} ], required => 1, error => "Bad token" },
                { name => 'ttl',       rules => [ {rule => 'integer',} ], error => "Bad ttl" },
            ]
        },
        #redirect    => 1,
        out			=>	{ mime_type => 'application/json', view_method => 'as_json' },
        req_method => 'POST'
    },
    {
        regexp    => '/ahs/auth',
        func_name => 'logout',
        public    => 1,
        in        => {
            skip_from_uri => 1,
            param         => [
                #{ name => 'token',       rules => [ {rule => 'latinString',} ], required => 1, error => "Bad token" },
            ]
        },
        out			=>	{ mime_type => 'application/json', view_method => 'as_json' },
        req_method => 'DELETE'
    },
    
];

sub get_map { return $map; }

1;

__END__


=head1 REST::Maillist::REST::Authenticator::Map::Map - [TODO]

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
