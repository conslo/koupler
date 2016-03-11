#!/bin/sh -e
./build.sh
cd build/distributions
unzip koupler-0.2.5-SNAPSHOT.zip
cd koupler-0.2.5-SNAPSHOT
tar -cvz * > ../koupler-0.2.5-SNAPSHOT.tar.gz
cd ../../..

sudo docker build -t koupler .
sudo docker run --env-file=aws.env --rm -p=4567:${2} -it koupler -streamName "${1}" -http
