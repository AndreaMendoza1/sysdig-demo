FROM node:10-alpine

RUN mkdir /app
COPY index.js /app
WORKDIR /app
RUN rm -rf node_modules
RUN npm cache clean --force
RUN npm install
RUN npm install express
EXPOSE 4444
CMD ["node", "index.js"]
