# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A schematic editor for VLSI/Asic/Analog custom designs, netlist backends for VHDL, Spice and Verilog."
HOMEPAGE="https://xschem.sourceforge.io/"
SRC_URI="https://github.com/StefanSchippers/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"

# https://bugs.gentoo.org/887691
RDEPEND="
	x11-libs/libX11
	x11-libs/libXrender
	x11-libs/libxcb
	dev-lang/tcl
	dev-lang/tk
	dev-tcltk/tclreadline
	sys-devel/flex
	sys-devel/bison
	sys-apps/gawk
	x11-libs/libXpm
	x11-libs/cairo
"
DEPEND="${RDEPEND}"

DOCS=( README.md README )

src_configure() {
    cd ${S}
    ./configure --prefix=/usr
}

src_install() {
    docompress -x /usr/share/doc
    emake DESTDIR="${D}" install
}
