PKG_NAME = numpy
PKG_VERS = 1.17.5
PKG_EXT = zip
PKG_DIST_NAME = $(PKG_NAME)-$(PKG_VERS).$(PKG_EXT)
PKG_DIST_SITE = https://files.pythonhosted.org/packages/source/n/$(PKG_NAME)
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)

BUILD_DEPENDS = cross/cython

HOMEPAGE = https://numpy.org/
COMMENT  = The fundamental package for scientific computing with Python
LICENSE  = https://numpy.org/doc/stable/license.html

ADDITIONAL_CFLAGS = -std=c99

include ../../mk/spksrc.python-wheel.mk
