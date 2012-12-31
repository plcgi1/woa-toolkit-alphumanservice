#!/usr/bin/perl -w

use strict;
use FindBin qw($Bin);
use lib ($Bin.'/../lib');
use Alphumanservice::Model::DBIx;
use WOA::Config::Provider;

my $wcp = WOA::Config::Provider->new();
my $config = $wcp->get_config($Bin.'/../etc/Alphumanservice.conf');

my $schema = Alphumanservice::Model::DBIx->connect($config->{connection_info});
$schema->create_ddl_dir(['MySQL'],'0.1','./dbscriptdir/');
exit(0);