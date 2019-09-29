SPK_NAME = bazarr

SPK_VERS = 0.9.0.2
SPK_REV = 1

SPK_ICON = src/bazarr.png

BUILD_DEPENDS = cross/python3

BETA = 1

DEPENDS = cross/$(SPK_NAME)
DEPENDS += cross/unrar
DEPENDS += cross/numpy

WHEELS = 
SPK_DEPENDS = "python3>=3.7:ffmpeg"

MAINTAINER = SynoCommunity

DESCRIPTION = "Bazarr is a companion application to Sonarr and Radarr. It manages and downloads subtitles based on your requirements. You define your preferences by TV show or movies and Bazarr takes care of everything for you."
RELOAD_UI = no
DISPLAY_NAME = Bazarr
STARTABLE = yes
CHANGELOG = "Initial release"

HOMEPAGE = https://www.bazarr.media
LICENSE = GPLv3

SERVICE_USER  = auto
SERVICE_SETUP = src/service-setup.sh
SSS_SCRIPT    = src/dsm-control.sh
SERVICE_PORT  = 6767
SERVICE_PORT_TITLE = $(DISPLAY_NAME)

POST_DEPEND_TARGET = trim_bazarr_bin_directories

# Admin link for in DSM UI
ADMIN_PORT = $(SERVICE_PORT)

include ../../mk/spksrc.spk.mk

.PHONY: trim_bazarr_bin_directories
trim_bazarr_bin_directories:
# The binaries will actually be taken from the cross packages
	rm -rf $(STAGING_INSTALL_PREFIX)/share/bazarr/bin
