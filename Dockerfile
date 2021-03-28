FROM node:10-alpine

RUN mkdir /app
COPY index.js /app
WORKDIR /app
RUN npm install express
RUN npm update -g
RUN npm-upgrade '*ssri*'
EXPOSE 4444

CMD ["node", "index.js"]
