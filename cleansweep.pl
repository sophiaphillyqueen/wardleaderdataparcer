# This PERL script is the concept-prototype for the program that I am going
# here to implement in C. That is --- it filters things out in the same
# manner. However, the end C program is going to produce a SQL file (as
# opposed to this concept-prototype that merely produces another tab-separated
# file).


use strict;
my $sourcefile;
my $sourceblob;
my @sourcelins;
my $sourceline;


($sourcefile) = @ARGV;
$sourceblob = `cat $sourcefile`;
@sourcelins = split(/\n/,$sourceblob);

if ( !(&good(@sourcelins)) ) { die "\nNOTHING TO USE AS HEADER LINE:\n\n"; }
sub good {
  my $lc_a;
  $lc_a = @_;
  return ( $lc_a > 0.5 );
}

# The header-file does not care about any silly tests
{
  my $lc_bak;
  $lc_bak = shift(@sourcelins);
  print $lc_bak . "\n";
}
foreach $sourceline (@sourcelins)
{
  if ( &approved($sourceline) )
  {
    print $sourceline . "\n";
  }
}

sub incazen {
  my $lc_ra;
  my $lc_rb;
  my $lc_ts;
  $lc_ra = lc($_[0]);
  $lc_rb = lc($_[1]);
  $lc_ts = index($lc_ra,$lc_rb);
  if ( $lc_ts == -1 ) { return ( 1 > 2 ); }
  return ( 2 > 1 );
}

sub approved {
  my @lc_tabs;
  my $lc_test;
  
  @lc_tabs = split(/\t/,$_[0]);
  
  
  $lc_test = index(lc($lc_tabs[0]),"ward");
  if ( $lc_test == -1 ) { return ( 1 > 2 ); }
  
  # Column #3 is the DocType column
  #if ( !(&incazen($lc_tabs[3], "Contributions Received From Political Committees")) ) { return ( 1 > 2 ); }
  if ( !(&incazen($lc_tabs[3], "Contributions")) ) { return ( 1 > 2 ); }
  
  return ( 2 > 1 );
}

