package Run::Parts::Perl;

use Modern::Perl;
use autodie;
use Taint::Util;
use Run::Parts::Common;

=encoding utf8

=head1 NAME

Run::Parts::Perl - Pure Perl implementation of Debian's run-parts tool

=head1 VERSION

Version 0.02

=cut

our $VERSION = '0.02';

=head1 SYNOPSIS

Pure Perl reimplementation of basic functionality of Debian's
L<run-parts(8)> tool.

L<run-parts(8)> runs all the executable files named within constraints
described below, found in the given directory.  Other files and
directories are silently ignored.

Additionally it can just print the names of the all matching files
(not limited to executables, but ignores blacklisted files like
e.g. backup files), but don't actually run them.

This is useful when functionality or configuration is split over
multiple files in one directory.

This module is not thought to be used directly and its interface may
change. See L<Run::Parts> for a stable user interface.

=head1 FILE NAME CONSTRAINTS

On unix-ish operating systems, the file name (but not the path) must
match ^[-A-Za-z0-9_]+$, i.e. may not contain a dot.

On dos-ish operating systems, the file name without suffix must match
^[-A-Za-z0-9_]+$, i.e. may not contain a dot. The suffix may contain
alphanumeric characters and is not mandatory. The full regular
expression the file name including the suffix must match is
^[-A-Za-z0-9_]+(\.[A-Za-z0-9]+)?$.

Debian's L<run-parts(8)> tool also offers to use alternative regular
expressions as file name constraints. This is not yet implemented in
L<Run::Parts::Perl>.

=cut

# On DOS and Windows, run-parts' regular expressions are not really
# applicable. Allow an arbitrary alphanumerical suffix there.
my $win_suffix = dosish() ? qr/\.[a-z0-9]+/i : qr'';
my $file_re = qr/^[-A-Za-z0-9_]+($win_suffix)?$/;

=head1 METHODS

=head2 new (Constructor)

Creates a new L<Run::Parts> object. Takes one parameter, the directory
on which run-parts should work.

=cut

sub new {
    my $self = {};
    bless($self, shift);
    $self->{dir} = shift;

    return $self;
}

=head2 run_parts_command

Executes the given action with the given parameters

=cut

sub run_parts_command {
    my $self = shift;
    my $rp_cmd = shift // 'run';

    my @result = $self->$rp_cmd(@_);

    return lines(@result);
}

=head2 list

Lists all relevant files in the given directory. Equivalent to
"run-parts --list". Returns an array.

=cut

sub list {
    my $self = shift;
    my $dir = $self->{dir};

    opendir(my $dh, $dir);
    my @list = sort map {
        if (defined($dir) and $dir ne '') {
            "$dir/$_";
        } else {
            $_;
        }
    } grep {
        /$file_re/
    } readdir($dh);
}

=head2 test

Lists all relevant executables in the given directory. Equivalent to
"run-parts --tests". Returns an array.

=cut

sub test {
    my $self = shift;
    my $dir = $self->{dir};

    return grep { -x } $self->list($dir);
}

=head2 run

Executes all relevant executables in the given directory. Equivalent to
"run-parts --tests". Returns an array.

=cut

sub run {
    my $self = shift;
    my $dir = $self->{dir};

    return map {
        untaint($_);
        s(/)(\\)g if dosish();
        my $output = `$_`;
        chomp($output);
        $output;
    } $self->test($dir);
}

=head1 INTERNAL FUNCTIONS

=head2 dosish

Returns true if ran on a dos-ish platform, i.e. MS-DOS, Windows or
OS/2.

=cut

sub dosish {
    return $^O =~ /^(dos|os2|MSWin32)$/;
}

=head1 SEE ALSO

L<Run::Parts>, L<run-parts(8)>


=head1 AUTHOR

Axel Beckert, C<< <abe@deuxchevaux.org> >>


=head1 BUGS

Please report any bugs or feature requests to C<bug-run-parts at
rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Run-Parts>.  I will
be notified, and then you'll automatically be notified of progress on
your bug as I make changes.


=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Run::Parts::Perl


=head1 LICENSE AND COPYRIGHT

Copyright 2013-2014 Axel Beckert.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See L<http://dev.perl.org/licenses/> for more information.

=cut

1; # End of Run::Parts::Perl
