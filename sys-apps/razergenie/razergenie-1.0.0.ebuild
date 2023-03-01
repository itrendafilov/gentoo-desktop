# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="Razer devices configurator"
HOMEPAGE="https://github.com/z3ntu/RazerGenie"
SRC_URI="https://github.com/z3ntu/RazerGenie/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-qt/qtdbus:5
	dev-qt/qtnetwork:5
	dev-qt/qtwidgets:5
	dev-qt/qtxml:5
        dev-libs/libopenrazer"
RDEPEND="${DEPEND}
	sys-apps/openrazer[daemon]"
BDEPEND="dev-qt/linguist-tools:5
	virtual/pkgconfig"

S="${WORKDIR}/RazerGenie-${PV}"

src_configure() {
	meson_src_configure
}
