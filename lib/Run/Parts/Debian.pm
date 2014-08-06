package Run::Parts::Debian;

use Modern::Perl;
use Run::Parts::Common;

=encoding utf8

=head1 NAME

Run::Parts::Debian - Perl interface to Debian's run-parts tool

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

Perl interface to Debian's L<run-parts(8)> tool. L<run-parts(8)> runs
all the executable files named within constraints described below,
found in the given directory.  Other files and directories are
silently ignored.

Additionally it can just print the names of the all matching files
(not limited to executables, but ignores blacklisted files like
e.g. backup files), but don't actually run them.

This is useful when functionality or configuration is split over
multiple files in one directory.

This module is not thought to be used directly and its interface may
change. See L<Run::Parts> for a stable user interface.

=head1 METHODS

=head2 new (Constructor)

Creates a new L<Run::Parts> object. Takes one parameter, the directory on
which run-parts should work.

=cut

sub new {
    my $self = {};
    bless($self, shift);
    $self->{dir} = shift;

    return $self;
}

=head2 run_parts_command

Returns the L<run-parts(8)> command to run with the given command
parameter

=cut

sub run_parts_command {
    my $self = shift;
    my $rp_cmd = shift;

    my $command =
        "/bin/run-parts " .
        ((defined($rp_cmd) and $rp_cmd ne '') ? "'--$rp_cmd'" : '') .
        " '".$self->{dir}."'";

    return chomped_lines(`$command`);
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

    perldoc Run::Parts::Debian


=head1 LICENSE AND COPYRIGHT

Copyright 2013 Axel Beckert.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See L<http://dev.perl.org/licenses/> for more information.

=cut

1; # End of Run::Parts
