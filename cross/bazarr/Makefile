PKG_NAME = bazarr

PKG_VERS = 0.8.4.2
PKG_EXT = tar.gz
PKG_DIST_NAME = v$(PKG_VERS).$(PKG_EXT)
PKG_DIST_FILE = $(PKG_NAME)-$(PKG_VERS).$(PKG_EXT)
PKG_DIST_SITE = https://github.com/morpheus65535/bazarr/archive
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)

DEPENDS = cross/lxml

CONFIGURE_TARGET = nop
COMPILE_TARGET = nop
INSTALL_TARGET = bazarr_custom_install

HOMEPAGE = https://www.bazarr.media
LICENSE = GPLv3

include ../../mk/spksrc.python-module.mk

.PHONY: bazarr_custom_install
bazarr_custom_install:
	mkdir -p $(STAGING_INSTALL_PREFIX)/share/$(PKG_NAME)
	tar -cf - --exclude='./bin/MacOSX' --exclude='./bin/Windows'  -C $(WORK_DIR)/$(PKG_DIR) . | tar -xf - -C $(STAGING_INSTALL_PREFIX)/share/$(PKG_NAME)
