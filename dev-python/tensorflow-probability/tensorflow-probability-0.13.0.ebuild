# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..10} )

inherit distutils-r1

DESCRIPTION="A library for probabilistic reasoning and statistical analysis in TensorFlow"
SRC_URI="https://github.com/tensorflow/probability/archive/v${PV}.tar.gz -> ${P}.tar.gz"
HOMEPAGE="https://www.tensorflow.org/probability"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~ppc ~ppc64 ~riscv ~s390 ~sparc ~x86 ~x64-macos"
IUSE=""

RDEPEND="
	>=dev-python/six-1.10.0
	>=dev-python/numpy-1.13.3
	dev-python/decorator
	>=dev-python/cloudpickle-1.3
	>=dev-python/gast-0.3.2
	"
