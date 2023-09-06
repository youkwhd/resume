#!/usr/bin/perl

use Crypt::Mode::ECB;

sub trim {
    $_[0] =~ s/^\s+|\s+$//g;
}

sub get_private_key {
    my $private_key_file = "private-key";
    my $fh;

    die "FATAL: Cannot find $private_key_file\n" if not open $fh, "<", $private_key_file;

    my $key = <$fh>;
    trim $key;

    die "FATAL: Error during file closing\n" if not close $fh;

    $key;
}

sub bin_to_hex_little ($) {
    unpack "H*", $_[0];
}

my $key = get_private_key();
my $crypt = Crypt::Mode::ECB->new("AES");

my $cp = $crypt->encrypt("Hello from Perl", $key);
my $dc = $crypt->decrypt($cp, $key);

print bin_to_hex_little($cp), "\n", "$dc\n";
