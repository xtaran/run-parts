Run::Parts — run-parts in Perl
==============================

![Travis CI Build Status](https://travis-ci.org/xtaran/run-parts.svg)

The [Perl module `Run::Parts`](https://metacpan.org/release/Run-Parts)
offers the functionality of Debian's `run-parts` tool in Perl.

`Run::Parts` runs all the executable files named within constraints
described in `run-parts(8)` and `Run::Parts::Perl`, found in the given
directory.  Other files and directories are silently ignored.

Additionally it can just print the names of the all matching files
(not limited to executables, but ignores blacklisted files like
e.g. backup files), but don't actually run them.

This is useful when functionality or configuration is split over
multiple files in one directory. A typical convention is that
the directory name ends in ".d". Common examples for such
splitted configuration directories:

    /etc/cron.d/
    /etc/apt/apt.conf.d/
    /etc/apt/sources.list.d/,
    /etc/aptitude-robot/pkglist.d/
    /etc/logrotate.d/
    /etc/rsyslog.d/

Example Code
------------

```perl
use Run::Parts;

my $rp  = Run::Parts->new('directory'); # chooses backend automatically
my $rpp = Run::Parts->new('directory', 'perl'); # pure perl backend
my $rpd = Run::Parts->new('directory', 'debian'); # uses /bin/run-parts

my @file_list        = $rp->list;
my @executables_list = $rpp->test;
my $commands_output  = $rpd->run;
...
```

Backends
--------

`Run::Parts` contains two backend implementations.
`Run::Parts::Debian` actually uses `/bin/run-parts` and
`Run::Parts::Perl` is a pure Perl implementation of a basic set of
`run-parts`' functionality.

`Run::Parts::Debian` may or may not work with RedHat's simplified
shell-script based reimplementation of Debian's `run-parts`.

By default `Run::Parts` uses `Run::Parts::Debian` if `/bin/run-parts`
exists, `Run::Parts::Perl` otherwise. But you can also choose any of
the backends explicitly.

Author, License and Copyright
-----------------------------

Copyright 2013-2014 Axel Beckert <abe@deuxchevaux.org>.

This program is free software; you can redistribute it and/or modify
it under the terms of either: the
[GNU General Public License](https://www.gnu.org/licenses/gpl) as
published by the [Free Software Foundation](https://www.fsf.org/),
either [version 1](https://www.gnu.org/licenses/old-licenses/gpl-1.0),
or (at your option)
[any later version](https://www.gnu.org/licenses/#GPL); or the
[Artistic License](http://dev.perl.org/licenses/artistic.html).

See http://dev.perl.org/licenses/ for more information.
