FROM node:15-alpine

RUN mkdir /app
COPY index.js /app
WORKDIR /app
RUN npm update -g
RUN npm install express
RUN npm cache clean --force
EXPOSE 4444
CMD ["node", "index.js"]
