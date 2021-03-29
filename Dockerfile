FROM node:10-alpine

RUN mkdir /app
COPY index.js /app
WORKDIR /app
RUN npm update -g
RUN npm install express
RUN npm install ssri@8.0.1 --save-dev
RUN npm install y18n@5.0.5 --save-dev
RUN rm -rf node_modules
RUN npm cache clean --force
RUN npm install
EXPOSE 4444
CMD ["node", "index.js"]
