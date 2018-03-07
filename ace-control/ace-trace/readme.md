# 运行下载命令
```
$ curl -sSL https://zipkin.io/quickstart.sh | bash -s
$ java -jar zipkin.jar
```
# 启动命令
```
RABBIT_URI=amqp://guest:guest@localhost:5672  STORAGE_TYPE=mysql MYSQL_DB=ag_zipkin MYSQL_USER=root MYSQL_PASS=123456 MYSQL_HOST=localhost MYSQL_USE_SSL=false java -jar zipkin.jar
```