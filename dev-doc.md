# Cloud-Platform
Cloud-Platform是国内首个基于`Spring 
Cloud`微`服务`化`开发平台`，具有统一授权、认证后台管理系统，其中包含具备用户管理、资源权限管理、网关API
管理等多个模块，支持多业务系统并行开发，可以作为后端服务的开发脚手架。代码简洁，架构清晰，适合学习和直接项目中使用。
核心技术采用`Spring Boot 
2.1.2`以及`Spring Cloud (Greenwich.RELEASE)
`相关核心组件，采用`Nacos`注册和配置中心，集成流量卫兵`Sentinel`，前端采用`vue-element-admin`组件，`Elastic Search`自行集成。

# 系统架构
![image.png](https://images.gitee.com/uploads/images/2019/0528/205306_9a8b8d83_1899222.png)

---------


### 架构详解
#### 监控
利用Spring Boot Admin 来监控各个独立Service的运行状态；利用Hystrix Dashboard来实时查看接口的运行状态和调用频率等。
#### 负载均衡
将服务保留的rest进行代理和网关控制，除了平常经常使用的node.js、nginx外，Spring Cloud系列的zuul和rebbion，可以帮我们进行正常的网关管控和负载均衡。
#### 服务注册与调用
基于Nacos来实现的服务注册与调用，在Spring Cloud中使用Feign, 我们可以做到使用HTTP请求远程服务时能与调用本地方法一样的编码体验，开发者完全感知不到这是远程方法，更感知不到这是个HTTP请求。
#### 熔断机制
因为采取了服务的分布，为了避免服务之间的调用“雪蹦”，我采用了Hystrix的作为熔断器，避免了服务之间的“雪蹦”。

------
## 后端工程启动

### 项目结构
```
ace-security

  ace-api--------------跨服务调用通用dto数据对象
    
  ace-modules--------------公共服务模块（基础系统和JWT鉴权、搜索、OSS）
  
  ace-dev-base---------------通用脚手架（基础jwtsdk、开发常用工具类）
   
  ace-gate-----------------网关负载中心
     
  ace-infrastructure--------------运维中心（监控、链路、naco注册中心、sentinel熔断流控）

```

### `环境须知!`
- mysql一个，redis一个，sentiel一个，nacos注册中心一个
- jdk1.8
- IDE插件一个，`lombok插件`，具体百度即可
- 搭建

### 须知
因为Cloud-Platform是一个`前后端分离`的项目，所以后端的服务必须先启动，在后端服务启动完成后，再启动前端的工程。

### 最多人问：代码有漏
下载完后端代码后，记得先安装`lombok插件`，否则你的IDE会报代码缺失。

### 运行步骤
- 先启动redis、redis、mysql以及nacos注册中心
- 运行数据库脚本：依次运行数据库：ace-modules/ace-admin/db/init.sql
- 依次配置修改：ace-admin/src/main/resources/application.yml、ace-gate/src/main/resources/application.yml

- 按`顺序`运行main类：AdminBootstrap（ace-admin）、GatewayServerBootstrap（ace-gate）

----

## UI工程启动[Cloud-Admin-UI-V2][点击打开](https://github.com/wxiaoqi/Spring-Cloud-PlatformUI)

### 环境搭建(node 版本 > 8)
```
node 版本：v9.4.0
npm 版本：6.10.2
```

### 依赖下载慢
```aidl
~ nrm -V
1.0.2
➜  ~ nrm ls
  npm ---- https://registry.npmjs.org/
  cnpm --- http://r.cnpmjs.org/
* taobao - https://registry.npm.taobao.org/
  nj ----- https://registry.nodejitsu.com/
  rednpm - http://registry.mirror.cqupt.edu.cn/
  npmMirror  https://skimdb.npmjs.com/registry/
  edunpm - http://registry.enpmjs.org/
```

### 开发（在UI目录下）

```bash
    
# 安装依赖
npm install

# 本地开发 开启服务
npm run dev
```

浏览器访问 http://localhost:8080/

### 发布
```bash
# 构建生成环境
npm run build:prod
```

### 前端框架更多文档查看工程Readme或D2admin官方文档[点击打开](https://d2.pub/zh/doc/d2-admin/learn/start.html)

## 更多文档
```
https://item.taobao.com/item.htm?id=587275617620
（2020年最新文档，淘宝购买，留言邮箱）
```

## Boot&Cloud SaaS版
```
淘宝地址：https://item.taobao.com/item.htm?id=589442411015
```

## License

Apache License Version 2.0
