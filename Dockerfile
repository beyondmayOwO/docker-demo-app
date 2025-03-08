FROM node:13-alpine

ENV NODE_ENV=production \
    MONGO_DB_USERNAME=admin \
    MONGO_DB_PWD=password

WORKDIR /usr/src/app

COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]

RUN npm install --production --silent && mv node_modules ../

COPY ./app .

EXPOSE 3000

RUN chown -R node /usr/src/app

USER node

CMD ["node", "server.js"]
