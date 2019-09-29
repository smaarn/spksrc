#!/bin/sh

# Package
PACKAGE="bazarr"
DNAME="Bazarr"

# Others
INSTALL_DIR="/usr/local/${PACKAGE}"
PYTHON_DIR="/usr/local/python3"
PATH="${INSTALL_DIR}/env/bin:${INSTALL_DIR}/bin:${PYTHON_DIR}/bin:${PATH}"
VAR_DIR="${INSTALL_DIR}/var"
PYTHON3="${PYTHON_DIR}/bin/python3"

SC_USER="sc-${PACKAGE}"
GROUP="sc-download"

service_postinst ()
{
    # Link
    ln -s ${SYNOPKG_PKGDEST} ${INSTALL_DIR} >> "${INST_LOG}" 2>&1

    mkdir -p "${VAR_DIR}/data"  >> "${INST_LOG}" 2>&1
    
    set_unix_permissions "${VAR_DIR}" >> "${INST_LOG}" 2>&1
    
    set_unix_permissions "${VAR_DIR}/data" >> "${INST_LOG}" 2>&1

    echo "Running busybox installation..."  >> "${INST_LOG}" 2>&1

    # Install busybox
    ${PYTHON_DIR}/bin/busybox --install ${INSTALL_DIR}/bin >> "${INST_LOG}" 2>&1

}
