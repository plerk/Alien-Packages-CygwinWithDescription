use strict;
use warnings;
use Test::More tests => 1;
use Alien::Packages::CygwinNet;

is( 
  Alien::Packages::CygwinNet->pkgtype, 
  'cygwin', 
  'Alien.Packages.CygwinNet->pkgtype = cygwin'
);
