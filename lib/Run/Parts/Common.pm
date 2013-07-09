package Run::Parts::Common;

use 5.010;
use strict;
use warnings FATAL => 'all';
use Exporter::Easy ( EXPORT => [ 'lines' ] );

=encoding utf8

=head1 NAME

Run::Parts::Common - Common helpers for Run::Parts and its backends

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

Exports helper functions used by Run::Parts as well as its backends.

=head1 EXPORTED FUNCTIONS

=head2 lines

Gets an array of strings as parameter.

In scalar context returns a string with all lines concatenated. In
array context it passes through the array.

=cut

sub lines {
    # Sanity check
    die "lines is no method" if ref $_[0];

    return wantarray ? @_ : join("\n", @_)."\n";
}

1; # End of Run::Parts::Common
