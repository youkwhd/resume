package Key;

require "common.pl";

use warnings;
use strict;

use File::Slurp;

sub get_private_key {
    my $private_key_file = "private-key";
    my $key = read_file $private_key_file;
    Common::trim $key;
}

1;
