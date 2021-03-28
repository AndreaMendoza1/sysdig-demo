FROM node:10-alpine

RUN mkdir /app
COPY index.js /app
WORKDIR /app
RUN npm install express
RUN npm update -g
RUN npm update ssri-8.0.1
RUN npm update libcrypto1.1.1.1k-r0
RUN npm update libssl1.1-1.1.1k-r0

EXPOSE 4444

CMD ["node", "index.js"]
