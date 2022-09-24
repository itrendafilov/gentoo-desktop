# Copyright 1999-2022 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
EAPI=8
PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1

DESCRIPTION="Python 3 Bindings for NVML library. Get NVIDIA GPU status inside your program"
HOMEPAGE="https://github.com/fbcotter/py3nvml"
SRC_URI="${HOMEPAGE}/archive/${PV}.tar.gz"

SLOT="0"
LICENSE="BSD"
KEYWORDS="~amd64 ~x86"

IUSE="doc test"

RDEPEND="
	x11-drivers/nvidia-drivers
	test? ( 
		dev-python/pytest
		dev-python/hypothesis 
	)
"
DEPEND="${RDEPEND}
	doc? ( dev-python/sphinx )
"

python_compile_all() {
	use doc && emake -C docs
}

python_test() {
	esetup.py test
}

python_install_all() {
	use doc && local HTML_DOCS=( docs/. )
	distutils-r1_python_install_all
}
