package Common;

use warnings;
use strict;

sub trim {
    $_[0] =~ s/^\s+|\s+$//g;
    $_[0];
}

sub bin_to_hex_little ($) {
    unpack "H*", $_[0];
}

sub hex_to_bin_little ($) {
    pack "H*", $_[0];
}

1;
