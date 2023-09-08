#!/usr/bin/perl -Idata -Ilib

use strict;
use warnings;

use Switch;
use Crypt::Mode::ECB;
use File::Slurp;

require Key;
require Bits;
require String;
require Constants;

my $nargs = $#ARGV + 1;

if ($nargs <= 0) {
    die "Not enough arguments";
}

sub usage {
    print "Usage: $0 --encrypt | --decrypt\n",
          "Encrypts or decrypts the data*.yaml file\n",
          "This acts like a snapshot for saving private ".Constants->DATA_FILENAME." file\n";
}

sub encrypt_data {
    my $data = read_file(Constants->DATA_FILENAME);
    my $key = Key::get_private_key();
    my $crypt = Crypt::Mode::ECB->new("AES");

    String::trim $data;
    write_file(Constants->DATA_PUBLIC_FILENAME, Bits::bin_to_hex_little($crypt->encrypt($data, $key)));
}

sub decrypt_data {
    my $data = read_file(Constants->DATA_PUBLIC_FILENAME);
    my $key = Key::get_private_key();
    my $crypt = Crypt::Mode::ECB->new("AES");

    String::trim $data;
    write_file(Constants->DATA_FILENAME, $crypt->decrypt(Bits::hex_to_bin_little($data), $key));
}

switch ($ARGV[0]) {
    case "--encrypt" {
        encrypt_data
    }
    case "--decrypt" {
        decrypt_data
    }
    else {
        usage;
        exit 1;
    }
}
