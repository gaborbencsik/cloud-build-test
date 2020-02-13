FROM node:10.16.3-slim

COPY . .

RUN npm i

RUN npm t