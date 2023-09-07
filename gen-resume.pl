#!/usr/bin/perl -I.

require "common.pl";
require "key.pl";

use warnings;
use strict;
use Data::Dumper;
use YAML::XS "LoadFile";
use Template;
use File::Slurp;

my $tt = Template->new();
my $data = LoadFile("data.yaml");

$tt->process("resume.template.tex", $data, my $resume);
