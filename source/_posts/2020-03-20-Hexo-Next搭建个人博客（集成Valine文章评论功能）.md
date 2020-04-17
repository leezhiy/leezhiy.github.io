title: Hexo+Next搭建个人博客（集成Valine文章评论功能）
author: Li Zhiyuan
tags:
  - Hexo
  - Next
  - 博客
categories:
  - 博客搭建
  - Hexo
date: 2020-03-20 23:22:00
---
## 前言

最近将博客从 Jekyll 迁移到 Hexo，在迁移的过程中也遇到一些问题，下面就简单记录一下 {% label info@Hexo+NexT+Github Pages %} 的搭建步骤。

在上一章，我们已经将 Hexo + Next 部署到了 GitHub Pages 中， 在本章我们将集成 Valine 评论系统。

<!-- more -->

## 为什么选择 Valine

在笔者进行评论系统选择时，主要对比了 disqus Valine gittalk 三种:

* disqus 漂亮，全球化评论插件，但需要翻墙

* valine 样式简约 无登录 自带Leancloud的阅读统计功能

* gitalk 支持github登录

对比之下，最终选定了这款 Valine

## 注册 LeanClound,获取APP ID 和 APP Key

Valine 是基于 [LeanCloud](https://www.leancloud.cn/) 作为数据存储的，所以需要注册一个账号，注册完成后，我们找到创建应用


![创建应用](/images/valine-create-app.png)

在这里填写你的应用名称,名称可以自己定义，然后下面选择 **开发版** 点击 **创建**。

![应用](/images/valine-app.png)

然后点击应用进入设置

在设置页，我们首先点击存储，查看是否有 Comment 表和 Counter 表，没有则创建，权限设为无限制。

![添加表](/images/valine-app-create-class.png)

然后点击设置 > 安全中心 ,将除了数据存储的服务全部关闭。

![关闭其他服务](/images/valine-app-close-service.png)

最后点击 **应用 Keys** 取得我们 **AppKey** 和 **App id**

## 在 Hexo NexT 主题中配置

首先打开 [BootCND](https://www.bootcdn.cn/) 获取最新 valine.min.js 的 CDN 地址

![BootCDN](/images/valine-bootcdn.png)

然后打开 {% label success@主题配置文件 %} ，搜索 `valine` 关键字，配置 CDN

```shell script
 # Valine
  # valine: //cdn.jsdelivr.net/npm/valine@1/dist/Valine.min.js
  # valine: //cdnjs.cloudflare.com/ajax/libs/valine/1.3.10/Valine.min.js
  valine: //cdn.bootcss.com/valine/1.4.4/Valine.min.js
```

继续搜索，配置 Valine 功能

```shell script
# Valine
# For more information: https://valine.js.org, https://github.com/xCss/Valine
valine:
  enable: true
  appid: # 你自己的 Appid
  appkey:  # 你自己的 Appkey
  notify: false  # 邮件提醒
  verify: false # 验证码
  placeholder: 聊五分钱的天吗？|ω･)و ̑̑༉ # 聊天框默认显示
  avatar: mm # 头像设置
  guest_info: nick,mail,link # 游客信息 名称 邮件 网络地址
  pageSize: 10 # 每页数量
  language: zh-cn # 语言
  visitor: false # 文章阅读统计
  comment_count: true # 评论数量显示
  recordIP: false # 评论者的IP
  serverURLs: # 博客启用自定义域名后，请在此填写（默认情况下会自动检测到，无需填写）
  #post_meta_order: 0
```

## 其他设置

### 指定文章（页面）评论功能是否开启

在 Hexo 博客中，评论的功能是在所有页面都默认开启的，但是有的时候我们在页面上不需要显示评论功能，例如分类，标记页面我们并不需要评论功能。

我们可以在 Front-matter 中通过 **comments** 属性设置true或false控制该页面或者是文章的评论功能是否打开，如我设置标签页面的评论功能关闭：

```shell script
title: 标签
date: 2020-03-14 21:37:23
type: "tags"
comments: false
```

### 自定义头像

参考：https://valine.js.org/avatar.html


