#!perl -T
use Modern::Perl;
use Test::More;
use Test::Warnings qw(warning);
use Test::Differences;
use File::Slurp 9999.06;

delete @ENV{qw{PATH ENV IFS CDPATH BASH_ENV}};

my $d = 't/basic-dummy';

use Run::Parts;

like(warning { eval { Run::Parts->new($d, 'foobar'); }},
     qr/Unknown backend foobar in use/,
     "Warn's about unknown backends");

done_testing();
