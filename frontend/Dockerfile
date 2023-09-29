FROM node:14
RUN apt-get update && apt-get install -y unzip
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY com/ui/test/spUI.zip /app/spUI.zip
RUN unzip spUI.zip
COPY index.html /app/
COPY Jenkinsfile /app/
COPY script.js /app/
COPY style.css /app/
EXPOSE 3005
