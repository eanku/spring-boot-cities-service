#!/bin/bash

sudo apt-get update
sudo apt-get -y install default-jdk
sudo apt-get -y install git-core
DIR=spring-boot-cities-ui
if [ ! -d "$DIR" ]; then
  git clone https://github.com/Sufyaan-Kazi/spring-boot-cities-ui.git
fi
cd $DIR
export SPRING_CITIES_WS_URL=http://192.168.5.5:8080/cities
echo "****************** Connecting to cities-service: ${SPRING_CITIES_WS_URL} *********************"
sleep 5
nohup ./gradlew bootRun
