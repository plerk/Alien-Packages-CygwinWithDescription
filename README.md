# Alien::Packages::CygwinNet

Get information from Cygwin's packages via cygcheck and Cygwin::PackageDB

# SYNOPSIS

    # without Alien::Packages
    ues Alien::Packages::CygwinNet;
    
    foreach my $package (Alien::Packages::CygwinNet->list_packages)
    {
      say 'Name:    ' . $package->{Name};
      say 'Version: ' . $package->{Version};
    }
    
    my $perl_package = Alien::Packages::CygwinNet->list_owners('/usr/bin/perl');
    say 'Perl package is ' . $perl_package->{"/usr/bin/perl"}->[0]->{Package};
    
    # with Alien::Packages
    use Alien::Packages;
    
    my $packages = Alien::Packages->new;
    foreach my $package ($packages->list_packages)
    {
      say 'Name:    ' . $package->{Name};
      say 'Version: ' . $package->{Version};
    }
    
    my $perl_package = $packages->list_owners('/usr/bin/perl');
    say 'Perl package is ' . $perl_package->{"/usr/bin/perl"}->[0]->{Package};

# DESCRIPTION

This module provides package information for the Cygwin environment.
It can also be used as a plugin for [Alien::Packages](http://search.cpan.org/perldoc?Alien::Packages), and will be
used automatically if the environment is detected.  This module is a 
subclass of [Alien::Packages::Cygwin](http://search.cpan.org/perldoc?Alien::Packages::Cygwin) which works identically, except
that it uses the Cygwin package database (via [Cygwin::PackageDB](http://search.cpan.org/perldoc?Cygwin::PackageDB) and
[LWP::UserAgent](http://search.cpan.org/perldoc?LWP::UserAgent)) to include the package descriptions.  The package
database is cached.

# METHODS

## usable

    my $usable = Alien::Packages::cygwin->usable;

Returns true when cygcheck command was found in the path.

## list\_packages

    my @packages = Alien::Packages::Cygwin->list_packages;

Returns the list of installed _cygwin_ packages.  Each package is returned
as a hashref containing a

- Package

    The name of the package

- Version

    The version of the package

- Description

    The description of the package

## list\_fileowners

This method works exactly like [Alien::Packages::Cygwin\#list\_fileowners](http://search.cpan.org/perldoc?Alien::Packages::Cygwin\#list\_fileowners).

# AUTHOR

Graham Ollis <plicease@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
