#!/usr/bin/perl -Idata -Ilib

use strict;
use warnings;

use Template;
use File::Slurp;
use YAML::XS qw(LoadFile);

require Constants;

my $nargs = $#ARGV + 1;

sub generate_and_print_resume ($) {
    my $tt = Template->new();
    my $data = LoadFile $_[0];

    # Processes the resume template and prints it to stdout
    $tt->process(Constants->RESUME_TEMPLATE_FILENAME, $data, my $resume);
}

sub usage {
    print STDERR
        "Usage: $0\n",
        "Generates TeX file from " . Constants->RESUME_TEMPLATE_FILENAME .  " with " . Constants->DATA_FILENAME . " \n";
}

unless (-e Constants->DATA_FILENAME) {
    usage;
    print STDERR "ERROR: no " . Constants->DATA_FILENAME . " found, see: README\n";
    exit 1;
}

generate_and_print_resume
    (($nargs >= 1 && $ARGV[0] eq "--example") ?
        Constants->DATA_EXAMPLE_FILENAME :
        Constants->DATA_FILENAME)
