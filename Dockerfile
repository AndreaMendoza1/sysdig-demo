FROM node:10-alpine

RUN mkdir /app
COPY index.js /app

WORKDIR /app/node_modules/
RUN npm rm cookie/

WORKDIR /usr/local/lib/node_modules/npm/node_modules/
RUN npm uninstall ssri
RUN npm update ssri@8.0.1

WORKDIR /app
RUN npm install express
EXPOSE 4444
CMD ["node", "index.js"]
