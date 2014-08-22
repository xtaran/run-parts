#!perl -T

use Test::More;
eval 'use Test::CPAN::Changes 0.23';
plan skip_all => 'Test::CPAN::Changes >= 0.23 required for this test' if $@;
changes_ok();
