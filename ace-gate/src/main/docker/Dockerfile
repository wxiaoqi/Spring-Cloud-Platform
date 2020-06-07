FROM livingobjects/jre8
VOLUME /tmp
# 将jar包添加到容器中并更名为app.jar
ADD ace-gate.jar app.jar
# 运行jar包
RUN bash -c 'touch /app.jar'
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]