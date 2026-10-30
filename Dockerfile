FROM node:lts-alpine
LABEL maintainer="paul@pcraig.ca"

ARG GITHUB_SHA_ARG
ENV GITHUB_SHA=$GITHUB_SHA_ARG

WORKDIR /app

COPY package.json package-lock.json ./

RUN apk add --no-cache --virtual .build-deps python3 make g++ \
    && npm ci --omit=dev \
    && apk del .build-deps \
    && npm cache clean --force

COPY . .

RUN npm run scss

EXPOSE 3000
CMD ["npm", "run", "start:prod"]