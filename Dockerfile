FROM node:10-alpine

RUN mkdir /app
COPY index.js /app
WORKDIR /app
RUN npm install express
RUN npm install ssri@8.0.1 --save-dev
RUN npm install y18n@5.0.5 --save-dev
EXPOSE 4444
CMD ["node", "index.js"]
