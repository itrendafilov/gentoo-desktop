# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit udev

MY_PN=${PN//-/.}
S="${WORKDIR}/${MY_PN}_${PV}-x86_64"

DESCRIPTION="Allows communication with Digilent system boards"
HOMEPAGE="https://reference.digilentinc.com/reference/software/adept/start"
SRC_URI="https://s3-us-west-2.amazonaws.com/digilent/Software/Adept2+Runtime/${PV}/${MY_PN}_${PV}-x86_64.tar.gz"

LICENSE="Digilent-EULA"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="virtual/libusb:1
	dev-embedded/libftd2xx"
RDEPEND="${DEPEND}"
BDEPEND=""

QA_PREBUILT="*"
RESTRICT="strip"

src_install() {
	(
		insinto /usr/lib/digilent/adept
		insopts -m0755
		doins lib64/*
	)

	(
		insinto /etc/ld.so.conf.d
		doins digilent-adept-libraries.conf
	)

	(
		insinto /usr/share/digilent/adept/data
		doins data/jtscdvclist.txt
	)

	(
		insinto /usr/share/digilent/adept/data/firmware
		doins data/firmware/*.HEX
		insopts -m0755
		doins data/firmware/*.so
	)

	(
		insinto /usr/share/digilent/adept/data/xpla3
		doins data/xpla3/*.map
	)

	(
		insinto /etc
		doins digilent-adept.conf
	)

	dosbin bin64/dftdrvdtch

	udev_dorules 52-digilent-usb.rules

	# driver installation
	#(
	#	insinto /usr
	#	dolib.so ftdi.drivers_1.4.24-x86_64/lib64/libftd2xx.so.1.4.24
	#	dosym libftd2xx.so.1.4.24 ${EP}/usr/lib64/libftd2xx.so.1
	#	dosym libftd2xx.so.1.4.24 ${EP}/usr/lib64/libftd2xx.so
	#)
}
