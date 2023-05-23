FROM node:alpine

WORKDIR /usr/src

COPY package.json .

RUN yarn install --pure-lockfile

COPY . .

EXPOSE 3000
