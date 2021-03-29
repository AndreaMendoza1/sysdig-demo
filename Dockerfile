FROM node:10-alpine

# Create and define the node_modules's cache directory.
RUN mkdir /usr/src/cache
WORKDIR /usr/src/cache

# Install the application's dependencies into the node_modules's cache directory.
COPY package.json ./
COPY package-lock.json ./
RUN npm install

RUN mkdir /app
COPY index.js /app
WORKDIR /app

RUN npm install express

EXPOSE 4444

CMD ["node", "index.js"]
