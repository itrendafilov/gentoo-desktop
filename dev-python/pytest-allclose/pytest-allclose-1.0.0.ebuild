# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..10} )

inherit distutils-r1

DESCRIPTION="Provides the ~.allclose Pytest fixture, extending numpy.allclose with test-specific features."
SRC_URI="https://github.com/nengo/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
HOMEPAGE="https://nengo.ai/ https://pypi.org/project/nengo/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~ppc ~ppc64 ~riscv ~s390 ~sparc ~x86 ~x64-macos"
IUSE=""

RDEPEND="
	>=dev-python/numpy-1.11
	dev-python/pytest
	dev-python/scipy
	sci-libs/scikit-learn
	test? (
		dev-util/codespell
		>=dev-python/coverage-4.3
		dev-python/flake8
		dev-vcs/gitlint
		dev-python/pylint
	)
	"
distutils_enable_sphinx docs \
	dev-python/sphinx \
	'>=dev-python/nbsphinx-0.6.0' \
	'>=dev-python/numpydoc-0.9.2' \
	'>dev-python/nengo-sphinx-theme-1.2.2'
distutils_enable_tests pytest

