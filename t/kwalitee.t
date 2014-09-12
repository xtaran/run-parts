#!perl

use Test::More;

unless ( $ENV{RELEASE_TESTING} ) {
    plan( skip_all => "these tests are for release candidate testing" );
}

eval 'use Test::Kwalitee qw(kwalitee_ok)';
plan skip_all => 'Test::Kwalitee required for this test' if $@;

kwalitee_ok();
kwalitee_ok(qw(use_warnings
               proper_libs
               metayml_conforms_spec_current
               metayml_declares_perl_version
               metayml_has_license
               has_separate_license_file));
done_testing();
