FROM nginx:1.25

LABEL maintainer="Markus Liechti"

RUN rm /etc/nginx/conf.d/default.conf

COPY .docker/nginx/conf.d/*.conf /etc/nginx/conf.d/
