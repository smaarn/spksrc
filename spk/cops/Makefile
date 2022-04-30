SPK_NAME = cops
SPK_VERS = 1.1.3
SPK_REV = 6
SPK_ICON = src/cops.png
DSM_UI_DIR = app

DEPENDS  = cross/$(SPK_NAME)

MAINTAINER = Diaoul
DESCRIPTION = Calibre OPDS and HTML PHP Server : light alternative to Calibre content server / Calibre2OPDS.
DESCRIPTION_FRE = Calibre OPDS et HTML PHP Serveur : alternative légère au serveur de contenu de Calibre et à Calibre2OPDS.
ADMIN_URL = /cops/
DISPLAY_NAME = COPS
CHANGELOG = "1. Update to 1.1.3<br>2. Improved DSM7 compatibility"

SPK_DEPENDS=WebStation

SYSTEM_GROUP = http

BETA=1

HOMEPAGE   = https://blog.slucas.fr/en/oss/calibre-opds-php-server
LICENSE    = GPL

REQUIRED_MIN_DSM = 6.0

WIZARDS_DIR = src/wizard/
CONF_DIR = src/conf/

INSTALLER_SCRIPT = src/installer.sh
STARTABLE = no

INSTALL_DEP_SERVICES = apache-web
START_DEP_SERVICES = apache-web
INSTUNINST_RESTART_SERVICES = apache-web

POST_STRIP_TARGET = cops_extra_install

# Pure PHP package, make sure ARCH is not defined
override ARCH=

include ../../mk/spksrc.spk.mk

.PHONY: cops_extra_install
cops_extra_install:
	install -m 755 -d $(STAGING_DIR)/app
	install -m 644 src/app/config $(STAGING_DIR)/app/config
	install -m 666 src/config_local.php.synology $(STAGING_DIR)/config_local.php.synology
