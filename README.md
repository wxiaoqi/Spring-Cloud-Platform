# AG-Admin
基于Spring Cloud的云分布式后台管理系统架构，核心技术采用Eureka、Fegin、Ribbon、Zuul、Hystrix、Security、OAth、Mybatis、Ace-cache等主要框架和中间件，UI采用Bootstrap、jquery等前端组件。

AG-Admin具有常用的用户管理、菜单管理等功能.可以通过任意扩展服务，来做到多系统并行，目前仅初步实现用权限管理系统的部分功能。

QQ群号：169824183

访问地址: http://120.77.133.155/admin/index 

账号/密码：admin/admin

![Markdown](http://i1.buimg.com/1949/39fbe8cbf5fd961f.png)

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
# 启动指南

- 运行数据库脚本，创建库：ag_admin，脚本：ace-admin/db/init.sql
- 依次运行main类：CenterBootstrap（ace-center）、GateBootstrap（ace-gate）、AdminBootstrap（ace-admin）、UIBootstrap（ace-ui）、MonitorBootstrap（ace-monitor）
- 访问地址: http://localhost:8765/admin/index  账号/密码：admin/admin
---------

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

### 2017年6月10日 用户管理增删改查例子

![Markdown](http://i2.muimg.com/1949/6d92e3a30f083ef9.png)
- 完成用户模块的增删该查
- 完成前后端分离的模块联通
- 完成监控模块


### 2017年6月13日 完成登录统一拦截
- 引入spring security进行统一登录拦截
![img](http://ofsc32t59.bkt.clouddn.com/17-06-15/1497541226023.jpg?imageView2/2/w/800)

### 2017年6月15日 完成菜单管理模块
- 引入boostrap table
- 抽象基础Controller类
- 完成菜单的增删改查和树状
![img](http://ofsc32t59.bkt.clouddn.com/17-06-15/1497540870148.jpg?imageView2/2/w/800)

### 2017年6月17日 完成多系统菜单切换功能
![Markdown](http://i1.buimg.com/1949/39fbe8cbf5fd961f.png)

### 2017年6月18日 完成用户角色、部门组模块
- 完成动态用户组设计
- 完成动态角色、部门组功能
![img](http://ofsc32t59.bkt.clouddn.com/17-06-17/1497698348097.jpg?imageView2/2/w/800)


# 欢迎交流
![img](http://ofsc32t59.bkt.clouddn.com/17-06-16/1497595760484.jpg)
