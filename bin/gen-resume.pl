#!/usr/bin/perl -Idata -Ilib

use strict;
use warnings;

use Switch;
use Template;
use File::Slurp;
use YAML::XS "LoadFile";

require Constants;

my $nargs = $#ARGV + 1;

sub generate_and_print_resume ($) {
    my $tt = Template->new();
    my $data = LoadFile($_[0]);

    $tt->process(Constants->RESUME_TEMPLATE_FILENAME, $data, my $resume);
}

generate_and_print_resume
    (($nargs >= 1 && $ARGV[0] eq "--example") ?
        Constants->DATA_EXAMPLE_FILENAME :
        Constants->DATA_FILENAME)
