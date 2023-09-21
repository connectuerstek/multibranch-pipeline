FROM node:14
RUN apt-get update && apt-get install -y unzip
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY ctekUI.zip ./
RUN unzip ctekUI.zip
