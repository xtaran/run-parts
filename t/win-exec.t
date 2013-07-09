#!perl
# -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More;
use Test::Differences;

if ($^O ne 'dos' and $^O ne 'os2' and $^O ne 'MSWin32' ) {
    plan skip_all => 'Tests irrelevant on non-dos-ish systems';
} else {
    plan tests => 4;
}

delete $ENV{PATH};

my $d = 't\win-exec-dummy';
my @exe_files = qw[bla.bat foo.bat];

use Run::Parts;

# Testing the perl backend
run_test_on_rp($d, 'perl');

# Testing the automatically chosen backend
run_test_on_rp($d);

sub run_test_on_rp {
    my ($d, $desc) = @_;
    my $rp = Run::Parts->new($d, $desc);

    $desc ||= 'default';

    ok($rp, 'Run::Parts->new($desc) returned non-nil');

    # Executes executable files
    eq_or_diff(''.$rp->run,
               "foobla\nfoofoo\n",
               "Returns output of ran executables ($desc)");
}

