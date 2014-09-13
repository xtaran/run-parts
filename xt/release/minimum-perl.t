#!perl

use strict;
use warnings;
use 5.010;

use Test::More;

eval 'use Test::MinimumVersion;';
plan skip_all => 'Test::MinimumVersion required for this test' if $@;
all_minimum_version_ok('5.010');
