FROM node:10-alpine

RUN mkdir /app
COPY index.js /app
WORKDIR /app

RUN rm -rf /usr/local/lib/node_modules/npm/node_modules/*

RUN npm install express

EXPOSE 4444

CMD ["node", "index.js"]
