# Package
PACKAGE="bazarr"

# Others
INSTALL_DIR="/usr/local/${PACKAGE}"
PYTHON_DIR="/usr/local/python3"
FFMPEG_DIR="/usr/local/ffmpeg"
VIRTUALENV="${PYTHON_DIR}/bin/virtualenv"
export PATH="${INSTALL_DIR}/env/bin:${INSTALL_DIR}/bin:${FFMPEG_DIR}/bin:${PATH}"
export VAR_DIR="${INSTALL_DIR}/var"

SC_USER="sc-${PACKAGE}"
GROUP="sc-download"
SVC_BACKGROUND=y
PID_FILE="${VAR_DIR}/bazarr.pid"
SVC_WRITE_PID=y
SVC_CWD="${INSTALL_DIR}/share/${PACKAGE}"

service_postinst ()
{

    # Create a Python virtualenv
    ${VIRTUALENV} --system-site-packages ${INSTALL_DIR}/env >> ${INST_LOG} 2>&1

    # Install the wheels (using virtual env through PATH)
    pip install --no-deps --no-index -U --force-reinstall -f ${INSTALL_DIR}/share/wheelhouse ${INSTALL_DIR}/share/wheelhouse/*.whl >> ${INST_LOG} 2>&1

    mkdir -p "${VAR_DIR}/data"  >> "${INST_LOG}" 2>&1
    
    set_unix_permissions "${VAR_DIR}/data" >> "${INST_LOG}" 2>&1

}
