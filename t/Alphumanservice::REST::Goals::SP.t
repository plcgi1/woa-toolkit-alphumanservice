#!/usr/bin/perl -w
package main;
use strict;
use Test::More qw(no_plan);
use FindBin qw($Bin);
use lib ( $Bin . '/../lib', $Bin . '/lib', );

BEGIN { use_ok 'Alphumanservice::REST::Goals::SP' }

Alphumanservice::REST::Goals::Tester->process();

package Alphumanservice::REST::Goals::Tester;
use strict;
use Alphumanservice::REST::Goals::SP;
use Alphumanservice::REST::Goals::Map;
     
use WOA::REST::Generic::Request;
use WOA::Test::Data;
use Data::Dumper;

use base 'WOA::Test::Base';

my $CLASS = __PACKAGE__;

my ($sp,$map,$good_data,$bad_data,$rest,$req);

sub set_up {
    my $self = shift;
    
    my $tb = __PACKAGE__->builder;
        
    $sp = Alphumanservice::REST::Goals::SP->new;
    $rest = $sp->service_object();
    $map = Alphumanservice::REST::Goals::Map::get_map;
    
    return;
}

sub tear_down {
    return '';
}

sub run {
    my($self,$methods) = @_;
    my $tb = __PACKAGE__->builder;
    
    $good_data = $methods->data_for_service($good_data,$map,WOA::Test::Data::good_data);
    $bad_data = $methods->data_for_service($bad_data,$map,WOA::Test::Data::bad_data,1);

    my ($res,$req);
    foreach (@$map) {
        if ($_->{in} && $_->{in}->{param}) {
            $req = $methods->set_request($_,$good_data->{$_->{func_name}});
            $rest->request($req);
            $res = $rest->process;
            my $re = $methods->status_re_for_test($_->{req_method});
            $tb->like($rest->status, $re,$_->{req_method}.": response OK");
        }
    }
    
    return;
}

1;
