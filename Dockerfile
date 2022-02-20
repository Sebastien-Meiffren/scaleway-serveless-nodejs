FROM node:14.15.4-alpine

WORKDIR /home/app

COPY package.json .

RUN npm install

COPY tsconfig.json .
COPY src ./src

RUN npm run build
RUN npm run start