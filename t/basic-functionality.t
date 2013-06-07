#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More;
use Test::Differences;

use Run::Parts;

my $rp = Run::Parts->new('t/basic-dummy');
ok($rp, 'Run::Parts->new() returned non-nil');

# List files
eq_or_diff([$rp->list], [qw[bar.bla foo script.pl script2.pl]], "Returns list of files in array context");
eq_or_diff(''.$rp->list, "bar.bla\nfoo\nscript.pl\nscript2.pl\n", "Returns list of files in string context");

# List executable files
eq_or_diff([$rp->test], [qw[script.pl script2.pl]], "Returns list of executables in array context");
eq_or_diff(''.$rp->test, "script.pl\nscript2.pl\n", "Returns list of executables in string context");

# Executes executable files
eq_or_diff(''.$rp->run, "Works\nWorks, too!\n", "Returns output of ran executables");

done_testing();
