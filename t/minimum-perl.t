#!perl

use Test::More;
unless ( $ENV{RELEASE_TESTING} ) {
    plan( skip_all => "these tests are for release candidate testing" );
}

use Test::MinimumVersion;
all_minimum_version_ok('5.010');
