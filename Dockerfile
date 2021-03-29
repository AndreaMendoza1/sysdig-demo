FROM node:10-alpine

RUN mkdir /app
COPY index.js /app
WORKDIR /app

RUN npm update -g
RUN npm install express

EXPOSE 4444

CMD ["node", "index.js"]
