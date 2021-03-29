FROM node:10-alpine
RUN mkdir /app
COPY index.js /app
WORKDIR /app
RUN npm install express
RUN npm install -g npm-check-updates
RUN npm uninstall --save ssri@6.0.1
RUN npm uninstall --save cookie@0.4.0
RUN npm install ssri@8.0.1
EXPOSE 4444
CMD ["node", "index.js"]
