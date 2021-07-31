# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..10} )

inherit distutils-r1

DESCRIPTION="Tools for building and simulating large-scale neural models"
SRC_URI="https://github.com/nengo/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
HOMEPAGE="https://nengo.ai/ https://pypi.org/project/nengo/"

LICENSE="Nengo"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~ppc ~ppc64 ~riscv ~s390 ~sparc ~x86 ~x64-macos"
IUSE="examples"

RDEPEND="
	>=dev-python/numpy-1.13
	>=dev-python/scipy-0.13
	sci-libs/scikit-learn
	test? (
		dev-python/jupyter
		>=dev-python/pytest-3.6
		dev-python/pytest-allclose
		dev-python/pytest-rng
		dev-python/pytest-plt
		>=dev-python/matplotlib-1.4
	)
	"
distutils_enable_sphinx docs \
	dev-python/jupyter \
	dev-python/nbsphinx \
	'>=dev-python/sphinx-1.8' \
	'>=dev-python/matplotlib-1.4' \
	'>=dev-python/numpydoc-0.6' \
	'>=dev-python/nengo-sphinx-theme-1.2'
distutils_enable_tests pytest

python_install_all() {
	use examples && dodoc -r docs/examples
	distutils-r1_python_install_all
}
