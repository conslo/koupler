#!/bin/sh -e
./build.sh
cd build/distributions
unzip koupler-0.2.5-SNAPSHOT.zip
cd koupler-0.2.5-SNAPSHOT
tar -cv * > ../koupler-0.2.5-SNAPSHOT.tar
cd ../../..

# Only use sudo if there's no configured remote host
if [ -n "${DOCKER_HOST}" ]
then
	PRE=''
else
	PRE='sudo'
fi

${PRE} docker build -t koupler .
${PRE} docker run --env-file=aws.env --rm -p=4567:${2} -it koupler -streamName "${1}" -http
