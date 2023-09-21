FROM node:14
RUN apt-get update && apt-get install -y unzip
WORKDIR /app
RUN npm install
RUN wget -o ctekUI.zip http://localhost:8082/artifactory/npm-local/com/ui/test/ctekUI.zip
RUN unzip ctekUI.zip
