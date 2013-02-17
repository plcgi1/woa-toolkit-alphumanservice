package Ahs::RouteMap;

use strict;
use base 'Class::Accessor::Fast';

# autogenerated by woax-toolkit.pl
# if you want edit  - edit Map.pm file for service and run "woax-toolkit.pl -a service -n YourServiceName "
# !!! DONT EDIT THIS FILE !!! #

my $rules = [
    
    { path => '/ahs/auth', class => 'Ahs::REST::Auth::SP' },
    
    { path => '/ahs/goals', class => 'Ahs::REST::Goals::SP' },
    
    { path => '/ahs/project$', class => 'Ahs::REST::Project::SP' },
    
    { path => '/ahs/settings/contacts', class => 'Ahs::REST::Settings::Contacts::SP' },
    { path => '/ahs/settings/passport', class => 'Ahs::REST::Settings::Passport::SP' },
    
    { path => '/ahs/part-form/confirm$', class => 'Ahs::REST::Confirm::SP' },
    
    { path => '/ahs/usersdata$', class => 'Ahs::REST::UserData::SP' },
    
    { path => '/ahs/geodata', class => 'Ahs::REST::GeoData::SP' },
    
    { path => '/part-form/part', class => 'Ahs::Page::Part' },
    
    { path => '/about', class => 'Ahs::Page::About' },
    
    { path => '/part-form/goals', class => 'Ahs::Page::Goals' },
    
    { path => '/part-form/place', class => 'Ahs::Page::Place' },
    
    { path => '/participants', class => 'Ahs::Page::Participants' },
    
    { path => '/part-form/project', class => 'Ahs::Page::Project' },
    
    { path => '/401', class => 'Ahs::Page::401' },
    
    { path => '/projects', class => 'Ahs::Page::Projects' },
    
    { path => '/settings/passport', class => 'Ahs::Page::Settings' },
    
    { path => '/settings/contacts', class => 'Ahs::Page::Settings' },
    
];

sub get_appid {
    return 'ahs';
}

sub get_rules { return $rules; }

1;

__END__
