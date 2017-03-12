FROM alpine:3.5

LABEL description "Adminer is a full-featured database management tool" \
      maintainer="Hardware <contact@meshup.net>"

ARG VERSION=4.2.5
ARG SHA256_HASH="6fb52277b658ac00a812501a88cfe79e03750c5436dcd7427a707aa4459a8516"

ENV GID=991 UID=991

RUN echo "@community https://nl.alpinelinux.org/alpine/v3.5/community" >> /etc/apk/repositories \
 && BUILD_DEPS=" \
    ca-certificates \
    openssl" \
 && apk -U add \
    ${BUILD_DEPS} \
    su-exec \
    tini@community \
    php7@community \
    php7-session@community \
    php7-pdo_mysql@community \
    php7-pdo_pgsql@community \
    php7-pdo_sqlite@community \
 && cd /tmp \
 # Download and install adminer and pepa-linha theme
 && ADMINER_FILE="adminer-${VERSION}.php" \
 && wget -q https://www.adminer.org/static/download/${VERSION}/${ADMINER_FILE} \
 && echo "Verifying integrity of ${ADMINER_FILE}..." \
 && CHECKSUM=$(sha256sum ${ADMINER_FILE} | awk '{print $1}') \
 && if [ "${CHECKSUM}" != "${SHA256_HASH}" ]; then echo "Warning! Checksum does not match!" && exit 1; fi \
 && echo "All seems good, hash is valid." \
 && mkdir /adminer && mv ${ADMINER_FILE} /adminer/index.php \
 && wget -q https://raw.githubusercontent.com/vrana/adminer/master/designs/pepa-linha/adminer.css -P /adminer \
 && apk del ${BUILD_DEPS} \
 && rm -rf /var/cache/apk/* /tmp/*

COPY run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

EXPOSE 8888

CMD ["/sbin/tini", "--", "run.sh"]
