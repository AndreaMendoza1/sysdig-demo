FROM node:10-alpine
RUN mkdir /app
COPY index.js /app
WORKDIR /app
RUN npm install express
RUN npm install -g npm-check-updates /
    npm rm --save ssri /
    npm rm --save cookie
RUN npm install ssri@8.0.1
EXPOSE 4444
CMD ["node", "index.js"]
