#!perl -T
use Modern::Perl;
use Test::More;
use Test::Differences;

if ($^O ne 'dos' and $^O ne 'os2' and $^O ne 'MSWin32' ) {
    plan skip_all => 'Tests irrelevant on non-dos-ish systems';
} else {
    plan tests => 10;
}

delete @ENV{qw{PATH ENV IFS CDPATH BASH_ENV}};

my $d = 't/win-dummy';
my @files = qw[bar.com bla.bat foo.exe pfff.scr puff.pif unix.sh];
my @exe_files = qw[bar.com bla.bat foo.exe];

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

    # List files
    eq_or_diff([$rp->list],
               [map { "$d/$_" } @files],
               "Returns list of files in array context ($desc)");

    eq_or_diff(''.$rp->list,
               join('', map { "$d/$_\n" } @files),
               "Returns list of files in string context ($desc)");

    # List executable files
    eq_or_diff([$rp->test],
               [map { "$d/$_" } @exe_files],
               "Returns list of executables in array context ($desc)");
    eq_or_diff(''.$rp->test,
               join('', map { "$d/$_\n" } @exe_files),
               "Returns list of executables in string context ($desc)");
}
