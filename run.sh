#!/bin/sh

if [ -z "$VCAP_SERVICES" ]; then #doesn't exist
  echo "no volume attached from CF....."
else #Exists
  VOL_PATH="$(echo ${VCAP_SERVICES} | grep container_path | awk {'print $23'} | sed 's/,//g' | tr -d '"')"
  ln -s ${VOL_PATH} /data/minecraft
  java -Xmx1024M -Xms1024M -jar /app/minecraft_server.jar nogui
fi
