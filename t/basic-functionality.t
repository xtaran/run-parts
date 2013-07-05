#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More tests => 12;
use Test::Differences;

delete $ENV{PATH};

my $runpartsbin = '/bin/run-parts';
my $d = 't/basic-dummy';

use Run::Parts;

SKIP: {
    skip("$runpartsbin not found or not executable", 6)
        unless -x $runpartsbin;
    run_test_on_rp($d, 'debian')
}

run_test_on_rp($d, 'perl');

sub run_test_on_rp {
    my ($d, $desc) = @_;
    my $rp = Run::Parts->new($d, $desc);


    ok($rp, 'Run::Parts->new($desc) returned non-nil');

    # List files
    eq_or_diff([$rp->list],
               [map { "$d/$_" } qw[bar foo script script2]],
               "Returns list of files in array context");

    eq_or_diff(''.$rp->list,
               "$d/bar\n$d/foo\n$d/script\n$d/script2\n",
               "Returns list of files in string context");

    # List executable files
    eq_or_diff([$rp->test],
               [map { "$d/$_" } qw[script script2]],
               "Returns list of executables in array context");
    eq_or_diff(''.$rp->test,
               "$d/script\n$d/script2\n",
               "Returns list of executables in string context");

    # Executes executable files
    eq_or_diff(''.$rp->run,
               "Works\nWorks, too!\n",
               "Returns output of ran executables");
}
