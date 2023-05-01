# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{5..11} )

inherit distutils-r1

DESCRIPTION="Image Visualization Tools"
SRC_URI="https://github.com/wkentaro/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
HOMEPAGE="https://github.com/wkentaro/imgviz https://pypi.org/project/imgviz/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~ppc ~ppc64 ~riscv ~s390 ~sparc ~x86 ~x64-macos"
IUSE=""
RESTRICT="test"

RDEPEND="
	dev-python/matplotlib
	dev-python/numpy
	dev-python/pillow
	dev-python/pyyaml
	"
