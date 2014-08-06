package Run::Parts::Common;

use Modern::Perl;
use Exporter::Easy ( EXPORT => [qw[lines chomped_lines]] );
use Scalar::Util qw(blessed);

=encoding utf8

=head1 NAME

Run::Parts::Common - Common helpers for Run::Parts and its backends

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

Exports helper functions used by L<Run::Parts> as well as its backends.

=head1 EXPORTED FUNCTIONS

=head2 lines

Gets an array of strings as parameter.

In scalar context returns a string with all lines concatenated. In
array context it passes through the array.

=cut

sub lines {
    # Sanity check
    die "lines is no method" if blessed $_[0];

    return wantarray ? @_ : join("\n", @_)."\n";
}

=head2 chomped_lines

Gets an array of strings as parameter and calls chomp() on it.

In scalar context returns a string with all lines concatenated. In
array context it passes through the array.

=cut

sub chomped_lines {
    # Sanity check
    die "chomped_lines is no method" if blessed $_[0];

    chomp(@_);
    return lines(@_);
}



=head1 SEE ALSO

L<Run::Parts>


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

    perldoc Run::Parts::Common


=head1 LICENSE AND COPYRIGHT

Copyright 2013 Axel Beckert.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See L<http://dev.perl.org/licenses/> for more information.

=cut

1; # End of Run::Parts::Common
