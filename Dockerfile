FROM node:16.13.0-alpine3.14

RUN apk add --no-cache --upgrade bash

COPY docker-entrypoint.sh /docker-entrypoint.sh

EXPOSE 3000

ENTRYPOINT [ "/docker-entrypoint.sh" ]
