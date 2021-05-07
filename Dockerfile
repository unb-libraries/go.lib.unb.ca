FROM ghcr.io/unb-libraries/nginx:1.x
MAINTAINER UNB Libraries <libsupport@unb.ca>

# Add package conf.
COPY ./build /build
RUN cp -r /build/scripts/container/* /scripts/ && \
  mv /build/nginx/app.conf /etc/nginx/conf.d/app.conf && \
  mv /build/nginx/redirect-map.conf /etc/nginx/redirect-map.conf && \
  rm -rf /build

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
  org.opencontainers.image.source="https://github.com/unb-libraries/go.lib.unb.ca"
