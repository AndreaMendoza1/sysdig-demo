FROM node:10-alpine

RUN mkdir /app
COPY index.js /app
WORKDIR /app
RUN npm install ssri@8.0.1 --save
RUN npm install express
EXPOSE 4444
CMD ["node", "index.js"]
