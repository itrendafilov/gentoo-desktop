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
IUSE="examples doc"

RDEPEND="
	dev-python/nengo
	test? (
		dev-python/pytest
		dev-python/selenium
		dev-python/pyimgur
		dev-python/cookies
	)
	"
distutils_enable_tests pytest

python_install_all() {
	use examples && dodoc -r examples
	use doc && dodoc -r docs
	distutils-r1_python_install_all
}
