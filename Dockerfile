FROM node:alpine AS builder
RUN apk add g++ make python
WORKDIR source
COPY package.json .
COPY yarn.lock .
RUN yarn install
COPY . .
RUN yarn test
CMD ["yarn", "serve"]
