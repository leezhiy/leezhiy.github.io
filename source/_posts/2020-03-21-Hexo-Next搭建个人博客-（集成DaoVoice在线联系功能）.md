title: Hexo+Next搭建个人博客 （集成DaoVoice在线联系功能）
author: Li Zhiyuan
tags:
  - Hexo
  - Next
  - 博客
categories:
  - 博客搭建
  - Hexo
date: 2020-03-21 23:24:24
---
## 前言

最近将博客从 Jekyll 迁移到 Hexo，在迁移的过程中也遇到一些问题，下面就简单记录一下 {% label info@Hexo+NexT+Github Pages %} 的搭建步骤。

在上一章，我们已经集成了 Valine 文章评论功能，在本章，我们将集成 DaoVoice 在线联系功能。

<!-- more -->

## 最终实现效果

![](/images/daovoice.gif)

看着还不错吧，可以在线留言，作者会收到邮件，如果绑定了微信，作者还会收到微信通知。

下面就开始设置吧。

## 注册

首先需要在 DaoVoice 注册个账号，[点击注册](http://dashboard.daovoice.io/get-started?invite_code=4e6b4c7f)

注册成功后，进入后台控制台，进入到 应用设置-->安装到网站 页面，可以得到一个 app_id：


![获取APPID](/images/daovoice-get-appid.png)

## 利用 NexT 主题的 Injects 功能管理 DaoVoice 插件

在 NexT 使用过程中，我们免不了要安装一些 NexT 暂时未集成的插件，但我们又不想修改主题的源码，这时就需要使用 Next 的 `theme-inject` 功能，它通过注入代码的方式提供多个注入点实现定制内容。 Injects 具体的定义见 [NexT文档](https://theme-next.org/docs/advanced-settings)

### 修改配置文件

首先，打开 {% label success@主题配置文件 %} ，在最底部添加

```shell script
# DaoVoice
daovoice:
  enabled: true
  app_id: # 输入你自己的 app_id
```

### 注入布局

第二步，我们在 Hexo 的 `scripts` 创建一个js文件 plugins.js（用来管理需要修改代码的第三方插件），添加以下内容。只要是这里面的脚本，Hexo运行时会执行它。

```javascript
hexo.extend.filter.register('theme_inject', function (injects) {
    // hexo.theme.config.daovoice 就是上面配置的值，我们将配置参数传递给 daovoice.swig
    injects.head.file('daovoice', 'source/_data/DaoVoice.swig', {daovoice: hexo.theme.config.daovoice});
});
```

最后，我们创建 `Hexo/source/_data/DaoVoice.swig` 文件，添加以下内容。

```textmate
{% if daovoice.enabled %}
  <script>
  (function(i,s,o,g,r,a,m){i["DaoVoiceObject"]=r;i[r]=i[r]||function(){(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;a.charset="utf-8";m.parentNode.insertBefore(a,m)})(window,document,"script",('https:' == document.location.protocol ? 'https:' : 'http:') + "//widget.daovoice.io/widget/0f81ff2f.js","daovoice")
  daovoice('init', {
    app_id: '{{daovoice.app_id}}',   // 必填，您的 APP 标识
  });
  daovoice('update');
  </script>
{% endif %}
```
运行 `hexo s` ,发现右下角已经出现如图下所示图标，DaoVoice已经接入成功。

![接入成功](/images/daovoice-logo.png)

## 安装 hexo-cake-moon-menu 插件，并添加按钮接管 DaoVoice

### 安装 hexo-cake-moon-menu 插件
在 Hexo 目录打开 git bash 并输入命令：
```shell script
$ npm install hexo-cake-moon-menu --save
```
打开 {% label primary@站点配置文件 %} ，在最底部添加

```shell script
moon_menu:
  back2top:
    enable: ture
    icon: fa fa-chevron-up
    func: back2top
    order: -1
  back2bottom:
    enable: true
    icon: fa fa-chevron-down
    func: back2bottom
    order: -2
```
添加完成后运行 `hexo s` ,发现插件和 DaoVoice 重叠了，如下图所示:

![插件重叠](/images/daovoice-moon-menu.png)

我们可以打开 DaoVoice 的后台，自定义 DaoVoice 的样式,如下图所示：

![设置样式](/images/daovoice-style.png)

点击保存后，直接刷新页面，如下图所示

![设置完成](/images/daovoice-black.png)

### 添加 moon_menu 聊天按钮

修改之前配置的 {% label primary@站点配置文件 %}，修改如下

```shell script
moon_menu:
  chat: # 新增按钮
    icon: fa fa-comments
    func: openDaoCloud # 要实现的JS方法名 ，接管 DaoVoice
  back2top:
    enable: true
    icon: fa fa-chevron-up
    func: back2top
    order: -1
  back2bottom:
    enable: true
    icon: fa fa-chevron-down
    func: back2bottom
    order: -2
```
### 隐藏 DaoVoice 按钮并接管 DaoVoice

 [DaoVoice Javascript Api](http://guide.daocloud.io/daovoice/javascript-api-5869833.html) 
 
打开之前新建的 `Hexo/source/_data/daovoice.swig` 文件，修改如下：

```textmate
{% if daovoice.enabled %}
  <script>
  (function(i,s,o,g,r,a,m){i["DaoVoiceObject"]=r;i[r]=i[r]||function(){(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;a.charset="utf-8";m.parentNode.insertBefore(a,m)})(window,document,"script",('https:' == document.location.protocol ? 'https:' : 'http:') + "//widget.daovoice.io/widget/0f81ff2f.js","daovoice")
  daovoice('init', {
    app_id: '{{daovoice.app_id}}',   // 必填，您的 APP 标识
  }, {
    launcher: {
      disableLauncherIcon: true, // 悬浮 ICON 是否显示
      defaultEnterView: 'list', // 'list' 或 'new' 默认是 list(在对话列表是空的时候默认切换到 new)
    }
  });
  daovoice('update');
  
  var DaoCloudIsShow = false;
  // 监听显示事件回调
  daovoice('onShow', function(){
    DaoCloudIsShow = ture;
  });
  // 监听隐藏事件回调
  daovoice('onHide', function(){
    DaoCloudIsShow = false;
  });
  // 点击按钮时运行的方法
  var openDaoCloud = function() {
    if( DaoCloudIsShow ) {
      daovoice('hide')
    } else {
      daovoice('show')
    }
  };
  </script>
{% endif %}
```
添加完成后运行 `hexo s` 就可以看到最终效果了。

最后到 DaoVoice 工作台右上角选择管理员，微信绑定,可以绑定你的微信号，关注公众号后打开小程序，就可以实时收发消息，有新的消息也会通过微信通知，设置页面如下：

![绑定微信](/images/daovoice-band-wechat.png)