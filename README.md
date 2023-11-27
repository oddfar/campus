<p align="center"><a href="https://oddfar.com/" target="_blank" rel="noopener noreferrer"><img width="180" src="https://note.oddfar.com/img/web.png" alt="logo"></a></p>

<p align="center">
  <a href="https://github.com/oddfar/campus/stargazers"><img src="https://img.shields.io/github/stars/oddfar/campus.svg"></a>
	<a href="https://github.com/oddfar/campus/blob/master/LICENSE"><img src="https://img.shields.io/github/license/mashape/apistatus.svg"></a>
</p>
<p align="center"> Campus，一个简单的前后端分离后台管理系统，RuoYi-Vue简单版 </p>

<h2 align="center">Campus</h2>

 [项目文档](https://oddfar.github.io/campus-doc/)  | [笔记仓库](https://github.com/oddfar/notes)  |  [我的博客](https://oddfar.com)  

## 项目介绍

> 想重构之前的校园信息墙项目，又想学习若依项目，就手写了 RuoYi-Vue 并修改了部分功能，于是有了这套后台系统，所以取名为campus

**Campus** 一款简单的后台管理系统，**RuoYi-Vue简单版**，快速开发框架，适合大学生开发毕设，或其他小项目。

使用Spring Boot、Spring Security、MyBatis Plus、Jwt、Vue等技术

您可以根据此项目，快速开发毕设项目，无需注重系统代码，只需业务代码！

## 项目文档

- 项目在线预览地址：暂无
- 项目文档：<https://oddfar.github.io/campus-doc/>

## 对比RuoYi

### 功能差异

| 功能         | 本框架                                            | RuoYi             |
| ------------ | ------------------------------------------------- | ----------------- |
| 权限认证     | 增加接口管理，动态分配角色权限                    | 不支持动态分配    |
| ORM框架      | 采用 Mybatis-Plus                                 | 采用 Mybatis      |
| 数据分页     | 采用 Mybatis-Plus 分页插件<br/>框架对其进行了扩展 | 采用 PageHelper   |
| 用户依据     | 涉及表使用用户ID判断，方便更新用户                | 根据用户userName  |
| 数据库主键   | 采用 雪花ID                                       | 采用 数据库自增ID |
| SQL监控      | 采用 p6spy 可输出完整SQL与执行时间监控            | log输出           |
| 多数据源框架 | dynamic-datasource                                | druid             |

### 内置功能

- [x] 用户管理：用户的管理配置。
- [x] 菜单管理：配置系统菜单，操作权限，按钮权限标识等。
- [x] 角色管理：角色菜单权限分配。
- [x] 字典管理：对系统中经常使用的一些较为固定的数据进行维护。
- [x] 参数管理：对系统动态配置常用参数。
- [x] 操作日志：系统正常操作日志记录和查询；系统异常信息日志记录和查询。
- [x] 登录日志：系统登录日志记录查询包含登录异常。

新增

- [x] 接口管理：动态分配角色接口权限



## 贡献代码

若您有好的想法，发现一些 **BUG** 并修复了，欢迎提交 **Pull Request** 参与开源贡献

发起 pull request 请求，提交到 master 分支，等待作者合并

## 致谢

此项目参考了一些开源项目的解决方案，在此感谢他们的开源

- Vue后台管理模板：[vue-element-admin](https://github.com/PanJiaChen/vue-element-admin)
- RuoYi：<https://gitee.com/y_project/RuoYi>
- RuoYi Pro：<https://gitee.com/zhijiantianya/ruoyi-vue-pro>
- Guns：<https://gitee.com/stylefeng/guns>



## 演示图



|                            admin                             |                                                              |
| :----------------------------------------------------------: | ------------------------------------------------------------ |
| ![image-20230221090307473](https://gcore.jsdelivr.net/gh/oddfar/static/campus/doc/image-20230221090307473.png) | ![image-20230221091209986](https://gcore.jsdelivr.net/gh/oddfar/static/campus/doc/image-20230221091209986.png) |
| ![image-20230221091408302](https://gcore.jsdelivr.net/gh/oddfar/static/campus/doc/image-20230221091408302.png) | ![image-20230221091331128](https://gcore.jsdelivr.net/gh/oddfar/static/campus/doc/image-20230221091331128.png) |



> 案例：校园信息墙

<https://github.com/oddfar/campus-example>

网页端

| web                                                          |                                                              |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| ![image-20230221091804015](https://gcore.jsdelivr.net/gh/oddfar/static/campus/doc/image-20230221091804015.png) | ![image-20230221091942563](https://gcore.jsdelivr.net/gh/oddfar/static/campus/doc/image-20230221091942563.png) |
| ![image-20230221092022247](https://gcore.jsdelivr.net/gh/oddfar/static/campus/doc/image-20230221092022247.png) | ![image-20230221092059047](https://gcore.jsdelivr.net/gh/oddfar/static/campus/doc/image-20230221092059047.png) |
| ![image-20230221092122331](https://gcore.jsdelivr.net/gh/oddfar/static/campus/doc/image-20230221092122331.png) | ![image-20230221092152935](https://gcore.jsdelivr.net/gh/oddfar/static/campus/doc/image-20230221092152935.png) |

移动端（小程序）

| 移动端                                                       |                                                              |                                                              |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| ![image-20230412210057613](https://gcore.jsdelivr.net/gh/oddfar/static/campus/doc/image-20230412210057613.png) | ![image-20230412210148423](https://gcore.jsdelivr.net/gh/oddfar/static/campus/doc/image-20230412210148423.png) | ![image-20230412210214019](https://gcore.jsdelivr.net/gh/oddfar/static/campus/doc/image-20230412210214019.png) |
| ![image-20230412210256253](https://gcore.jsdelivr.net/gh/oddfar/static/campus/doc/image-20230412210256253.png) | ![image-20230412210328222](https://gcore.jsdelivr.net/gh/oddfar/static/campus/doc/image-20230412210328222.png) | ![image-20230412210405497](https://gcore.jsdelivr.net/gh/oddfar/static/campus/doc/image-20230412210405497.png) |
| ![image-20230412210534659](https://gcore.jsdelivr.net/gh/oddfar/static/campus/doc/image-20230412210534659.png) | ![image-20230412210606552](https://gcore.jsdelivr.net/gh/oddfar/static/campus/doc/image-20230412210606552.png) |                                                              |



## 鸣谢

> [IntelliJ IDEA](https://zh.wikipedia.org/zh-hans/IntelliJ_IDEA) 是一个在各个方面都最大程度地提高开发人员的生产力的 IDE，适用于 JVM 平台语言。

特别感谢 [JetBrains](https://www.jetbrains.com/?from=campus) 为开源项目提供免费的 [IntelliJ IDEA](https://www.jetbrains.com/idea/?from=campus) 等 IDE 的授权  
[<img src=".github/jetbrains-variant.png" width="200"/>](https://www.jetbrains.com/?from=campus)

