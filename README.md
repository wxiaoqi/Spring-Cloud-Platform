# AG-Admin
AG-Admin是基于Spring Cloud实现的`前后端分离`的后台管理信息系统，具备用户管理、部门管理、菜单管理等多个模块，支持多业务系统并行开发，可以作为后台管理系统的脚手架。代码简洁，架构清晰，适合学习和直接项目中使用。核心技术采用Eureka、Fegin、Ribbon、Zuul、Hystrix、Security、OAth、Mybatis、Ace-cache等主要框架和中间件，前端采用Layui组件。


QQ群号：169824183

访问地址: http://120.77.133.155/admin/index 

账号/密码：admin/admin

![Markdown](http://i1.buimg.com/1949/39fbe8cbf5fd961f.png)

---------

# 模块说明
![img](http://ofsc32t59.bkt.clouddn.com/17-06-28/1498635351391.jpg)

### 架构详解
#### 监控
利用Spring Boot Admin 来监控各个独立Service的运行状态；利用Hystrix Dashboard来实时查看接口的运行状态和调用频率等。
#### 负载均衡
将服务保留的rest进行代理和网关控制，除了平常经常使用的node.js、nginx外，Spring Cloud系列的zuul和rebbion，可以帮我们进行正常的网关管控和负载均衡。
#### 服务注册与调用
基于Eureka来实现的服务注册与调用，在Spring Cloud中使用Feign, 我们可以做到使用HTTP请求远程服务时能与调用本地方法一样的编码体验，开发者完全感知不到这是远程方法，更感知不到这是个HTTP请求。
#### 熔断机智
因为采取了服务的分布，为了避免服务之间的调用“雪蹦”，我采用了Hystrix的作为熔断器，避免了服务之间的“雪蹦”。

------

# 项目结构
```
├─ace-security
│  │  
│  ├─ace-admin----------------管理端服务层
│  │  
│  ├─ace-gate-----------------网关负载中心
│  │ 
│  ├─ace-ui-------------------前端UI层面
│  │    
│  ├─ace-center---------------服务注册中心
│  │   
│  ├─ace-monitor--------------监控中心
│  │     
│  └─ace-api------------------公共服务接口包
│  
```

------------
# 功能简介
1. 用户管理
2. 角色管理
3. 部门管理（待完善）
4. 菜单管理
5. 字典管理
6. 操作日志
8. 监控管理
9. 消息管理（待完善）
10. 代码生成（待完善）

-----

# 启动指南
## 部署须知
- mysql数据库一个，redis数据库一个
- jdk1.8
- IDE插件一个，lombok插件，具体百度即可

## 运行步骤
- 运行数据库脚本：依次运行数据库：ace-admin/db/init.sql
- 修改配置数据库配置：ace-admin/src/main/resources/application.yml、ace-gate/src/main/resources/application.yml
- 依次运行main类：CenterBootstrap（ace-center）、GateBootstrap（ace-gate）、AdminBootstrap（ace-admin）、UIBootstrap（ace-ui）
- 访问地址: http://localhost:8765/admin/index  账号/密码：admin/admin

## 运行博客
- 运行数据脚本：ace-blog-admin/db/init.sql
- 除了上述需要运行的main类外，依次运行BlogUIBootstrap、BlogAdminBootstrap
- 前端访问地址：http://localhost:9700/home
- 后端访问地址：http://localhost:8765/admin/index 账号/密码：blog/blog
# 开发指南
[AG-Admin开发手手册_v1.1](https://github.com/wxiaoqi/ace-admin/wiki/AG-Admin%E5%BC%80%E5%8F%91%E6%89%8B%E6%89%8B%E5%86%8C_v1.1)

---------

### 2017年7月19日 后端内容管理和前端博客demo
![img](http://ofsc32t59.bkt.clouddn.com/17-07-19/1500425312816.jpg)
![img](http://ofsc32t59.bkt.clouddn.com/17-07-19/1500425915328.jpg)
- 完成用户浏览前端和后端管理的demo

### 2017年7月7日 用户无状态登陆
-  完成用户基于token方式登陆
-  增加用户jwt认证

### 2017年6月25日 完成资源权限管控
![img](http://ofsc32t59.bkt.clouddn.com/17-06-24/1498313864701.jpg)
![img](http://ofsc32t59.bkt.clouddn.com/17-06-24/1498313774449.jpg)
- 集成spring session
- 完成服务无状态权限拦截
- 完成前端和后端权限拦截
- 页面按钮权限显示和隐藏（待完成）

### 2017年6月24日 完善监控模块
![img](http://ofsc32t59.bkt.clouddn.com/17-06-24/1498313933332.jpg)
![img](http://ofsc32t59.bkt.clouddn.com/17-06-24/1498314057039.jpg)
![img](http://ofsc32t59.bkt.clouddn.com/17-06-24/1498314097360.jpg)
- druid监控集成
- spring boot监控集成
- hystrix监控集成

### 2017年6月20日 完成角色和部门模块
![img](http://ofsc32t59.bkt.clouddn.com/17-06-17/1497698348097.jpg)
- 完成动态用户组设计
- 完成动态角色、部门组功能
- 完成角色与用户的关联
- 完成角色与菜单的关联

### 2017年6月17日 完成菜单管理模块
![img](http://ofsc32t59.bkt.clouddn.com/17-06-15/1497540870148.jpg)
- 引入boostrap table
- 抽象基础Controller类
- 完成菜单的增删改查和树状
- 多系统菜单切换


### 2017年6月13日 完成登录统一拦截
![img](http://ofsc32t59.bkt.clouddn.com/17-06-15/1497541226023.jpg?imageView2/2/w/800)
- spring security进行统一登录拦截

### 2017年6月10日 用户管理增删改查
![Markdown](http://i1.buimg.com/1949/39fbe8cbf5fd961f.png)
- 完成后端的UI的选型
- 完成首页改进
- 完成用户模块的增删该查
- 完成前后端分离的模块联通
- 完成监控模块

# 版本日志
### 2017年6月6日 初步架构搭建
- 完成spring cloud相关核心组件整合和搭建
- 完成Hello World服务的调用和负载
- 完成网关的初步代理
- 完成监控中心的搭建







# 欢迎交流
![img](http://ofsc32t59.bkt.clouddn.com/17-06-16/1497595760484.jpg)
