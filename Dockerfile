FROM woovie/alpine-supervisord

ENV USER "vapid"
ENV PORT 3000

RUN adduser -S ${USER}
USER ${USER}
RUN mkdir /home/${USER}/.npm-global/
ENV NPM_CONFIG_PREFIX "/home/${USER}/.npm-global"
RUN npm config set prefix "/home/${USER}/.npm-global"


USER root
RUN apk add --no-cache --virtual .build-deps alpine-sdk python
USER ${USER}
RUN npm install -g vapid-cli
USER root
RUN apk del .build-deps
USER ${USER}

ENV PATH "/home/${USER}/.npm-global/bin:$PATH"
EXPOSE ${PORT}
ENTRYPOINT ["vapid"]
CMD ["--version"]
