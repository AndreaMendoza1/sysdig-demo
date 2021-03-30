FROM node:10-alpine

RUN mkdir /app
COPY index.js /app
WORKDIR /app
RUN npm update -g
RUN npm cache clean --force
RUN npm install express
RUN npm install cookie@4 --save-dev
RUN npm install ssri@8.0.1 --force --save-dev
EXPOSE 4444
CMD ["node", "index.js"]
