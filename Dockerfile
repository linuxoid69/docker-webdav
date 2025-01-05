FROM alpine:3.20.0

ARG DAV_VERSION

ENV HTTP_DAV_EXT_VERSION=${DAV_VERSION}

LABEL package.http_dav_ext.version="${HTTP_DAV_EXT_VERSION}" 

RUN apk update \
    && apk add apache2-utils nginx nginx-mod-http-dav-ext==${HTTP_DAV_EXT_VERSION} \
    && ln -s /dev/stderr /var/lib/nginx/logs/error.log  \
    && ln -s /dev/stdout /var/lib/nginx/logs/access.log \
    && mkdir -p /run/nginx \
    && rm -rf /var/cache/apk/* /tmp/* /var/tmp/*

COPY rootfs/ /

RUN chmod +x /run.sh

VOLUME [ "/var/www/localhost/htdocs" ]

EXPOSE 8080

CMD [ "/run.sh" ]
