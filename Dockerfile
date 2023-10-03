FROM node:14
RUN apt-get update && apt-get install -y unzip
WORKDIR /app
RUN npm install
COPY com/ui/test/spUI.zip /app/spUI.zip
WORKDIR /app
RUN unzip spUI.zip
