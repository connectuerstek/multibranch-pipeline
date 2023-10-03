FROM node:14
RUN apt-get update && apt-get install -y unzip
WORKDIR /app
RUN npm install
COPY com/ui/test/ctekUI-1.zip /app/ctekUI-1.zip
RUN unzip ctekUI-1.zip
EXPOSE 3005
