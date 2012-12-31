#!/usr/bin/perl -w

use strict;
use Getopt::Long;
use Pod::Usage;
use DBIx::Class::Schema::Loader qw/make_schema_at dump_to_dir/;

use WOA::Config::Provider;
use FindBin qw($Bin);

my ($help);

GetOptions(
    'help|?'    => \$help,
);

pod2usage(1) if $help;

my $wcp = WOA::Config::Provider->new();
my $config = $wcp->get_config($Bin.'/../etc/Alphumanservice.conf');

make_schema_at(
    "Alphumanservice::Model::DBIx",
    { debug => 1, dump_directory => './lib' },
    [ $config->{connect_info}->[0],$config->{connect_info}->[1],$config->{connect_info}->[2] ]
);
exit(0);

1;

=head1 NAME

genschema.pl - database schema generator

=head1 SYNOPSIS

genschema.pl [options]
 
 Options:
   -? -help     help 

=head1 DESCRIPTION

database schema generator

=head1 AUTHOR


=head1 COPYRIGHT

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
