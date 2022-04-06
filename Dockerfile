FROM node:lts-alpine
LABEL maintainer="paul@pcraig3.ca"

WORKDIR /app
COPY . .

RUN npm install --production --silent
RUN npm run scss

EXPOSE 3000
CMD ["npm", "run", "start:prod"]
