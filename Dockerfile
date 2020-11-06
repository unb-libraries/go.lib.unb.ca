FROM unblibraries/nginx:alpine
MAINTAINER UNB Libraries <libsupport@unb.ca>

# Add package conf.
COPY ./build /build
RUN cp -r /build/scripts/container/* /scripts/ && \
  mv /build/nginx/app.conf /etc/nginx/conf.d/app.conf && \
  mv /build/nginx/redirect-map.conf /etc/nginx/redirect-map.conf && \
  rm -rf /build
