# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( pypy3 python3_{9..11} )

inherit distutils-r1 virtualx

MY_P="RxPY-${PV}"
DESCRIPTION="Reactive Extensions for Python"
HOMEPAGE="http://reactivex.io/"
SRC_URI="https://github.com/ReactiveX/RxPY/archive/v${PV}.tar.gz -> ${MY_P}.tar.gz"
DISTUTILS_USE_PEP517=poetry
S="${WORKDIR}/${MY_P}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	test? ( dev-python/pytest-asyncio[${PYTHON_USEDEP}] )
"

distutils_enable_tests pytest

src_test() {
	virtx distutils-r1_src_test
}

src_prepare() {
	sed -i "s/version\ =\ \"0.0.0\"/version\ =\ \"${PV}\"/g" pyproject.toml \
		|| die "couldn't patch project version"
	default
}
