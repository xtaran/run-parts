#!perl

use Test::More;

unless ( $ENV{RELEASE_TESTING} ) {
    plan( skip_all => "these tests are for release candidate testing" );
}

eval 'use Test::Kwalitee qw(kwalitee_ok)';
plan skip_all => 'Test::Kwalitee required for this test' if $@;

kwalitee_ok();
done_testing();
