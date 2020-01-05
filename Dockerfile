FROM node:9-alpine

RUN apk add --no-cache --upgrade bash

COPY docker-entrypoint.sh /docker-entrypoint.sh

EXPOSE 3000

ENTRYPOINT [ "/docker-entrypoint.sh" ]
