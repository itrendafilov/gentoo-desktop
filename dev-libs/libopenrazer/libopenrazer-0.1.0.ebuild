# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION="Libraries for razergenie."
HOMEPAGE="https://github.com/z3ntu/libopenrazer"
SRC_URI="https://github.com/z3ntu/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
KEYWORDS="~amd64 ~x86"
SLOT="0"

DEPEND="
	dev-qt/qtcore:5
	dev-qt/qtdbus:5
	dev-qt/qtgui:5
	dev-qt/qtxml:5
"
RDEPEND="${DEPEND}"
BDEPEND="
	dev-qt/linguist-tools:5
	virtual/pkgconfig
"
