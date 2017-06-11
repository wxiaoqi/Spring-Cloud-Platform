# AG-Admin
基于Spring Cloud的云分布式后台管理系统架构，核心技术采用Eureka、Fegin、Ribbon、Zuul、Hystrix、Security、OAth、Mybatis、Ace-cache等主要框架和中间件，UI采用Bootstrap、jquery等前端组件。访问地址：http://localhost:8765/admin/index
![img](http://ofsc32t59.bkt.clouddn.com/17-06-07/1496827841773.jpg?imageView2/2/w/800)

---------

# 模块说明
![实战架构图](http://upload-images.jianshu.io/upload_images/5700335-ffdaae430bd39548.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/800)
### ace-center 服务注册中心
http://localhost:8761

### ace-monitor 监控中心
http://localhost:8764

### ace-admin 服务层
http://localhost:8763

### ace-agent 客户端代理调用
http://localhost:8763

### ace-gate 网关负载中心，统一请求入口
http://localhost:8765

### ace-ui 前端UI
http://localhost:8766

### ace-api 公共服务接口包

------------

# 版本日志
### 2017年6月6日 初步架构搭建
- 完成spring cloud相关核心组件整合和搭建
- 完成Hello World服务的调用和负载
- 完成网关的初步代理
- 完成监控中心的搭建

### 2017年6月10日 初步后台首页搭建

![img](http://ofsc32t59.bkt.clouddn.com/17-06-07/1496827841773.jpg?imageView2/2/w/800)

- 完成后端的UI的选型
- 完成首页改进
- 访问入口：http://localhost:8765/admin/index

### 2017年6月10日 用户管理增删改查例子

- 完成用户模块的增删该查
- 完成前后端分离的模块联通
- 完成监控模块
