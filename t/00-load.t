#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'Run::Parts' ) || print "Bail out!\n";
}

diag( "Testing Run::Parts $Run::Parts::VERSION, Perl $], $^X" );
