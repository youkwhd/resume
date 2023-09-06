#!/usr/bin/perl

require "common.pl";

use warnings;
use strict;
use Crypt::Mode::ECB;

sub get_private_key {
    my $private_key_file = "private-key";
    my $fh;

    die "FATAL: Cannot find $private_key_file\n" if not open $fh, "<", $private_key_file;

    my $key = <$fh>;
    Common::trim $key;

    die "FATAL: Error during file closing\n" if not close $fh;

    $key;
}

my $key = get_private_key();
my $crypt = Crypt::Mode::ECB->new("AES");

my $cp = $crypt->encrypt("Hello from Perl", $key);
my $dc = $crypt->decrypt($cp, $key);

print Common::bin_to_hex_little($cp), "\n", "$dc\n";
