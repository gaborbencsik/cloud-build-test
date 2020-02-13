FROM node:10.16.3

COPY . .

RUN npm i

RUN npm t