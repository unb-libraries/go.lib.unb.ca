FROM ghcr.io/unb-libraries/nginx:3.x

# Add package conf.
COPY ./build /build
RUN cp -r /build/scripts/container/* /scripts/ && \
  $RSYNC_COPY /build/conf/nginx/app.conf "$NGINX_APP_CONF_FILE" && \
  $RSYNC_COPY /build/conf/nginx/daemon "$NGINX_CONFD_DIR/"

# Container metadata.
LABEL ca.unb.lib.generator="nginx" \
  org.opencontainers.image.title="go.lib.unb.ca" \
  org.opencontainers.image.description="go.lib.unb.ca is the short URL forwarding application at UNB Libraries." \
  org.opencontainers.image.vendor="University of New Brunswick Libraries" \
  org.opencontainers.image.authors="UNB Libraries <libsupport@unb.ca>" \
  org.opencontainers.image.url="https://go.lib.unb.ca" \
  org.opencontainers.image.source="https://github.com/unb-libraries/go.lib.unb.ca" \
  org.opencontainers.image.version="$VERSION" \
  org.opencontainers.image.revision="$VCS_REF" \
  org.opencontainers.image.created="$BUILD_DATE"
