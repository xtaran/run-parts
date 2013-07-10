#!perl -T
use Modern::Perl;
use Test::More tests => 2;
use Test::NoWarnings;

BEGIN {
    use_ok( 'Run::Parts' ) || print "Bail out!\n";
}

diag( "Testing Run::Parts $Run::Parts::VERSION, Perl $], $^X" );
