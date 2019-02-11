FROM node:lts-alpine

WORKDIR /app

RUN apk update && \
    npm install -g npm && \
    npm i -g elm --unsafe-perm=true --allow-root
EXPOSE 9000
