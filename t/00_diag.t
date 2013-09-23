use strict;
use warnings;
use Test::More tests => 1;

BEGIN { eval q{ use EV } }

my @modules = sort qw(
  Alien::Packages
  Alien::Packages::Cygwin
  Cygwin::PackageDB
  LWP::UserAgent
  Moo
  PerlX::Maybe
  PerlX::Maybe::XS
  Throwable::Error
  URI
  URI::file
);

pass 'okay';

diag '';
diag '';
diag '';

diag sprintf "%-25s %s", 'perl', $^V;

foreach my $module (@modules)
{
  if(eval qq{ use $module; 1 })
  {
    my $ver = eval qq{ \$$module\::VERSION };
    $ver = 'undef' unless defined $ver;
    diag sprintf "%-25s %s", $module, $ver;
  }
  else
  {
    diag sprintf "%-25s none", $module;
  }
}

diag '';
diag '';
diag '';

