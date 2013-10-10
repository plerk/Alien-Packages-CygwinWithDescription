use strict;
use warnings;
use File::HomeDir::Test;
use Test::More tests => 4;
use Alien::Packages::CygwinWithDescription;
use Path::Class qw( file dir );
use URI::file;

is( 
  Alien::Packages::CygwinWithDescription->pkgtype, 
  'cygwin', 
  'Alien.Packages.CygwinWithDescription->pkgtype = cygwin'
);

$ENV{CYGWIN_PACKAGEDB_MIRROR} = join(';',
  URI::file->new(file(__FILE__)->parent->subdir('mirror')->absolute)->as_string,
  'localhost',
  'Local Region',
  'Local Sub Region',
);

note "CYGWIN_PACKAGEDB_MIRROR = $ENV{CYGWIN_PACKAGEDB_MIRROR}";

isa_ok(
  Alien::Packages::CygwinWithDescription->_pl,
  'Cygwin::PackageDB::PackageList',
);

isa_ok(
  Alien::Packages::CygwinWithDescription->new->_pl,
  'Cygwin::PackageDB::PackageList',
);

like(
  Alien::Packages::CygwinWithDescription->_arch,
  qr{^x86(_64)?$},
  '_arch like /^x86(_64?)4/'
);
