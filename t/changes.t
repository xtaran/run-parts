#!perl -T

use Test::More;

unless ( $ENV{RELEASE_TESTING} ) {
    plan( skip_all => "these tests are for release candidate testing" );
}

eval 'use Test::CPAN::Changes 0.23';
plan skip_all => 'Test::CPAN::Changes >= 0.23 required for this test' if $@;
changes_ok();
