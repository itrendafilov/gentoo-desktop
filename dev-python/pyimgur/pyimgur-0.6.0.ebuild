# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..10} )

inherit distutils-r1

DESCRIPTION="The easy way of using Imgur."
SRC_URI="https://files.pythonhosted.org/packages/07/8b/99df63567b53d5fa040f0048160fa0aa327b478821c2d8660841f6d45bea/pyimgur-0.6.0.tar.gz -> ${P}.tar.gz"
HOMEPAGE="https://pypi.org/project/pyimgur/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~ppc ~ppc64 ~riscv ~s390 ~sparc ~x86 ~x64-macos"
IUSE=""

RDEPEND=""
