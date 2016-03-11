#!/bin/sh -e
./build.sh
cd build/distributions
unzip koupler-0.2.5-SNAPSHOT.zip
cd koupler-0.2.5-SNAPSHOT
tar -cv * > ../koupler-0.2.5-SNAPSHOT.tar
cd ../../..

docker build -t koupler .
docker run --env-file=aws.env --rm -p=4567:${2} -it koupler -streamName "${1}" -http
