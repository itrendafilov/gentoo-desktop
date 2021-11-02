
# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
 
EAPI=8

DESCRIPTION="Create Docker machines locally on VMware Fusion and Workstation"
HOMEPAGE="https://github.com/machine-drivers/docker-machine-driver-vmware/"
SRC_URI="https://github.com/machine-drivers/${PN}/releases/download/v${PV}/${PN}_${PV}_linux_amd64.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm ~arm64"

IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack() {
	mkdir ${S}
	cd ${S}
	unpack ${A}
}

src_install() {
	default
	dobin docker-machine-driver-vmware
}
