FROM node:lts-alpine

WORKDIR /app

RUN apk update && \
    npm install -g npm && \
    yarn add elm
EXPOSE 9000
