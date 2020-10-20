FROM unblibraries/nginx:alpine
MAINTAINER UNB Libraries <libsupport@unb.ca>

RUN apk --no-cache add rsyslog && \
  touch /var/log/nginx/access.log && touch /var/log/nginx/error.log && \
  mkdir -p /var/spool/rsyslog; chgrp adm /var/spool/rsyslog; chmod g+w /var/spool/rsyslog

# Add package conf.
COPY ./build /build
RUN cp -r /build/scripts/container/* /scripts/ && \
  mkdir -p /etc/rsyslog.d && \
  mv /build/rsyslog/21-logzio-nginx.conf /etc/rsyslog.d/21-logzio-nginx.conf && \
  mv /build/nginx/app.conf /etc/nginx/conf.d/app.conf && \
  mv /build/nginx/redirect-map.conf /etc/nginx/redirect-map.conf && \
  rm -rf /build
