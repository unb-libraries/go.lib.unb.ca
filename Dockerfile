FROM ghcr.io/unb-libraries/nginx:3.x

# Add package conf.
COPY ./build /build
RUN cp -r /build/scripts/container/* /scripts/ && \
  $RSYNC_COPY /build/conf/nginx/app.conf "$NGINX_APP_CONF_FILE" && \
  $RSYNC_COPY /build/conf/nginx/daemon "$NGINX_CONFD_DIR/"

# Container metadata.
LABEL ca.unb.lib.generator="nginx" \
  com.microscaling.docker.dockerfile="/Dockerfile" \
  com.microscaling.license="MIT" \
  org.label-schema.build-date=$BUILD_DATE \
  org.label-schema.description="go.lib.unb.ca is the short URL forwarding application at UNB Libraries." \
  org.label-schema.name="go.lib.unb.ca" \
  org.label-schema.schema-version="1.0" \
  org.label-schema.url="https://go.lib.unb.ca" \
  org.label-schema.vcs-ref=$VCS_REF \
  org.label-schema.vcs-url="https://github.com/unb-libraries/go.lib.unb.ca" \
  org.label-schema.vendor="University of New Brunswick Libraries" \
  org.label-schema.version=$VERSION \
  org.opencontainers.image.authors="UNB Libraries <libsupport@unb.ca>" \
  org.opencontainers.image.source="https://github.com/unb-libraries/go.lib.unb.ca"
