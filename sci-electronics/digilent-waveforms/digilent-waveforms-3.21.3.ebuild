# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit xdg-utils

MY_PN=${PN//-/.}

DESCRIPTION="Digilent WaveForms Application, Runtime, and SDK"
HOMEPAGE="https://reference.digilentinc.com/reference/software/adept/start"
SRC_URI="https://s3-us-west-2.amazonaws.com/digilent/Software/Waveforms2015/${PV}/${MY_PN}_${PV}_amd64.deb"

LICENSE="Digilent-EULA"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	dev-qt/qtscript:5[scripttools]
	net-dns/avahi
	sci-electronics/digilent-adept-runtime"
RDEPEND="${DEPEND}"
BDEPEND=""

QA_PREBUILT="*"
RESTRICT="strip"

src_unpack() {
	default
	mkdir "${S}"
	cd "${S}"
	tar xJf "${WORKDIR}/data.tar.xz" \
		--exclude="usr/share/lintian" \
		--exclude="usr/lib/digilent/waveforms/qtlibs"
}

src_install() {
	dobin usr/bin/*

	doheader -r usr/include/digilent

	dolib.so usr/lib/libdwf.so
	dolib.so usr/lib/libdwf.so.3
	dolib.so usr/lib/libdwf.so.${PV}

	for manpage in usr/share/man/man1/*.gz; do
		gunzip "$manpage"
		doman "${manpage/.gz/}"
	done

	(
		insinto /usr/share
		doins -r usr/share/applications
		doins -r usr/share/digilent
		doins -r usr/share/mime
	)

	(
		dodoc usr/share/doc/digilent.waveforms/changelog.gz
		dodoc usr/share/doc/digilent.waveforms/copyright
	)
}
