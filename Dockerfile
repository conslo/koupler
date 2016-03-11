FROM java:8-jre

WORKDIR /app

ADD build/distributions/koupler-0.2.5-SNAPSHOT.tar.gz ./

ENTRYPOINT ["./koupler.sh"]
EXPOSE 4567
