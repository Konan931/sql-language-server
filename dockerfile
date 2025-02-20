FROM node:18 AS builder
WORKDIR /opt/sql-language-server
COPY . .
RUN yarn install && yarn build

FROM node:18
WORKDIR /opt/sql-language-server
COPY --from=builder /opt/sql-language-server/dist .
CMD ["yarn", "start"]

