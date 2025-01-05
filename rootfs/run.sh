#!/bin/sh

WEBDAV_USERNAME=${WEBDAV_USERNAME:-''}
WEBDAV_PASSWORD=${WEBDAV_PASSWORD:-''}
WEBDAV_SYMLINK_ENABLE=${WEBDAV_SYMLINK_ENABLE:-''}

if [ "${WEBDAV_USERNAME}" != "" ] && [ "${WEBDAV_PASSWORD}" != "" ]
then
        sed -i -r 's/(server_name.*)/\1\nauth_basic "Upload directory";\nauth_basic_user_file \/var\/lib\/nginx\/.htpasswd;/' \
            /etc/nginx/http.d/default.conf
        htpasswd -dbcm /var/lib/nginx/.htpasswd "${WEBDAV_USERNAME}" "${WEBDAV_PASSWORD}"
elif [ "${WEBDAV_USERNAME}" != "" ] || [ "${WEBDAV_PASSWORD}" != "" ]
then
    echo "WEBDAV_USERNAME and WEBDAV_PASSWORD must be set"
    exit 123
fi

[ "${WEBDAV_SYMLINK_ENABLE}" = "yes" ] && echo 'disable_symlinks off;' >> /etc/nginx/http.d/http_parameters.conf

WEBDAV_PORT=${WEBDAV_PORT:-8080}

sed -i -r "s/listen .*;/listen ${WEBDAV_PORT};/" /etc/nginx/http.d/default.conf

nginx -g "daemon off;"
