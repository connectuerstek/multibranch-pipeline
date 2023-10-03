FROM node:14
RUN apt-get update && apt-get install -y unzip
WORKDIR /app
RUN npm install
COPY com/ui/test/ctekUI.zip /app/ctekUI.zip
WORKDIR /app
RUN unzip ctekUI.zip
