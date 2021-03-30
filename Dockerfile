FROM node:10-alpine

RUN mkdir /app
COPY index.js /app
WORKDIR /app
COPY ["package.json", "package-lock.json*", "./"]

RUN npm update -g
RUN npm install express
RUN npm cache clean --force
USER root
RUN npm i cookie@0.4.1 --save
RUN npm i ssri@8.0.1 --save
EXPOSE 4444
CMD ["node", "index.js"]
