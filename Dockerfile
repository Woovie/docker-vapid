FROM node:latest
RUN adduser --system --home=/srv/www/vapid/ --group vapid
USER vapid
RUN npm install -g vapid-cli
RUN vapid new /srv/www/vapid/
CMD vapid start
