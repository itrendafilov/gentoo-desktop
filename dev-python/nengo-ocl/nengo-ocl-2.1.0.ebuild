# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..10} )

inherit distutils-r1

DESCRIPTION="OpenCL-based simulator for brain models built using Nengo"
SRC_URI="https://github.com/nengo/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
HOMEPAGE="https://nengo.ai/ https://pypi.org/project/nengo/"

LICENSE="Nengo"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~ppc ~ppc64 ~riscv ~s390 ~sparc ~x86 ~x64-macos"
IUSE="examples"

RDEPEND="
	dev-python/nengo
	dev-python/pyopencl
	test? (
		>=dev-python/jupyter-1.0.0
		>=dev-python/matplotlib-2.0
		>=dev-python/nbformat-5.0.7
		>=dev-python/pytest-3.6
		>=dev-python/pytest-plt-1.0.1
		>=dev-python/pytest-rng-1.0.0
	)
	"
distutils_enable_sphinx docs \
	'>=dev-python/click-7.0.0' \
	'>=dev-python/matplotlib-1.4' \
	'>=dev-python/sphinx-1.8' \
	'>=dev-python/nbsphinx-0.6.0' \
	'>=dev-python/nengo-sphinx-theme-1.2.0'
distutils_enable_tests pytest

python_install_all() {
	use examples && dodoc -r examples
	distutils-r1_python_install_all
}
