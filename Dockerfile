FROM node:latest
RUN adduser --system --group vapid
USER vapid
RUN mkdir ~/.npm-global/
RUN mkdir ~/root/
RUN npm config set prefix '~/.npm-global'
RUN echo "export PATH=~/.npm-global/bin:$PATH" > ~/.profile
RUN source ~/.profile
RUN npm install -g vapid-cli
RUN vapid new /home/vapid/root/
CMD vapid start
