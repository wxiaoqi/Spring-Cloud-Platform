
CREATE DATABASE ag_blog DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
Use ag_blog;
/*
 Navicat Premium Data Transfer

 Source Server         : ag-admin
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : localhost
 Source Database       : ag_blog

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : utf-8

 Date: 07/19/2017 09:03:12 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `blog_article`
-- ----------------------------
DROP TABLE IF EXISTS `blog_article`;
CREATE TABLE `blog_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` longtext,
  `remark` varchar(1000) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `is_del` char(1) DEFAULT NULL,
  `page_view` int(11) DEFAULT '1',
  `cover` varchar(255) DEFAULT NULL,
  `crt_time` datetime DEFAULT NULL,
  `crt_user` varchar(255) DEFAULT NULL,
  `crt_name` varchar(255) DEFAULT NULL,
  `crt_host` varchar(255) DEFAULT NULL,
  `upd_time` datetime DEFAULT NULL,
  `upd_user` varchar(255) DEFAULT NULL,
  `upd_name` varchar(255) DEFAULT NULL,
  `upd_host` varchar(255) DEFAULT NULL,
  `attr1` varchar(255) DEFAULT NULL,
  `attr2` varchar(255) DEFAULT NULL,
  `attr3` varchar(255) DEFAULT NULL,
  `attr4` varchar(255) DEFAULT NULL,
  `attr5` varchar(255) DEFAULT NULL,
  `attr6` varchar(255) DEFAULT NULL,
  `attr7` varchar(255) DEFAULT NULL,
  `attr8` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Records of `blog_article`
-- ----------------------------
BEGIN;
INSERT INTO `blog_article` VALUES ('44', 'Hello World', '# Hello World', 'Hello World', null, null, '1', null, '2017-07-16 17:11:29', '4', 'blog', '0:0:0:0:0:0:0:1', null, null, null, null, null, null, null, null, null, null, null, null), ('45', 'Spring cloud实战-Zuul如何动态负载和服务发现扩容', '<p># Zuul、Fegin、Rebbion、Eureka一条龙</p><p>很多人都自然而然把zuul当成nginx那样来在配置写死节点配置来。实际上zuul和eureka的是可以完美配合，完全可以基于`服务名`的注册和发现,来动态的实现服务的`动态负载`和`动态注册`，从而达到`不需要重启zuul即可达到动态扩容的`。下文将介绍静态配置路由表和从Eureka发现服务的方式来加强Zuul的使用。</p><p># 项目地址：</p><p>AG-Admin：http://git.oschina.net/geek_qi/ace-security</p><p><br></p><p># GateWay搭建</p><p>![img](http://ofsc32t59.bkt.clouddn.com/17-06-27/1498551569658.jpg)</p><p>## Maven依赖</p><p>```</p><p>&lt;dpendency&gt;</p><p>&nbsp; &nbsp; &lt;groupId&gt;org.springframework.cloud&lt;/groupId&gt;</p><p>&nbsp; &nbsp; &lt;artifactId&gt;spring-cloud-starter-zuul&lt;/artifactId&gt;</p><p>&lt;/dependency&gt;</p><p>&lt;dependency&gt;</p><p>&nbsp; &nbsp; &lt;groupId&gt;org.springframework.cloud&lt;/groupId&gt;</p><p>&nbsp; &nbsp; &lt;artifactId&gt;spring-cloud-starter-feign&lt;/artifactId&gt;</p><p>&lt;/dependency&gt;</p><p>&lt;dependency&gt;</p><p>&nbsp; &nbsp; &lt;groupId&gt;org.springframework.cloud&lt;/groupId&gt;</p><p>&nbsp; &nbsp; &lt;artifactId&gt;spring-cloud-starter-eureka&lt;/artifactId&gt;</p><p>&lt;/dependency&gt;</p><p>&lt;dependency&gt;</p><p>&nbsp; &nbsp; &lt;groupId&gt;org.springframework.session&lt;/groupId&gt;</p><p>&nbsp; &nbsp; &lt;artifactId&gt;spring-session&lt;/artifactId&gt;</p><p>&nbsp; &nbsp; &lt;version&gt;1.2.2.RELEASE&lt;/version&gt;</p><p>&lt;/dependency&gt;</p><p>&lt;dependency&gt;</p><p>&nbsp; &nbsp; &lt;groupId&gt;org.springframework.boot&lt;/groupId&gt;</p><p>&nbsp; &nbsp; &lt;artifactId&gt;spring-boot-starter-redis&lt;/artifactId&gt;</p><p>&lt;/dependency&gt;</p><p>```</p><p><br></p><p>## 基于Eureka的application.yml（关键）</p><p>```</p><p>spring:</p><p>&nbsp; &nbsp; application:</p><p>&nbsp; &nbsp; &nbsp; &nbsp; name: ace-gate</p><p>&nbsp; &nbsp; thymeleaf:</p><p>&nbsp; &nbsp; &nbsp; &nbsp; mode: LEGACYHTML5</p><p>&nbsp; &nbsp; &nbsp; &nbsp; cache: false</p><p>&nbsp; &nbsp; redis:</p><p>&nbsp; &nbsp; &nbsp; &nbsp; database: 1</p><p>&nbsp; &nbsp; &nbsp; &nbsp; host: 127.0.0.1</p><p>&nbsp; &nbsp; &nbsp; &nbsp; pool:</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; max-active: 20</p><p>server:</p><p>&nbsp; &nbsp; port: 8765 #启动端口</p><p><br></p><p>#开启动态网关服务发现</p><p>ribbon:</p><p>&nbsp; eureka:</p><p>&nbsp; &nbsp; enabled: true&nbsp;</p><p>&nbsp; &nbsp;&nbsp;</p><p>#配置zuul路由表，静态路由</p><p>#zuul:</p><p># &nbsp;#prefix: /techouse #为zuul设置一个公共的前缀</p><p># &nbsp;#ignoredServices: \'*\'</p><p># &nbsp;routes:</p><p># &nbsp; &nbsp;ace-admin: #随便定义，当不存在serviceId时，默认该值为serviceId（就是注册服务的名称，属性spring.application.name）</p><p># &nbsp; &nbsp; &nbsp;path: /test/** #匹配/test/** 均路由到cloud-client</p><p>&nbsp; &nbsp; &nbsp;&nbsp;</p><p>#基于静态路由节点的ribbon负载均衡配置</p><p>#ace-admin:</p><p># &nbsp;ribbon:</p><p># &nbsp; &nbsp;listOfServers: 127.0.0.1:8767&nbsp;</p><p>&nbsp; &nbsp;&nbsp;</p><p>eureka:</p><p>&nbsp; &nbsp; instance:</p><p>&nbsp; &nbsp; &nbsp; &nbsp; statusPageUrlPath: ${management.context-path}/info</p><p>&nbsp; &nbsp; &nbsp; &nbsp; healthCheckUrlPath: ${management.context-path}/health</p><p>&nbsp; &nbsp; client:</p><p>&nbsp; &nbsp; &nbsp; &nbsp; serviceUrl:</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; defaultZone: http://localhost:8761/eureka/</p><p>security:</p><p>&nbsp; &nbsp; user:</p><p>&nbsp; &nbsp; &nbsp; &nbsp; name: admin</p><p>&nbsp; &nbsp; &nbsp; &nbsp; password: admin</p><p>&nbsp; &nbsp; &nbsp; &nbsp; role: USER</p><p>#避免第一次调用失败</p><p>hystrix:</p><p>&nbsp; command:</p><p>&nbsp; &nbsp; default:</p><p>&nbsp; &nbsp; &nbsp; execution:</p><p>&nbsp; &nbsp; &nbsp; &nbsp; isolation:</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; thread:</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; timeoutInMilliseconds: 5000</p><p><br></p><p>#请求和响应GZIP压缩支持</p><p>feign:</p><p>&nbsp; compression:</p><p>&nbsp; &nbsp; request:</p><p>&nbsp; &nbsp; &nbsp; enabled: true</p><p>&nbsp; &nbsp; &nbsp; mime-types: text/xml,application/xml,application/json</p><p>&nbsp; &nbsp; &nbsp; min-request-size: 2048</p><p>&nbsp; &nbsp; response:</p><p>&nbsp; &nbsp; &nbsp; enabled: true</p><p><br></p><p>```</p><p>## 启用Zuul、Fegin、Eureka注解</p><p>```</p><p>@SpringBootApplication</p><p>@EnableEurekaClient</p><p>@EnableDiscoveryClient</p><p>@EnableFeignClients</p><p>@EnableZuulProxy</p><p>@EnableRedisHttpSession(redisFlushMode = RedisFlushMode.IMMEDIATE)</p><p>public class GateBootstrap {</p><p>&nbsp; &nbsp; public static void main(String[] args) {</p><p>&nbsp; &nbsp; &nbsp; &nbsp; SpringApplication.run(GateBootstrap.class, args);</p><p>&nbsp; &nbsp; }</p><p>}</p><p>```</p><p><br></p><p>## Zuul filter拦截示例代码</p><p>```</p><p>@Component</p><p>public class SessionAccessFilter extends ZuulFilter {</p><p>&nbsp; private final Logger log = LoggerFactory.getLogger(SessionAccessFilter.class);</p><p><br></p><p>&nbsp; @Autowired</p><p>&nbsp; private SessionRepository&lt;?&gt; repository;</p><p>&nbsp; @Autowired</p><p>&nbsp; private IUserService userService;</p><p><br></p><p>&nbsp; @Override</p><p>&nbsp; public String filterType() {</p><p>&nbsp; &nbsp; return \"pre\";</p><p>&nbsp; }</p><p><br></p><p>&nbsp; @Override</p><p>&nbsp; public int filterOrder() {</p><p>&nbsp; &nbsp; return 1;</p><p>&nbsp; }</p><p><br></p><p>&nbsp; @Override</p><p>&nbsp; public boolean shouldFilter() {</p><p>&nbsp; &nbsp; return true;</p><p>&nbsp; }</p><p><br></p><p>&nbsp; @Override</p><p>&nbsp; public Object run() {</p><p>&nbsp; &nbsp; RequestContext ctx = RequestContext.getCurrentContext();</p><p>&nbsp; &nbsp; HttpSession httpSession = ctx.getRequest().getSession();</p><p>&nbsp; &nbsp; if (不符合权限){</p><p>&nbsp; &nbsp; &nbsp; setFailedRequest(\"&lt;h1&gt;Forbidden!&lt;/h1&gt;\",403);</p><p>&nbsp; &nbsp; }</p><p>&nbsp; &nbsp; return null;</p><p>&nbsp; }</p><p><br></p><p>&nbsp; /**</p><p>&nbsp; &nbsp;* 路由重定向</p><p>&nbsp; &nbsp;*</p><p>&nbsp; &nbsp;* @param body</p><p>&nbsp; &nbsp;* @param code</p><p>&nbsp; &nbsp;*/</p><p>&nbsp; private void setFailedRequest(String body, int code) {</p><p>&nbsp; &nbsp; log.debug(\"Reporting error ({}): {}\", code, body);</p><p>&nbsp; &nbsp; RequestContext ctx = RequestContext.getCurrentContext();</p><p>&nbsp; &nbsp; ctx.setResponseStatusCode(code);</p><p>&nbsp; &nbsp; if (ctx.getResponseBody() == null) {</p><p>&nbsp; &nbsp; &nbsp; ctx.setResponseBody(body);</p><p>&nbsp; &nbsp; &nbsp; ctx.setSendZuulResponse(false);</p><p>&nbsp; &nbsp; &nbsp; throw new RuntimeException(\"Code: \" + code + \", \" + body); //optional</p><p>&nbsp; &nbsp; }</p><p>&nbsp; }</p><p>}</p><p>```</p><p><br></p><p>## 访问网关地址示例</p><p>```</p><p>[ip]:[zuul port]/[Eureak 注册服务]/[资源路径]</p><p>```</p><p><br></p><p># Zuul兼容动态注册和静态路由表</p><p>## 核心思路</p><p>基于Eureka上注册另一个zuul，通过主的zuul gate way来分流到另外一个zuul，从而兼容静态路由的情况。</p><p>![img](http://ofsc32t59.bkt.clouddn.com/17-06-28/1498633239736.jpg)</p><p><br></p><p>&nbsp;</p><div><br></div>', '很多人都自然而然把zuul当成nginx那样来在配置写死节点配置来。实际上zuul和eureka的是可以完美配合，完全可以基于`服务名`的注册和发现,来动态的实现服务的`动态负载`和`动态注册`，从而达到`不需要重启zuul即可达到动态扩容的`。下文将介绍静态配置路由表和从Eureka发现服务的方式来加强Zuul的使用。', null, null, '1', null, '2017-07-17 08:29:20', '4', 'Mr.AG', '0:0:0:0:0:0:0:1', '2017-07-17 12:08:03', '4', 'Mr.AG', '0:0:0:0:0:0:0:1', null, null, null, null, null, null, null, null);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
