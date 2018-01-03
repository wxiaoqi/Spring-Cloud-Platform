FROM java:8
VOLUME /tmp
ADD ace-gate.jar app.jar
ADD wait-for-it.sh /wait-for-it.sh
RUN sh -c 'touch /app.jar'
RUN bash -c 'chmod 777 /wait-for-it.sh'
CMD exec java -Djava.security.egd=file:/dev/./urandom -jar /app.jar