Summary: Base libraries for DarkMatter
Name: darkmatter-depends
Version: 0.5.8
Release: 2%{?dist}
License: MIT and LGPLv3 and Python
Group: System Environment/Libraries
URL: https://github.com/lindellalderman/darkmatter-depends/

Source: http://repo.darkmatter.io/source/%{name}-%{version}.tar.gz
BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-root

BuildRequires: cmake
BuildRequires: autoconf
BuildRequires: imake
BuildRequires: patch
BuildRequires: gcc
BuildRequires: gcc-c++
BuildRequires: git
BuildRequires: psutils
BuildRequires: texinfo
BuildRequires: uuid-devel
BuildRequires: libuuid
BuildRequires: libuuid-devel
BuildRequires: pam-devel
BuildRequires: libaio-devel
BuildRequires: libaio
BuildRequires: glibc-devel
BuildRequires: compat-glibc
BuildRequires: rpm-build

AutoReqProv: no

%description
Base libraries required to run DarkMatter framework for 
Stackless Python

%prep
%setup

%build
make

%install
make install DESTDIR=%{buildroot}

%files -f INSTALLED_FILES
%defattr(644, root, root, 755)
