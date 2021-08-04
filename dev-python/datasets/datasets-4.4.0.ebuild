# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{9..10} )

inherit distutils-r1

DESCRIPTION="Provides many public datasets as tf.data.Datasets"
SRC_URI="https://github.com/tensorflow/datasets/archive/v${PV}.tar.gz -> ${P}.tar.gz"
HOMEPAGE="https://www.tensorflow.org/datasets"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~ppc ~ppc64 ~riscv ~s390 ~sparc ~x86 ~x64-macos"
IUSE=""

RDEPEND="
	dev-python/absl-py
	>=dev-python/attrs-18.1.0
	dev-python/dill
	dev-python/future
	dev-python/numpy
	dev-python/promise
	>=dev-libs/protobuf-3.12.2
	>=dev-python/requests-2.19.0
	dev-python/six
	dev-python/termcolor
	dev-python/tqdm
	dev-python/yapf
	dev-python/pylint
	"
