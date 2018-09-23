FROM node:latest
USER root
RUN npm install -g vapid-cli
RUN mkdir -p /srv/www/vapid/
RUN vapid new /srv/www/vapid/
WORKDIR /srv/www/vapid/
CMD vapid start
