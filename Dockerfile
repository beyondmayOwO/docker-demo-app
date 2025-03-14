FROM node:13-alpine AS builder

WORKDIR /usr/app

COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]

RUN npm install --production --silent

COPY src ./src

# -- Runtime stage --
FROM node:13-alpine

WORKDIR /usr/app

COPY --from=builder /usr/app/node_modules ./node_modules
COPY --from=builder /usr/app/src .

EXPOSE 3000

RUN chown -R node /usr/app

USER node

CMD ["node", "server.js"]
