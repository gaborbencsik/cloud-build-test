FROM node:10.16.3

RUN npm i

RUN ls -lah

RUN npm t