#!/usr/local/bin/perl

# --------------------------
# XML_Validator
# ---------------------------

use lib $ENV{Flybase_API};

use XORT::Util::GeneralUtil::Properties; 
use XORT::Loader::XMLValidatorNoDB;
use XORT::Loader::XMLValidator;
use strict;

use Getopt::Std;

my $VALIDATION_NO_DB=0;
my $VALIDATION_DB=1;

my %opt;
getopts('h:d:v:f:', \%opt) or usage() and exit;

usage() and exit if $opt{h};

$opt{v}='0' if !($opt{v});


foreach my $key(keys %opt){
 print "\nkey:$key, value:$opt{$key}\n";
}
#exit(1);

usage() and exit if ((!$opt{v} && $opt{v} eq $VALIDATION_DB) || !$opt{f});


my $validate_db_obj;
my $validate_no_db_obj;

if ($opt{v} eq $VALIDATION_DB){
   print "\nuse connection......";

   $validate_db_obj=XORT::Loader::XMLValidator->new($opt{d}, $opt{f});
   $validate_db_obj->validate(-validate_level=>$opt{v});
}
else{
   print "\nnot use connection......";

   $validate_no_db_obj=XORT::Loader::XMLValidatorNoDB->new($opt{f});
   $validate_no_db_obj->validate(-validate_level=>$opt{v});
}


sub usage()
 {
  print "\nusage: $0 [-d database] [-f file]  [-v validate_level]",

    "\n -h                 : this (help) message",
    "\n -d                 : database",
    "\n -f xml file        : file to be valiated",
    "\n -v validate_level  : 0 no database connection valiation, 1 for DB connection validation",
    "\nexample: $0  -f /users/zhou/work/tmp/AE003828_chadox.xml -v 0",
    "\nexample: $0  -d chado_test -f /users/zhou/work/tmp/AE003828_chadox.xml -v 1\n\n";
}