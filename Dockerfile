FROM node:16.19.1-alpine3.17

RUN apk add --no-cache --upgrade bash

COPY docker-entrypoint.sh /docker-entrypoint.sh

EXPOSE 3000

ENTRYPOINT [ "/docker-entrypoint.sh" ]
