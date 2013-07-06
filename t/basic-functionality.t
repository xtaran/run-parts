#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More tests => 18;
use Test::Differences;

delete $ENV{PATH};

my $runpartsbin = '/bin/run-parts';
my $d = 't/basic-dummy';

use Run::Parts;

# Testing the Debian backend
SKIP: {
    skip("$runpartsbin not found or not executable", 6)
        unless -x $runpartsbin;
    run_test_on_rp($d, 'debian')
}

# Testing the perl backend
run_test_on_rp($d, 'perl');

# Testing the automatically chosen backend
run_test_on_rp($d);

sub run_test_on_rp {
    my ($d, $desc) = @_;
    my $rp = Run::Parts->new($d, $desc);

    $desc ||= 'default';

    ok($rp, 'Run::Parts->new($desc) returned non-nil');

    # List files
    eq_or_diff([$rp->list],
               [map { "$d/$_" } qw[bar foo script script2]],
               "Returns list of files in array context ($desc)");

    eq_or_diff(''.$rp->list,
               "$d/bar\n$d/foo\n$d/script\n$d/script2\n",
               "Returns list of files in string context ($desc)");

  SKIP: {
      skip("Listing unix executables on DOS or Windows does not work", 3)
          if ($^O eq 'dos' or $^O eq 'os2' or $^O eq 'MSWin32');

      # List executable files
      eq_or_diff([$rp->test],
                 [map { "$d/$_" } qw[script script2]],
                 "Returns list of executables in array context ($desc)");
      eq_or_diff(''.$rp->test,
                 "$d/script\n$d/script2\n",
                 "Returns list of executables in string context ($desc)");

      # Executes executable files
      eq_or_diff(''.$rp->run,
                 "Works\nWorks, too!\n",
                 "Returns output of ran executables ($desc)");
    }
}
