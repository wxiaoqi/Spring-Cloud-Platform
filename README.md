### Cloud-Platform

Cloud-Platform是国内首个基于`Spring 
Cloud`微`服务`化`开发平台`，具有统一授权、认证后台管理系统，其中包含具备用户管理、资源权限管理、网关API
管理等多个模块，支持多业务系统并行开发，可以作为后端服务的开发脚手架。代码简洁，架构清晰，适合学习和直接项目中使用。
核心技术采用`Spring Boot 
2.1.2`以及`Spring Cloud (Greenwich.RELEASE)
`相关核心组件，采用`Nacos`注册和配置中心，集成流量卫兵`Sentinel`，前端采用`vue-element-admin`组件，`Elastic Search`自行集成。

### QQ群号：169824183(1)、592462556(2)、661605461(3)

### 公众号
![输入图片说明](https://images.gitee.com/uploads/images/2020/1020/173334_53541846_547642.png "WX20201020-173326@2x.png")

#### 开源用户登记，宣传用：[点击打开](https://gitee.com/geek_qi/cloud-platform/issues/II9SP)

#### 最新更新日志，[点击查看](https://gitee.com/geek_qi/cloud-platform/wikis/Cloud-Platform更新日志?sort_id=320050)

#### 基础文档，[点击查看](https://gitee.com/geek_qi/cloud-platform/blob/master/dev-doc.md)

# 模块说明
![架构图](https://images.gitee.com/uploads/images/2019/0528/205306_9a8b8d83_1899222.png "1.png")


### 架构摘要
#### 中台化前端
集成`d2admin`中台化前端，优化前端架构和功能布局，支撑中台服务化的应用开发。

#### JWT鉴权
通过`JWT`的方式来进行用户认证和信息传递，保证服务之间用户无状态的传递。

#### 监控
利用Spring Boot Admin 来监控各个独立Service的运行状态；利用Hystrix Dashboard来实时查看接口的运行状态和调用频率等。

#### 负载均衡
将服务保留的rest进行代理和网关控制，除了平常经常使用的node.js、nginx外，Spring Cloud系列的zuul和ribbon，可以帮我们进行正常的网关管控和负载均衡。其中扩展和借鉴国外项目的扩展基于JWT的`Zuul限流插件`，方面进行限流。

#### 服务注册与调用
基于`Nacos`来实现的服务注册与调用，在Spring Cloud中使用Feign, 我们可以做到使用HTTP请求远程服务时能与调用本地方法一样的编码体验，开发者完全感知不到这是远程方法，更感知不到这是个HTTP请求。

#### 熔断与流控
集成阿里`Sentinel`进行接口流量控制，通过熔断和降级处理避免服务之间的调用“雪崩”。

------

## 功能截图

### 基本功能
# 功能截图

![用户模块](https://images.gitee.com/uploads/images/2020/0823/155325_c046aafe_547642.png "会员模块.png")

![菜单模块](https://images.gitee.com/uploads/images/2020/0823/155423_ce11e6c6_547642.png "菜单模块.png")

![角色授权](https://images.gitee.com/uploads/images/2020/0823/155515_511c1ec7_547642.png "角色授权.png")

![角色类型](https://images.gitee.com/uploads/images/2020/0823/155635_8a29c078_547642.png "角色类型.png")

![操作日志](https://images.gitee.com/uploads/images/2020/0823/170358_7e4bb227_547642.png "操作日志.png")
![输入图片说明](https://images.gitee.com/uploads/images/2020/0905/104143_28550ac6_547642.png "代码生成器.png")
![输入图片说明](https://images.gitee.com/uploads/images/2020/0905/104050_11c47991_547642.png "代码生成2.png")
![输入图片说明](https://images.gitee.com/uploads/images/2020/0905/104232_aa08064d_547642.png "表单设计器.png")
![输入图片说明](https://images.gitee.com/uploads/images/2020/0823/171316_d05156ac_547642.png "表单设计器.png")

![输入图片说明](https://images.gitee.com/uploads/images/2019/0528/205334_7a892d09_1899222.png "2.png")

![输入图片说明](https://images.gitee.com/uploads/images/2019/0528/205343_124202af_1899222.png "3.png")

![输入图片说明](https://images.gitee.com/uploads/images/2019/0528/205353_2fd7c93f_1899222.png "4.png")

![输入图片说明](https://images.gitee.com/uploads/images/2019/0528/205407_942a9540_1899222.png "5.png")

## License
Apache License Version 2.0

