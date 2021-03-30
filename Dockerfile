FROM node:10-alpine

RUN mkdir /app
COPY index.js /app
WORKDIR /app
RUN npm update -g
RUN npm install express
RUN npm cache clean --force
RUN npm i cookie@0.4.1 --save
RUN npm i ssri@8.0.1 --save
RUN npm install -g npm-check-updates
RUN npm install -d
EXPOSE 4444
CMD ["node", "index.js"]
