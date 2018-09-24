FROM node:latest
RUN adduser --system --group vapid
USER vapid
RUN mkdir /home/vapid/.npm-global/
ENV NPM_CONFIG_PREFIX="/home/vapid/.npm-global"
RUN npm config set prefix '/home/vapid/.npm-global'
RUN npm install -g vapid-cli
ENV PATH="/home/vapid/.npm-global/bin:$PATH"
RUN vapid new /home/vapid/root/
CMD vapid start
