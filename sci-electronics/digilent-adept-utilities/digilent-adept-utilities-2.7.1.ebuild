# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PN=${PN//-/.}
S="${WORKDIR}/${MY_PN}_${PV}-x86_64"

DESCRIPTION="Command line utilities for managing Digilent devices"
HOMEPAGE="https://reference.digilentinc.com/reference/software/adept/start"
SRC_URI="https://s3-us-west-2.amazonaws.com/digilent/Software/AdeptUtilities/${PV}/${MY_PN}_${PV}-x86_64.tar.gz"

LICENSE="Digilent-EULA"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="sci-electronics/digilent-adept-runtime"
RDEPEND="${DEPEND}"
BDEPEND=""

QA_PREBUILT="*"
RESTRICT="strip"

src_install() {
	dobin bin64/*

	(
		insinto /usr/share/digilent/dsumecfg/bitstreams
		doins bitstreams/dsumecfg/*.bit
	)

	doman man/*
}
