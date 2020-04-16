title: Hexo+Next搭建个人博客（Next 主题设置）
author: Li Zhiyuan
tags:
  - Hexo
  - Next
  - 博客
categories:
  - 博客搭建
  - Hexo
date: 2020-04-16 15:30:17
---
## 前言

最近将博客从 Jekyll 迁移到 Hexo，在迁移的过程中也遇到一些问题，下面就简单记录一下 {% label info@Hexo+NexT+Github Pages %} 的搭建步骤。

在上一章，我们已经将 Hexo + Next 安装到了本地， 在本章我们将对 NexT 主题进行一些个性化的设置。

<!-- more -->

## 基本设置

在 Hexo 中有两份主要的配置文件，其名称都是 `_config.yml` 。其中，一份位于站点根目录下，主要包含 Hexo 本身的配置；另一份位于主题目录下，这份配置由主题作者提供，主要用于配置主题相关的选项。

我们约定，将前者称为 {% label primary@站点配置文件 %}，后者称为 {% label success@主题配置文件 %}

### 站点初始设置

打开 {% label primary@站点配置文件 %} ，修改内容如下

```shell script
# Site
title: Leezhiy Blog # 博客标题
subtitle: '我秃了，也变强了' # 副标题
description: '程序，搞起来很轻松的，就是头冷' # 个人详情
keywords:  # 关键字
author: Li Zhiyuan # 博客作者
language: zh-CN # 语言 参见主题的文档进行设置
timezone: 'Asia/Shanghai' # 时区 默认为电脑的时区
```

### 设置主题风格

打开 {% label success@主题配置文件 %} ，搜索 `scheme` 关键字，将你需用启用的 `scheme` 前面注释 # 去除即可。

```shell script
# ---------------------------------------------------------------
# Scheme Settings
# ---------------------------------------------------------------

# Schemes
#scheme: Muse # 默认 Scheme，这是 NexT 最初的版本，黑白主调，大量留白
#scheme: Mist # Muse 的紧凑版本，整洁有序的单栏外观
#scheme: Pisces # 双栏 Scheme，小家碧玉似的清新
scheme: Gemini # 类似 Pisces
```

### 菜单设置

打开 git bash, 创建页面

```shell script
$ cd blog
$ hexo new page categories # 创建分类页面
$ hexo new page tags # 创建标签页面
$ hexo new custom_name # 创建关于页面
```
设置各个页面的头信息

```text
blog/source/custom-name/index.md

title: 关于我
date: 2020-04-13 12:39:04
---

blog/source/tags/index.md

---
title: 标签
date: 2020-04-13 21:37:23
type: tags
---

blog/source/categories/index.md

---
title: 分类
date: 2020-04-13 21:37:23
type: categories
---

```

打开 {% label success@主题配置文件 %} ，搜索 `menu` 关键字，修改如下

```shell script
# ---------------------------------------------------------------
# Menu Settings 菜单设置
# ---------------------------------------------------------------

# 用法: `Key: /link/ || icon` 
# Key 表示菜单名称。 如果可以翻译，则将加载翻译后文本，否则将使用原来的名称。Key 区分大小写
#  `||` 分隔符之前是菜单的链接，之后是 Font Awesome icon 
# 在子目录（例如：yoursite.com/blog）中运行站点时，需要去掉链接前面的斜杠  (例如：/archives -> archives)。
# 外部url应以http://或https开头：
menu:
  home: / || fa fa-home
  archives: /archives/ || fa fa-archive
  categories: /categories/ || fa fa-th
  tags: /tags/ || fa fa-tags
  about: /custom-name/ || fa fa-user
  #schedule: /schedule/ || fa fa-calendar
  #sitemap: /sitemap.xml || fa fa-sitemap
  #commonweal: /404/ || fa fa-heartbeat

# 开启/关闭菜单图标 
# Enable / Disable menu icons / item badges.
menu_settings:
  icons: true
  badges: false

```

### 头像设置

准备一个网络图片地址或一张图片放到 blog/themes/next/source/images/ 目录下，打开 {% label success@主题配置文件 %} ，搜索 `avatar` 关键字，修改如下

```shell script
# Sidebar Avatar
avatar:
  # Replace the default image and set the url here.
  url: /images/avatar.png # 你自己的图片名称或完整的网络图片地址
  # If true, the avatar will be dispalyed in circle.
  rounded: true # 是否为圆形头像
  # If true, the avatar will be rotated with the cursor.
  rotated: false # 设置成 true ,鼠标放上去会不停转圈 

```

### 代码块样式设置

打开 {% label success@主题配置文件 %} ，搜索 `codeblock` 关键字，设置如下

```shell script
codeblock:
  # Code Highlight theme
  # Available values: normal | night | night eighties | night blue | night bright | solarized | solarized dark | galactic
  # See: https://github.com/chriskempson/tomorrow-theme
  highlight_theme: night eighties # 高亮主题
  # Add copy button on codeblock
  copy_button:
    enable: true # 是否显示复制按钮
    # Show text copy result.
    show_result: true # 是否显示复制结果
    # Available values: default | flat | mac
    style: default # 复制按钮样式

```

### 回到顶部按钮设置

打开 {% label success@主题配置文件 %} ，搜索 `back2top` 关键字，设置如下

```shell script
back2top:
  enable: true
  # Back to top in sidebar.
  sidebar: true
  # Scroll percent label in b2t button.
  scrollpercent: true
```


### 社交媒体联系方式修改

打开 {% label success@主题配置文件 %} ，搜索 `social` 关键字，将其中地址替换成自己的便可

```shell script
# Social Links
# Usage: `Key: permalink || icon`
# Key is the link label showing to end users.
# Value before `||` delimiter is the target permalink, value after `||` delimiter is the name of Font Awesome icon.
social:
  GitHub: https://github.com/leezhiy || fab fa-github
  E-Mail: mailto:18500754397@163.com || fa fa-envelope
  微博: https://weibo.com/5678634433 || fab fa-weibo
  知乎: https://www.zhihu.com/people/li-zhi-yuan-13-7 || fa fa-globe
  Gitee: https://gitee.com/leezhiy || fab fa-git
  网易云: https://music.163.com/#/user/home?id=131550901 || fa fa-music
  #Google: https://plus.google.com/youname || fab fa-google
  #Twitter: https://twitter.com/yourname || fab fa-twitter
  #FB Page: https://www.facebook.com/yourname || fab fa-facebook
  #StackOverflow: https://stackoverflow.com/yourname || fab fa-stack-overflow
  #YouTube: https://youtube.com/yourname || fab fa-youtube
  #Instagram: https://instagram.com/yourname || fab fa-instagram
  #Skype: skype:yourname?call|chat || fab fa-skype

social_icons:
  enable: true # 图标是否开启
  icons_only: false # 是否只有图标
  transition: false  # 动画效果

```

### 增加友情链接

打开 {% label success@主题配置文件 %} ，搜索 `links_settings` 关键字，设置如下

```shell script
# Blog rolls
links_settings:
  icon: fa fa-link
  title: 友情连接
  # Available values: block | inline
  layout: block

links:
  友情链接1: https://www.baidu.com
  友情链接2: https://www.baidu.com
  友情链接3: https://www.baidu.com
  友情链接4: https://www.baidu.com
```

### 将文章底部 # 换成标签图标

打开 {% label success@主题配置文件 %} ，搜索 `tag_icon` 关键字，设置如下

```shell script
# Use icon instead of the symblo # to indicate the tag at the bottom of the post
tag_icon: true
```

### 设置打赏

打开 {% label success@主题配置文件 %} ，搜索 `reward` 关键字，设置如下

```shell script
# Reward (Donate)
# Front-matter variable (unsupport animation).
reward_settings:
  # If true, reward will be displayed in every article by default.
  enable: ture #打赏开关
  animation: false
  comment: 如果你觉得这篇文章对你有用，欢迎赞赏哦~

reward:
  wechatpay: /images/wechatpay.png # 你自己的微信收款码
  alipay: /images/alipay.png # 你自己的支付宝收款码
  #paypal: /images/paypal.png
  #bitcoin: /images/bitcoin.png
```

### 设置订阅

安装 hexo-generator-feed 插件

```shell script
$ npm install hexo-generator-feed --save
```

打开 {% label success@主题配置文件 %} ，搜索 `reward` 关键字，设置如下

```shell script
# Subscribe through Telegram Channel, Twitter, etc.
# Usage: `Key: permalink || icon` (Font Awesome)
follow_me:
  #Twitter: https://twitter.com/username || fab fa-twitter
  #Telegram: https://t.me/channel_name || fab fa-telegram
  WeChat: /images/wechat_channel.png || fab fa-weixin # 你自己的微信频道二维码
  RSS: /atom.xml || fa fa-rss

```

### 开启阅读进度条

打开 {% label success@主题配置文件 %} ，搜索 `reading_progress` 关键字，设置如下

```shell script
# Reading progress bar
reading_progress:
  enable: true
  # Available values: top | bottom
  position: top
  color: "#37c6c0"
  height: 3px
```


### 右上角 Github 按钮开启

打开 {% label success@主题配置文件 %} ，搜索 `github_banner` 关键字，设置如下

```shell script
# `Follow me on GitHub` banner in the top-right corner.
github_banner:
  enable: ture
  permalink: https://github.com/leezhiy
  title: Follow me on GitHub
```

### 字体设置 

打开 {% label success@主题配置文件 %} ，搜索 `Font Settings` 关键字，设置如下

```shell script
# ---------------------------------------------------------------
# Font Settings
# See: https://theme-next.org/docs/theme-settings/#Fonts-Customization
# ---------------------------------------------------------------
# Find fonts on Google Fonts (https://www.google.com/fonts)
# All fonts set here will have the following styles:
#   light | light italic | normal | normal italic | bold | bold italic
# Be aware that setting too much fonts will cause site running slowly
# ---------------------------------------------------------------
# To avoid space between header and sidebar in scheme Pisces / Gemini, Web Safe fonts are recommended for `global` (and `title`):
# Arial | Tahoma | Helvetica | Times New Roman | Courier New | Verdana | Georgia | Palatino | Garamond | Comic Sans MS | Trebuchet MS
# ---------------------------------------------------------------

font:
  enable: true

  # Uri of fonts host, e.g. https://fonts.googleapis.com (Default).
  host:

  # Font options:
  # `external: true` will load this font family from `host` above.
  # `family: Times New Roman`. Without any quotes.
  # `size: x.x`. Use `em` as unit. Default: 1 (16px)

  # Global font settings used for all elements inside <body>.
  global:
    external: true
    family: Lato
    size:

  # Font settings for site title (.site-title).
  title:
    external: true
    family: Lobster Two
    size:

  # Font settings for headlines (<h1> to <h6>).
  headings:
    external: true
    family: Amita
    size:

  # Font settings for posts (.post-body).
  posts:
    external: true
    family:

  # Font settings for <code> and code blocks.
  codes:
    external: true
    family:

```

### 底部设置

打开 {% label success@主题配置文件 %} ，搜索 `footer` 关键字，设置如下


```shell script
footer:
  # Specify the date when the site was setup. If not defined, current year will be used.
  since: 2015 # 网站开始年份

  # Icon between year and copyright info.
  icon:
    # Icon name in Font Awesome. See: https://fontawesome.com/icons
    name: fa fa-heart # 底部图标
    # If you want to animate the icon, set it to true.
    animated: true # 动画效果
    # Change the color of icon, using Hex Code.
    color: "#ff0000"

  # If not defined, `author` from Hexo `_config.yml` will be used.
  copyright: # 版权信息

  # Powered by Hexo & NexT
  powered: false # 是否显示 Powered by Hexo & NexT

  # Beian ICP and gongan information for Chinese users. See: http://www.beian.miit.gov.cn, http://www.beian.gov.cn
  beian: # 备案信息
    enable: false
    icp: 
    # The digit in the num of gongan beian.
    gongan_id: # 公安备案ID
    # The full num of gongan beian.
    gongan_num: # 公安备案编号
    # The icon for gongan beian. See: http://www.beian.gov.cn/portal/download
    gongan_icon_url: # 公安备案图标
```

### 版权信息设置

打开 {% label success@主题配置文件 %} ，搜索 `creative_commons` 关键字，设置如下

```shell script
# Creative Commons 4.0 International License.
# See: https://creativecommons.org/share-your-work/licensing-types-examples
# Available values of license: by | by-nc | by-nc-nd | by-nc-sa | by-nd | by-sa | zero
# You can set a language value if you prefer a translated version of CC license, e.g. deed.zh
# CC licenses are available in 39 languages, you can find the specific and correct abbreviation you need on https://creativecommons.org
creative_commons:
  license: by-nc-sa # 版权信息类别 选项： by | by-nc | by-nc-nd | by-nc-sa | by-nd | by-sa | zero
  sidebar: true # 侧边栏显示状态
  post: true # 文章底部显示状态
  language:
```

## 第三方插件

### 本地搜索

打开博客目录，运行 git bash ，安装插件

```shell script
$ npm install hexo-generator-searchdb --save
```

打开 {% label success@主题配置文件 %} ，搜索 `local_search` 关键字，设置如下
```shell script
# Local Search
# Dependencies: https://github.com/theme-next/hexo-generator-searchdb
local_search:
  enable: true
  # If auto, trigger search by changing input.
  # If manual, trigger search by pressing enter key or search button.
  trigger: auto
  # Show top n results per article, show all results by setting to -1
  top_n_per_article: 3
  # Unescape html strings to the readable one.
  unescape: false
  # Preload the search data when the page loads.
  preload: false

```

### 添加相关文章

打开博客目录，运行 git bash ，安装插件

```shell script
$ npm install hexo-related-popular-posts --save
```
打开 {% label success@主题配置文件 %} ，搜索 `related_posts` 关键字，设置如下
```shell script
# Related popular posts
# Dependencies: https://github.com/tea3/hexo-related-popular-posts
related_posts:
  enable: true
  title: # Custom header, leave empty to use the default one
  display_in_home: false
  params:
    maxCount: 5
    #PPMixingRate: 0.0
    #isDate: false
    #isImage: false
    #isExcerpt: false
```

### 博客图片插件

打开博客目录，运行 git bash ，安装插件

```shell script
$ npm install medium-zoom
```
打开 {% label success@主题配置文件 %} ，搜索 `mediumzoom` 关键字，设置如下
```shell script
# A JavaScript library for zooming images like Medium.
# Do not enable both `fancybox` and `mediumzoom`.
# For more information: https://github.com/francoischalifour/medium-zoom
mediumzoom: true
```

### 中英文之间自动加空格

打开博客目录，运行 git bash ，安装插件

```shell script
$ npm install pangu --save
```
打开 {% label success@主题配置文件 %} ，搜索 `pangu` 关键字，设置如下
```shell script
# Pangu Support
# For more information: https://github.com/vinta/pangu.js
pangu: true
```

### 网页加载进度条

打开博客目录，运行 git bash 

```shell script
$ cd blog/themes/next
$ git clone https://github.com/theme-next/theme-next-pace source/lib/pace
```
打开 {% label success@主题配置文件 %} ，搜索 `pace` 关键字，设置如下
```shell script
pace:
  enable: true
  # Themes list:
  # big-counter | bounce | barber-shop | center-atom | center-circle | center-radar | center-simple
  # corner-indicator | fill-left | flat-top | flash | loading-bar | mac-osx | material | minimal
  theme: minimal
```
## 博客速度优化

### Pjax

打开博客目录，运行 git bash 

```shell script
$ cd blog/themes/next
$ git clone https://github.com/theme-next/theme-next-pjax source/lib/pjax
```
打开 {% label success@主题配置文件 %} ，搜索 `pjax` 关键字，设置 Pjax 为开启状态
```shell script
# Easily enable fast Ajax navigation on your website.
# Dependencies: https://github.com/theme-next/theme-next-pjax
pjax: true
```

### 懒加载

打开博客目录，运行 git bash ，安装插件

```shell script
$ npm install --save lozad
```
打开 {% label success@主题配置文件 %} ，搜索 `lazyloag` 关键字，设置如下
```shell script
# 修改一
# Vanilla JavaScript plugin for lazyloading images.
# For more information: https://github.com/ApoorvSaxena/lozad.js
lazyload: true

# 修改二
comments:
  # Available values: tabs | buttons
  style: tabs
  # Choose a comment system to be displayed by default.
  # Available values: changyan | disqus | disqusjs | gitalk | livere | valine
  active:
  # Setting `true` means remembering the comment system selected by the visitor.
  storage: true
  # Lazyload all comment systems.
  lazyload: true
```


### 网站动态元素延时加载
我们的网站添加了许多动态元素之后，加载速度会变慢，所以可以先不加载动态元素，等静态元素加载完之后再加载动态元素，这样就加速了网站的登入。可打开{% label success@主题配置文件 %} ，搜索 `` 关键字，设置如下

```shell script
# ---------------------------------------------------------------
# Animation Settings
# ---------------------------------------------------------------

# Use velocity to animate everything.
# For more information: http://velocityjs.org
motion:
  enable: false
  async: false
  transition:
    # Transition variants:
    # fadeIn | flipXIn | flipYIn | flipBounceXIn | flipBounceYIn
    # swoopIn | whirlIn | shrinkIn | expandIn
    # bounceIn | bounceUpIn | bounceDownIn | bounceLeftIn | bounceRightIn
    # slideUpIn | slideDownIn | slideLeftIn | slideRightIn
    # slideUpBigIn | slideDownBigIn | slideLeftBigIn | slideRightBigIn
    # perspectiveUpIn | perspectiveDownIn | perspectiveLeftIn | perspectiveRightIn
    post_block: fadeIn
    post_header: slideDownIn
    post_body: slideDownIn
    coll_header: slideLeftIn
    # Only for Pisces | Gemini.
    sidebar: slideUpIn

```


