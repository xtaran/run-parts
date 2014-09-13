#!perl

use strict;
use warnings;
use 5.010;

use Test::More;

eval 'use Test::Kwalitee qw(kwalitee_ok)';
plan skip_all => 'Test::Kwalitee required for this test' if $@;

kwalitee_ok();
done_testing();
