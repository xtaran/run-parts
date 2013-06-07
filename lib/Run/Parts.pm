package Run::Parts;

use 5.010;
use strict;
use warnings FATAL => 'all';

=head1 NAME

Run::Parts - Perl interface to Debian's run-parts tool

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

Perl interface to Debian's run-parts tool. run-parts runs all the
executable files named within constraints described below, found in
the given directory.  Other files and directories are silently
ignored.

Additionally it can just print the names of the all matching files
(not limited to executables, but ignores blacklisted files like
e.g. backup files), but don't actually run them.

This is useful when functionality or configuration is split over
multiple files in one directory.

TODO: Perhaps a little code snippet.

    use Run::Parts;

    my $foo = Run::Parts->new();
    ...

=head1 EXPORT

A list of functions that can be exported.  You can delete this section
if you don't export anything, such as for a purely object-oriented module.

=head1 SUBROUTINES/METHODS

=head2 function1

=cut

sub function1 {
}

=head2 function2

=cut

sub function2 {
}

=head1 SEE ALSO

run-parts(8)

=head1 AUTHOR

Axel Beckert, C<< <abe@deuxchevaux.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-run-parts at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Run-Parts>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Run::Parts


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Run-Parts>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Run-Parts>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Run-Parts>

=item * Search CPAN

L<http://search.cpan.org/dist/Run-Parts/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2013 Axel Beckert.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See L<http://dev.perl.org/licenses/> for more information.


=cut

1; # End of Run::Parts
