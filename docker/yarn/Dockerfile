FROM node:9-alpine
LABEL maintainer "saboyutaka<yutaka.paradigm.shift@gmail.com>"

RUN mkdir -p /app
WORKDIR /app

RUN apk --no-cache update && \
    apk --no-cache add make bash g++ zlib-dev libpng-dev && \
    rm -fr /var/cache/apk/*

RUN npm install -g npm && \
    npm install -g yarn

ENTRYPOINT ["yarn"]
