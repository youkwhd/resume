package Common;

use warnings;
use strict;

sub trim {
    $_[0] =~ s/^\s+|\s+$//g;
}

sub bin_to_hex_little ($) {
    unpack "H*", $_[0];
}

1;
