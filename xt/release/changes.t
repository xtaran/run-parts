#!perl -T

use strict;
use warnings;
use 5.010;

use Test::More;

my $min_tcc = 0.23;
eval "use Test::CPAN::Changes $min_tcc";
plan skip_all => "Test::CPAN::Changes >= $min_tcc required for this test" if $@;
changes_ok();
