package Key;

use strict;
use warnings;

use File::Slurp;

require Constants;
require String;

sub get_private_key {
    my $key = read_file(Constants->PRIVATE_KEY_FILENAME);
    String::trim $key;
}

1;
