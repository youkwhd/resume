package Key;

require "common.pl";
require "constants.pl";

use warnings;
use strict;

use File::Slurp;

sub get_private_key {
    my $key = read_file PRIVATE_KEY_FILENAME;
    Common::trim $key;
}

1;
