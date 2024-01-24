FROM node:18-alpine
WORKDIR /app
COPY . .
ENV \
    MYSQL_HOST=mysql \
    MYSQL_USER=root \
    MYSQL_PASSWORD=team1dockerada \
    MYSQL_DB=todos \
    SERVER_PORT=80
RUN yarn install
CMD ["node", "src/index.js"]
EXPOSE 80