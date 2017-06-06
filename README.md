# ace-security
基于Spring Cloud的云分布式架构，核心技术采用Eureka、Fegin、Ribbon、Zuul、Hystrix、Security、OAth、Mybatis、Ace-cache等主要框架和中间件，UI采用Bootstrap、jquery等前端组件。
![实战架构图](http://upload-images.jianshu.io/upload_images/5700335-ffdaae430bd39548.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
# 代码结构
### ace-center 服务注册中心
http://localhost:8761
![img](http://ofsc32t59.bkt.clouddn.com/17-06-06/1496710005237.jpg)

### ace-monitor 监控中心
http://localhost:8764
#### Spring Boot Admin 
![img](http://ofsc32t59.bkt.clouddn.com/17-06-06/1496710164517.jpg)
#### Hystrix Dashboard
![img](http://ofsc32t59.bkt.clouddn.com/17-06-06/1496720222517.jpg)

### ace-admin 服务层
http://localhost:8763
### ace-agent 客户端代理调用
http://localhost:8763

### ace-gate 网关负载中心，统一请求入口
http://localhost:8765

### ace-ui 前端UI，系统入口
http://localhost:8766

### ace-api 公共服务接口包


# 版本日志
### 2017年6月6日 初步架构搭建
1. 完成spring cloud相关核心组件整合和搭建
2. 完成Hello World服务的调用和负载
3. 完成网关的初步代理
4. 完成监控中心的搭建
