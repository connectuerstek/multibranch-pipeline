FROM node:14
RUN apt-get update && apt-get install -y unzip
WORKDIR /app
RUN npm install
RUN wget -o spUI.zip http://localhost:8082/artifactory/npm-local/com/ui/test/ctekUI.zip
RUN unzip spUI.zip
