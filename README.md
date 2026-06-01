# 在线学习平台微服务项目

本项目采用 Spring Cloud 微服务架构，覆盖用户、认证、课程、学习、交易、支付、营销、搜索、消息、媒资、考试、评论和数据看板等核心业务。

当前仓库主要包含后端服务代码，不包含前端工程。

## 项目背景与意义

随着在线教育、职业培训和知识付费场景的发展，传统单体式教学系统在用户规模、课程管理、学习过程追踪、支付交易、营销活动和数据分析等方面逐渐暴露出扩展性不足、业务耦合高、维护成本高的问题。一个完整的在线学习平台不仅要支持课程展示和学习播放，还需要围绕用户成长、课程运营、交易转化、学习互动和平台管理形成完整闭环。

本项目以在线学习平台为业务背景，将认证、用户、课程、媒资、学习、交易、支付、营销、搜索、消息、考试、评论和数据统计等能力拆分为独立微服务，模拟真实教育平台的后端业务架构。通过该项目可以系统性地练习 Spring Cloud 微服务治理、服务间调用、分布式缓存、消息队列、搜索引擎、定时任务、支付对接和业务模块拆分等后端核心能力。

项目的意义主要体现在：

- 构建一个接近真实业务场景的在线教育后端系统，而不是单一 CRUD 示例。
- 通过微服务拆分降低模块耦合，便于独立开发、部署和扩展。
- 覆盖课程售卖、学习过程、支付交易、优惠营销、搜索推荐等完整业务链路。
- 结合 Redis、RabbitMQ、Elasticsearch、XXL-JOB 等中间件，提升对分布式系统的实践理解。
- 为后续接入前端、移动端、小程序或管理后台提供稳定的后端接口基础。

## 要解决的问题

本项目主要解决在线学习平台中的以下业务问题：

- 用户与权限管理：支持学生、教师、员工等角色管理，完成登录认证、权限控制和资源访问保护。
- 课程运营管理：支持课程分类、科目、目录、课程草稿、课程发布、课程上下架等课程生命周期管理。
- 媒资管理：支持课程相关文件和视频资源的上传、存储、管理与云服务对接。
- 学习过程管理：支持课表、学习记录、笔记、问答、回复、签到、积分和积分榜等学习行为记录。
- 交易与支付闭环：支持购物车、下单、订单详情、支付申请、支付回调、退款申请和状态补偿。
- 营销活动支持：支持优惠券、兑换码、发券任务和优惠计算，提升课程购买转化能力。
- 搜索与推荐：基于 Elasticsearch 支持课程检索、兴趣标签和推荐相关能力。
- 消息通知：支持短信、站内信、通知模板和通知任务，用于验证码、运营通知和业务提醒。
- 考试与题库：提供题目管理和题目业务查询能力，为课程测评场景提供基础。
- 评论与点赞：支持点赞记录、点赞数同步等互动数据能力。
- 数据看板：提供今日数据、榜单、Top10 等统计接口，辅助平台运营分析。
- 分布式协作：通过 Nacos、OpenFeign、RabbitMQ、Redis、XXL-JOB 等组件解决服务发现、服务调用、异步解耦、缓存加速和定时任务调度问题。

## 技术栈

- Java 17
- Spring Boot 3.3.5
- Spring Cloud 2023.0.3
- Spring Cloud Alibaba 2023.0.3.2
- Spring Cloud Gateway
- OpenFeign
- Nacos 注册中心 / 配置中心
- MyBatis-Plus
- MySQL
- Redis / Redisson
- RabbitMQ
- XXL-JOB
- Elasticsearch 7.12.1
- Knife4j / OpenAPI 3
- Lombok
- 支付宝支付、微信支付
- 腾讯云 COS/VOD、阿里云 OSS、短信 SDK

## 模块说明

| 模块 | 说明 |
| --- | --- |
| `gt-common` | 公共组件，包含统一返回、异常处理、MyBatis 自动填充、Swagger、MQ、Redisson、工具类等 |
| `gt-api` | 微服务之间共享的 Feign Client 和 DTO |
| `gt-gateway` | API 网关，统一入口，负责路由、跨域、鉴权转发 |
| `gt-auth` | 认证授权服务，包含账号、角色、菜单、权限、JWT、资源鉴权 SDK、网关鉴权 SDK |
| `gt-user` | 用户中心，包含学生、教师、员工、用户资料、登录查询等 |
| `gt-course` | 课程中心，包含课程、分类、科目、目录、课程草稿、上下架等 |
| `gt-media` | 媒资中心，包含文件上传、媒资管理、云存储和视频能力 |
| `gt-search` | 搜索服务，基于 Elasticsearch 实现课程搜索、推荐和兴趣标签 |
| `gt-learning` | 学习中心，包含学习记录、课表、笔记、问答、签到、积分、积分榜 |
| `gt-trade` | 交易中心，包含购物车、下单、订单、支付申请、退款申请 |
| `gt-pay` | 支付中心，包含支付单、退款单、支付渠道、支付回调、支付状态补偿 |
| `gt-promotion` | 营销中心，包含优惠券、兑换码、发券任务、优惠计算 |
| `gt-message` | 消息中心，包含短信、站内信、通知模板、通知任务 |
| `gt-exam` | 考试题库服务，包含题目管理和题目业务查询 |
| `gt-remark` | 评论/点赞服务，包含点赞记录和点赞数同步 |
| `gt-data` | 数据看板服务，包含今日数据、榜单、Top10 等统计接口 |

## 服务端口与数据库

| 服务 | 端口 | 数据库 |
| --- | ---: | --- |
| `gt-gateway` | 10010 | 无 |
| `gt-auth` | 8081 | `gt_auth` |
| `gt-user` | 8082 | `gt_user` |
| `gt-search` | 8083 | `gt_search` |
| `gt-media` | 8084 | `gt_media` |
| `gt-message` | 8085 | `gt_message` |
| `gt-course` | 8086 | `gt_course` |
| `gt-pay` | 8087 | `gt_pay` |
| `gt-trade` | 8088 | `gt_trade` |
| `gt-exam` | 8089 | `gt_exam` |
| `gt-learning` | 8090 | `gt_learning` |
| `gt-remark` | 8091 | `gt_remark` |
| `gt-promotion` | 8092 | `gt_promotion` |
| `gt-data` | 8093 | `gt_data` |

## 网关路由

默认网关端口为 `10010`，各服务通过路径前缀转发：

| 前缀 | 服务 |
| --- | --- |
| `/as/**` | `auth-service` |
| `/us/**` | `user-service` |
| `/cs/**` | `course-service` |
| `/ms/**` | `media-service` |
| `/sms/**` | `message-service` |
| `/ss/**` | `search-service` |
| `/ls/**` | `learning-service` |
| `/ps/**` | `pay-service` |
| `/ts/**` | `trade-service` |
| `/es/**` | `exam-service` |
| `/rs/**` | `remark-service` |
| `/prs/**` | `promotion-service` |
| `/ds/**` | `data-service` |

## 本地启动前置条件

启动完整项目之前，需要准备以下基础设施：

- JDK 17
- Maven 3.6.1 或更高版本
- MySQL
- Redis
- RabbitMQ
- Nacos
- Elasticsearch 7.12.x
- XXL-JOB Admin

如果只做编译检查，可以先执行：

```bash
mvn compile -DskipTests
```

如果要启动服务，需要先确保 Nacos 配置、数据库、Redis、RabbitMQ、Elasticsearch 等中间件地址正确。

## 构建命令

校验 Maven 聚合模块：

```bash
mvn validate -DskipTests
```

编译全部模块：

```bash
mvn compile -DskipTests
```

打包全部模块：

```bash
mvn package -DskipTests
```

只编译某个服务及其依赖：

```bash
mvn compile -pl gt-user -am -DskipTests
```

## 快速上手建议

建议按下面顺序阅读代码：

1. `gt-gateway`：了解统一入口、路由和鉴权过滤器。
2. `gt-common`：了解统一响应、异常处理、工具类、MQ、Redisson 和自动配置。
3. `gt-api`：了解服务间 Feign 调用和共享 DTO。
4. `gt-auth`、`gt-user`：了解登录、用户、权限体系。
5. `gt-course`、`gt-learning`：了解在线学习主业务。
6. `gt-trade`、`gt-pay`、`gt-promotion`：了解交易、支付和营销链路。
7. `gt-search`、`gt-message`、`gt-data`：了解搜索、通知和数据看板。
