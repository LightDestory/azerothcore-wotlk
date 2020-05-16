#!/usr/bin/env bash

#
# THIS FILE IS USED TO DEPLOY THE AZEROTHCORE TO THE STAGING SERVER
#

set -e


sudo apt-get -y install screen
killall -9 authserver 2>/dev/null
killall -9 worldserver 2>/dev/null
./acore.sh init
./acore.sh "client-data"
screen -S authserver -d -m ./acore.sh run-authserver
screen -S worldserver -d -m ./acore.sh run-worldserver


