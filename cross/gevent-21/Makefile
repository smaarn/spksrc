PKG_NAME = gevent
PKG_VERS = 21.1.2
PKG_EXT = tar.gz
PKG_DIST_NAME = $(PKG_VERS).$(PKG_EXT)
PKG_DIST_SITE = https://github.com/$(PKG_NAME)/$(PKG_NAME)/archive
PKG_DIST_FILE = $(PKG_NAME)-$(PKG_VERS).$(PKG_EXT)
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)

DEPENDS = cross/libev-4.33 cross/c-ares

HOMEPAGE = https://www.gevent.org
COMMENT  = gevent is a coroutine-based Python networking library that uses greenlet to provide a high-level synchronous API on top of the libev event loop
LICENSE  = MIT

INSTALL_TARGET = gevent_21_install

include ../../mk/spksrc.python-wheel.mk

.PHONY: gevent_21_install
gevent_21_install:
	@$(RUN) GEVENTSETUP_EMBED_LIBEV=false GEVENTSETUP_EMBED_CARES=false PYTHONPATH=$(PYTHONPATH) $(HOSTPYTHON) -c "import setuptools;__file__='setup.py';exec(compile(open(__file__).read().replace('\r\n', '\n'), __file__, 'exec'))" bdist_wheel -d $(WORK_DIR)/wheelhouse
	@rename -f 's/linux_i686/any/g' $(WORK_DIR)/wheelhouse/*.whl
