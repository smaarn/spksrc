#!/bin/sh

function executable_for_module ()
{
	echo -n "$*" | tr '[:upper:]' '[:lower:]' | tr -d '.'
}

function guess_php_installation () 
{
    # We only take the first available php installation, taking the oldest one to be conservative
	for php_module_name in $(synopkg list --name | grep PHP | sort)
	do
        echo "${php_module_name}"
        return 0
	done
	return 0
}

function guess_php_configuration_file ()
{
    local php_bin="$*"
    local web_station_configuration_file="/var/packages/WebStation/etc/${php_bin}/php.ini"
    if [ -f "${web_station_configuration_file}" ]
    then
        echo -n "${web_station_configuration_file}"
    else
        echo -n "/usr/local/etc/${php_bin}/php.ini"
    fi
}

function compute_php_options()
{
    echo -n " -d extension=intl.so"
    echo -n " -d extension=pdo_mysql.so"
    echo -n " -d extension=curl.so" 
    echo -n " -d extension=mysql.so"
    echo -n " -d extension=mysqli.so"
    echo -n " -d extension=posix.so"
}

php_configuration_file=
php_module_name="$(guess_php_installation)"
if [ -z "${php_module_name}" ]
then
    php=/bin/php
    php_configuration_file=/etc/php/php.ini
else
    php="$(executable_for_module ${php_module_name})"
    php_configuration_file="$(guess_php_configuration_file ${php})"
fi
