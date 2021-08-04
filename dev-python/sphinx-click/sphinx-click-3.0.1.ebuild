# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8,9} )

inherit distutils-r1

DESCRIPTION="Sphinx plugin to automatically document click-based applications"
HOMEPAGE="
	https://github.com/click-contrib/sphinx-click
	https://pypi.org/project/sphinx-click
"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
SLOT="0"

RDEPEND="
	>=dev-python/sphinx-2.0[${PYTHON_USEDEP}]
	>=dev-python/click-6[${PYTHON_USEDEP}]
	<dev-python/docutils-0.17[${PYTHON_USEDEP}]
"
DEPEND=">=dev-python/pbr-2.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
distutils_enable_sphinx docs --no-autodoc
