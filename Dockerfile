FROM node:10-alpine
RUN mkdir /app
COPY index.js /app
WORKDIR /app
RUN npm install express
RUN npm update -g
RUN npm uninstall -g ssri@6.0.1 --save
RUN npm uninstall -g cookie@0.4.0 --save
RUN npm install ssri@8.0.1
EXPOSE 4444
CMD ["node", "index.js"]
