FROM node:latest
RUN adduser --system --group vapid
USER vapid
RUN mkdir ~/.npm-global/
RUN mkdir ~/root/
RUN NPM_CONFIG_PREFIX=~/.npm-global
RUN npm config set prefix '~/.npm-global'
RUN npm install -g vapid-cli
RUN export PATH=~/.npm-global/bin:$PATH
RUN vapid new /home/vapid/root/
CMD vapid start
