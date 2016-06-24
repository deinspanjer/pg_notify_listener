FROM mhart/alpine-node:base

MAINTAINER dre@designet.com

COPY src/ /src

WORKDIR /src
ENTRYPOINT ["node", "pg_notify_listener.js"]
