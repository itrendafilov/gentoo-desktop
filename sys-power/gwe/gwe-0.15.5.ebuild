# Copyright 1999-2022 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( pypy3 python3_{9..11} )

inherit distutils-r1 meson git-r3 xdg-utils virtualx

DESCRIPTION="System utility designed to provide information, control the fans and overclock your NVIDIA card"
HOMEPAGE="https://gitlab.com/leinardi/gwe"
EGIT_REPO_URI="${HOMEPAGE}"
EGIT_TAG="${PV}"

SLOT="0"
LICENSE="GPL-3"
KEYWORDS="~amd64 ~x86"

RDEPEND="
    dev-libs/gobject-introspection
	dev-libs/libdazzle
	dev-libs/libappindicator
	>=dev-python/injector-0.1.7[${PYTHON_USEDEP}]
	>=dev-python/matplotlib-3.1.1[${PYTHON_USEDEP}]
	>=dev-python/peewee-3.9.6[${PYTHON_USEDEP}]
	>=dev-python/py3nvml-0.2.3[${PYTHON_USEDEP}]
    >=dev-python/pyxdg-0.26[${PYTHON_USEDEP}]
	dev-python/pycairo[${PYTHON_USEDEP}]
	dev-python/pygobject[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
	>=dev-python/python-xlib-0.26[${PYTHON_USEDEP}]
	>=dev-python/Rx-4.0.0[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}	
	test? ( dev-python/pytest-asyncio[${PYTHON_USEDEP}] )
	dev-util/meson
"

distutils_enable_tests pytest

src_test() {
	virtx distutils-r1_src_test
}

src_prepare() {
	## patching reactivex (rx was renamed to reactivex)
	for p in `grep -rl rx ./${PN}`; do
		sed -i 's/rx/reactivex/g' "${p}" || die "coudln't patch 'rx' in ${p}"
	done;
	default
}


pkg_postinst() {
	xdg_desktop_database_update
}
