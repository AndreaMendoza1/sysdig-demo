FROM node:10-alpine

RUN mkdir /app
COPY index.js /app
WORKDIR /app
RUN npm uninstall -g ssri --save
RUN npm install express
EXPOSE 4444
CMD ["node", "index.js"]
