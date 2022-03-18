FROM node:lts-alpine
LABEL maintainer="paul@pcraig3.ca"

WORKDIR /app
COPY . .

RUN npm install --production --silent

EXPOSE 3000
CMD ["npm", "start"]