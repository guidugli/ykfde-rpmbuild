Name:           mkinitcpio-ykfde
Version:        0.7.7
Release:        1%{?dist}
Summary:        Full disk encryption with Yubikey (Yubico key)
License:        GPL-3.0
URL:            https://github.com/eworm-de/mkinitcpio-ykfde
Source0:        %{name}-%{version}.tar.gz

BuildRequires:  gcc
BuildRequires:  make
BuildRequires:  pkg-config
BuildRequires:  libyubikey-devel
BuildRequires:  ykpers-devel
BuildRequires:  iniparser-devel
BuildRequires:  libarchive-devel
BuildRequires:  cryptsetup-devel
BuildRequires:  python-markdown
BuildRequires:  systemd-devel
BuildRequires:  keyutils-libs-devel

%description
Full disk encryption with Yubikey (Yubico key)

%prep
%global debug_package %{nil}
%setup -q -n %{name}-%{version}

%build
make MD=markdown_py

%install
[ "$RPM_BUILD_ROOT" != "/" ] && rm -rf $RPM_BUILD_ROOT
%__make DESTDIR=$RPM_BUILD_ROOT install-dracut

%clean
[ "$RPM_BUILD_ROOT" != "/" ] && rm -rf $RPM_BUILD_ROOT

%files
%defattr(-,root,root)
%config /etc/ykfde.conf
/usr/bin/ykfde
/usr/bin/ykfde-cpio
/usr/lib/dracut/modules.d/90ykfde/20-ykfde.rules
/usr/lib/dracut/modules.d/90ykfde/module-setup.sh
/usr/lib/dracut/modules.d/90ykfde/parse-mod.sh
/usr/lib/dracut/modules.d/90ykfde/ykfde.sh
/usr/lib/systemd/system/ykfde-2f.service
/usr/lib/systemd/system/ykfde-worker.service
/usr/lib/systemd/system/ykfde.service
/usr/lib/ykfde/worker
%doc /usr/share/doc/ykfde/README-dracut.html
%doc /usr/share/doc/ykfde/README-dracut.md
%doc /usr/share/doc/ykfde/README-mkinitcpio.html
%doc /usr/share/doc/ykfde/README-mkinitcpio.md
%doc /usr/share/doc/ykfde/README.html
%doc /usr/share/doc/ykfde/README.md
%ghost /etc/ykfde.d/.gitignore

%changelog
