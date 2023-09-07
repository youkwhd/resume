#!/usr/bin/perl -I.

require "common.pl";
require "key.pl";

use Switch;
use Crypt::Mode::ECB;
use File::Slurp;

my $nargs = $#ARGV + 1;

if ($nargs <= 0) {
    die "Not enough arguments";
}

sub usage {
    print "Usage: $0 --encrypt | --decrypt\n",
          "Encrypts or decrypts the data*.yaml file\n";
}

sub encrypt_data {
    my $data = read_file "data.yaml";
    my $key = Key::get_private_key();
    my $crypt = Crypt::Mode::ECB->new("AES");

    Common::trim $data;
    write_file "data.public.yaml", Common::bin_to_hex_little($crypt->encrypt($data, $key));
}

sub decrypt_data {
    my $data = read_file "data.public.yaml";
    my $key = Key::get_private_key();
    my $crypt = Crypt::Mode::ECB->new("AES");

    Common::trim $data;
    write_file "data.yaml", $crypt->decrypt(Common::hex_to_bin_little($data), $key);
}

switch (@ARGV[0]) {
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
