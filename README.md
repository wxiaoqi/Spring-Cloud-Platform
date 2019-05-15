# Cloud-Platform
Cloud-Platform是国内首个基于`Spring 
Cloud`微`服务`化`开发平台`，具有统一授权、认证后台管理系统，其中包含具备用户管理、资源权限管理、网关API
管理等多个模块，支持多业务系统并行开发，可以作为后端服务的开发脚手架。代码简洁，架构清晰，适合学习和直接项目中使用。
核心技术采用`Spring Boot 
2.1.2`以及`Spring Cloud (Greenwich.RELEASE)
`相关核心组件，采用`Nacos`注册和配置中心，集成流量卫兵`Sentinel`，前端采用`vue-element-admin`组件，`Elastic Search`自行集成。

### QQ群号：169824183(1)、661605461(2)

### 开源用户登记，宣传用：[点击打开](https://gitee.com/geek_qi/cloud-platform/issues/II9SP)

### 最新更新日志，[点击查看](https://gitee.com/geek_qi/cloud-platform/wikis/Cloud-Platform更新日志?sort_id=320050)

### 基础文档，[点击查看](https://gitee.com/geek_qi/cloud-platform/wikis/Home)

# 模块说明
![image.png](https://upload-images.jianshu.io/upload_images/5700335-dab38445194e6729.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

### 架构摘要
#### 服务鉴权
通过`JWT`的方式来加强服务之间调度的权限验证，保证内部服务的安全性。

#### 监控
利用Spring Boot Admin 来监控各个独立Service的运行状态；利用Hystrix Dashboard来实时查看接口的运行状态和调用频率等。

#### 负载均衡
将服务保留的rest进行代理和网关控制，除了平常经常使用的node.js、nginx外，Spring Cloud系列的zuul和ribbon，可以帮我们进行正常的网关管控和负载均衡。其中扩展和借鉴国外项目的扩展基于JWT的`Zuul限流插件`，方面进行限流。

#### 服务注册与调用
基于Nacos来实现的服务注册与调用，在Spring Cloud中使用Feign, 我们可以做到使用HTTP请求远程服务时能与调用本地方法一样的编码体验，开发者完全感知不到这是远程方法，更感知不到这是个HTTP请求。

#### 熔断机制
因为采取了服务的分布，为了避免服务之间的调用“雪崩”，采用了`Hystrix`的作为熔断器，避免了服务之间的“雪崩”。

------

## 功能截图

### 基本功能
# 功能截图
![image.png](https://upload-images.jianshu.io/upload_images/5700335-bb4d5072f32f5927.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/5700335-a9f26458195dca0f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/5700335-6cc59493c7726637.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/5700335-6d1898aec1f8d6ae.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![img](http://upload-images.jianshu.io/upload_images/5700335-002735d1727ec11b.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![img](http://upload-images.jianshu.io/upload_images/5700335-e5e56924aaeacf1e.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![img](http://upload-images.jianshu.io/upload_images/5700335-b3044673b4a55203.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![img](http://upload-images.jianshu.io/upload_images/5700335-75151a17ae4319cf.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![img](http://upload-images.jianshu.io/upload_images/5700335-ab942829c130389e.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![img](http://upload-images.jianshu.io/upload_images/5700335-30e6df679695f150.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![img](http://upload-images.jianshu.io/upload_images/5700335-347e3e761188a824.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![img](http://upload-images.jianshu.io/upload_images/5700335-569696e4e70e5ad2.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](http://upload-images.jianshu.io/upload_images/5700335-e83767c67c15c2e8.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


## License
Apache License Version 2.0