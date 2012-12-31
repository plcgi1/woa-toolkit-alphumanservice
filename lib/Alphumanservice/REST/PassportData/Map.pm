package Alphumanservice::REST::PassportData::Map;
use strict;

my $map = [
    {
        # regexp or absolute value for url to service
        regexp    => '/ahs/passport',
        # func name in Backend module
        func_name => 'save',
        # unique name for service - used in javascript validator rules
        name      => 'save_passport',
        in        => {
            skip_from_uri => 1,
            param         => [
                # some patterns to define field names and validation rules
                # all rule names - in WOA::Validator::Rules::Base
                { name => 'id',         rules => [ {rule => 'integer' } ], error => "Bad value for geo coordinates" },
                { name => 'user_id',    rules => [ {rule => 'integer' } ], required => 1,error => "Bad value for user_id" },
                { name => 'number',     rules => [ {rule => 'anyText' } ], required => 1,error => "Bad value for 'number'" },
                { name => 'serial',     rules => [ {rule => 'anyText' } ], error => "Bad value for 'serial'" },
                { name => 'date',     rules => [ {rule => 'simple_date_dmy' } ], error => "Bad value for 'date'" },
                { name => 'birth_date',     rules => [ {rule => 'simple_date_dmy' } ], error => "Bad value for 'birth_date'" },
                { name => 'place',     rules => [ {rule => 'anyText' } ], error => "Bad value for 'place'" },
                { name => 'birth_place',     rules => [ {rule => 'anyText' } ], error => "Bad value for 'birth_place'" },
            ]
        },
        # service output description
        out			=>	{
            mime_type => 'text/javascript',
            # methods from View - you can implement your own
            view_method => 'as_json'
        },
        
        # maybe POST GET PUT DELETE
        req_method => 'POST'
    },
    {
        # regexp or absolute value for url to service
        regexp    => '/ahs/passport',
        # func name in Backend module
        func_name => 'get',
        # unique name for service - used in javascript validator rules
        name      => 'get_passport',
        in        => {
            skip_from_uri => 1,
            param         => [
                # some patterns to define field names and validation rules
                # all rule names - in WOA::Validator::Rules::Base
                { name => 'id',         rules => [ {rule => 'integer' } ], error => "Bad value for geo coordinates" },
                { name => 'user_id',    rules => [ {rule => 'integer' } ], error => "Bad value for user_id" },
                { name => 'number',     rules => [ {rule => 'anyText' } ], required => 1,error => "Bad value for 'number'" },
                { name => 'serial',     rules => [ {rule => 'anyText' } ], error => "Bad value for 'serial'" },
                { name => 'date',     rules => [ {rule => 'simple_date_dmy' } ], error => "Bad value for 'date'" },
                { name => 'sord',       rules => [ {rule => 'pattern',param => '^(asc|desc)$'} ], error => "Bad value for 'sord'" },
                { name => 'page',           rules => [ {rule => 'integer'} ] },
                { name => 'rows',           rules => [ {rule => 'integer'} ] },
                { name => 'sidx',           rules => [ {rule => 'anyText'} ] },
            ]
        },
        # service output description
        out			=>	{
            mime_type => 'text/javascript',
            # methods from View - you can implement your own
            view_method => 'as_json'
        },
        
        # maybe POST GET PUT DELETE
        req_method => 'GET'
    },
    {
        # regexp or absolute value for url to service
        regexp    => '/ahs/passport',
        # func name in Backend module
        func_name => 'remove',
        # unique name for service - used in javascript validator rules
        name      => 'remove_passport',
        in        => {
            skip_from_uri => 1,
            param         => [
                # some patterns to define field names and validation rules
                # all rule names - in WOA::Validator::Rules::Base
                { name => 'id',         rules => [ {rule => 'integer' } ], error => "Bad value for geo coordinates" },
                { name => 'user_id',    rules => [ {rule => 'integer' } ], error => "Bad value for user_id" },
            ]
        },
        # service output description
        out			=>	{
            mime_type => 'text/javascript',
            # methods from View - you can implement your own
            view_method => 'as_json'
        },
        
        # maybe POST GET PUT DELETE
        req_method => 'DELETE'
    }
];

sub get_map { return $map; }

1;

__END__


=head1 REST::Alphumanservice::REST::PassportData::Map - [TODO]

=head2 SYNOPSIS

[TODO]

=head2 DESCRIPTION

[TODO]

=head2 EXAMPLES

Possible values for items in @$map ( you can copy paste them for your real service)
    {
        # regexp or absolute value for url to service
        regexp    => '*',
        # func name in Backend module
        func_name => 'handler_name_for_method',
        # unique name for service - used in javascript validator rules
        name      => 'UNIQ_NAME_FOR_SERVICE',
        # the way to check input params
        in        => {
            how          => 'from_uri',
            rule_for_all => 'integer'
        },
        # or
        in        => {
            skip_from_uri => 1,
            param         => [
                # some patterns to define field names and validation rules
                # all rule names - in WOA::Validator::Rules::Base
                #{ name => 'id',         rules => [ {rule => 'integer' } ], required => 1,error => "Some error message" },
                #{ name => 'id',         rules => [ {rule => 'float' } ], required => 1,error => "Some error message" },
                #{ name => 'title',      rules => [ {rule => 'anyText'} ], error => "Some error message" },
                #{ name => 'sord',       rules => [ {rule => 'pattern',param => '^(asc|desc)$'} ], error => "Some error message" },
                #{ name => 'email',      rules => [ {rule => 'email'} ], error => "Some error message" },
                #{ name => 'time_from',  rules => [ {rule => 'soft_iso8601'} ], error => "Some error message" },
            ]
        },
        # service output description
        out			=>	{
            mime_type => 'text/javascript',
            # methods from View - you can implement your own
            view_method => 'as_json'
        },
        
        # maybe POST GET PUT DELETE
        req_method => 'POST|GET|PUT|DELETE'
    }
    
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
