package String;

use strict;
use warnings;

sub trim {
    $_[0] =~ s/^\s+|\s+$//g;
    $_[0];
}

sub j {
    print "j";
}

1;
