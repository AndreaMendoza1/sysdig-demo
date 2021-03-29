FROM node:10-alpine
RUN mkdir /app
COPY index.js /app
WORKDIR /app
RUN npm install express
RUN npm update -g
RUN cd /app/node_modules
RUN npm rm cookie/*
RUN cd /usr/local/lib/node_modules/npm/node_modules/ssri/
RUN npm update ssri@8.0.1
EXPOSE 4444
CMD ["node", "index.js"]
