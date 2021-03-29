FROM node:10-alpine

RUN mkdir /app
COPY index.js /app
WORKDIR /app
RUN npm update -g
RUN npm install express
RUN rm -rf node_modules
RUN npm cache clean --force
RUN npm install
EXPOSE 4444
CMD ["node", "index.js"]
