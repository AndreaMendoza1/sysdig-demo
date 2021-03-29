FROM node:10-alpine
RUN mkdir /app
COPY index.js /app
WORKDIR /app
RUN npm install express
RUN npm update -g
RUN npm uninstall -g ssri
RUN npm uninstall -g cookie
RUN npm install ssri@^8.0.1 --save
EXPOSE 4444
CMD ["node", "index.js"]
