FROM unblibraries/nginx:alpine
MAINTAINER UNB Libraries <libsupport@unb.ca>

RUN apk --no-cache add rsyslog && \
  touch /var/log/nginx/access.log && touch /var/log/nginx/error.log && \
  mkdir -p /var/spool/rsyslog; chgrp adm /var/spool/rsyslog; chmod g+w /var/spool/rsyslog

# Add package conf.
COPY ./package-conf /package-conf
RUN mkdir -p /etc/rsyslog.d && \
  mv /package-conf/rsyslog/21-logzio-nginx.conf /etc/rsyslog.d/21-logzio-nginx.conf && \
  mv /package-conf/nginx/app.conf /etc/nginx/conf.d/app.conf && \
  mv /package-conf/nginx/redirect-map.conf /etc/nginx/redirect-map.conf && \
  rm -rf /package-conf
