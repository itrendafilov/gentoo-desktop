# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..10} )

inherit distutils-r1

DESCRIPTION="Deep learning integration for Nengo using TensorFlow computational framework"
SRC_URI="https://github.com/nengo/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
HOMEPAGE="https://nengo.ai/ https://pypi.org/project/nengo/"

LICENSE="Nengo"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~ppc ~ppc64 ~riscv ~s390 ~sparc ~x86 ~x64-macos"
IUSE="examples"

RDEPEND="
	>=dev-python/nengo-3.0.0
	>=sci-libs/tensorflow-2.2.0
	>=dev-python/numpy-1.16.0
	>=dev-python/jinja-2.10.1
	>=dev-python/packaging-20.0
	>=dev-python/progressbar2-3.39.0
	test? (
		>=dev-python/click-6.7.0
		>=dev-python/matplotlib-2.0
		>=dev-python/nbval-0.6.0
		>=dev-python/nbformat-5.0.7
		>=dev-python/pytest-3.6
		>=dev-python/pytest-allclose-1.0.0
		>=dev-python/pytest-rng-1.0.0
		>=dev-python/pytest-cov-2.6.0
		>=dev-python/pytest-xdist-1.16.0
		>=dev-python/six-1.11.0
	)
	"
distutils_enable_sphinx docs \
	'>=dev-python/jupyter-1.0.0' \
	'>=dev-python/click-6.7.0' \
	dev-python/sphinx-click \
	'>=dev-python/matplotlib-2.0' \
	'>=dev-python/sphinx-3.0.0' \
	'>=dev-python/nbsphinx-0.3.5' \
	'>=dev-python/nengo-sphinx-theme-1.2.1' \
	'>=dev-python/numpydoc-0.6.0' \
	'>=dev-python/pillow-4.1.1'
distutils_enable_tests pytest

python_install_all() {
	use examples && dodoc -r docs/examples
	distutils-r1_python_install_all
}
