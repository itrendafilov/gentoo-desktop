# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..10} )

inherit distutils-r1

DESCRIPTION="Sphinx theme for documentation of Nengo projects"
SRC_URI="https://github.com/nengo/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
HOMEPAGE="https://nengo.ai/ https://pypi.org/project/nengo/"

LICENSE="Nengo"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~ppc ~ppc64 ~riscv ~s390 ~sparc ~x86 ~x64-macos"
IUSE=""

RDEPEND="
	<dev-python/sphinx-4.0.0
	<dev-python/docutils-0.17
	>=dev-python/sphinx-notfound-page-0.5.0
	>=dev-python/python-backoff-1.10.0
	doc? (
		app-text/pandoc
	)
	"
distutils_enable_sphinx docs \
	dev-python/jupyter \
	dev-python/nbsphinx \
	dev-python/matplotlib \
	dev-python/matplotlib-inline \
	dev-python/numpydoc \
	dev-python/nengo
