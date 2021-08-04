# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..10} )

inherit distutils-r1

DESCRIPTION="Tools for training and running spiking neural networks directly within the Keras framework"
SRC_URI="https://github.com/nengo/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
HOMEPAGE="https://nengo.ai/ https://pypi.org/project/nengo/"

LICENSE="Nengo"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~ppc ~ppc64 ~riscv ~s390 ~sparc ~x86 ~x64-macos"
IUSE="examples"

RDEPEND="
	>=sci-libs/tensorflow-2.2.0
	>=dev-python/numpy-1.16.0
	>=dev-python/packaging-20.0
	test? (
		>=dev-python/pytest-3.6
		>=dev-python/pytest-allclose-1.0.0
		>=dev-python/pytest-rng-1.0.0
		>=dev-python/pytest-cov-2.6.0
		>=dev-python/pytest-xdist-1.16.0
		>=dev-python/pylint-1.9.2
	)
	"
distutils_enable_sphinx docs \
	'>=dev-python/jupyter-1.0.0' \
	'>=dev-python/matplotlib-2.0' \
	'>=dev-python/sphinx-3.0.0' \
	'>=dev-python/nbsphinx-0.3.5' \
	'>=dev-python/nengo-sphinx-theme-1.2.1' \
	'>=dev-python/numpydoc-0.6.0'
distutils_enable_tests pytest

python_install_all() {
	use examples && dodoc -r examples
	distutils-r1_python_install_all
}
