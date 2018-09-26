FROM woovie/alpine-supervisord
ENV USER "vapid"
ENV PORT 3000
RUN adduser --system --group ${USER}
USER ${USER}
RUN mkdir /home/${USER}/.npm-global/
ENV NPM_CONFIG_PREFIX "/home/${USER}/.npm-global"
RUN npm config set prefix "/home/${USER}/.npm-global"
RUN npm install -g vapid-cli
ENV PATH "/home/${USER}/.npm-global/bin:$PATH"
EXPOSE ${PORT}
ENTRYPOINT vapid
CMD vapid --version
