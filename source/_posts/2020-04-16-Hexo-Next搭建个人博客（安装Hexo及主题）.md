title: Hexo+Next搭建个人博客（安装Hexo及主题）
author: Li Zhiyuan
tags:
  - Hexo
  - Next
  - 博客
categories:
  - 博客搭建
  - Hexo
date: 2020-04-16 13:09:00
---
## 前言

最近将博客从 Jekyll 迁移到 Hexo，在迁移的过程中也遇到一些问题，下面就简单记录一下 {% label info@Hexo+NexT+Github Pages %} 的搭建步骤。 

本章将从零开始，搭建一个 Hexo + NexT 的本地博客系统。

<!-- more -->

## Hexo 简介

[Hexo](https://hexo.io/zh-cn/) 是高效的静态站点生成框架，她基于 [Node.js](https://nodejs.org/en/)，相较于Jekyll他有以下特点:


* ### <i class="fa fa-bolt"></i> 超快速度
	Node.js 所带来的超快生成速度，让上百个页面在几秒内瞬间完成渲染。

* ### <i class="fa fa-pencil"></i> 支持Markdown
	Hexo 支持 GitHub Flavored Markdown 的所有功能，甚至可以整合 Octopress 的大多数插件。

* ### <i class="fa fa-cloud-upload"></i> 一键部署
	只需一条指令即可部署到Github Pages，或其他网站

* ### <i class="fa fa-cog"></i> 丰富的插件
	Hexo 拥有强大的插件系统，安装插件可以让 Hexo 支持 Jade, CoffeeScript。

通过 Hexo 你可以轻松地使用 Markdown 编写文章，除了 Markdown 本身的语法之外，还可以使用 Hexo 提供的[标签插件](https://hexo.io/zh-cn/docs/tag-plugins.html)来快速的插入特定形式的内容。

基于 Hexo 这个优秀的博客框架，很多优秀的开发者奉献出了它们基于 Hexo 开发的[主题](https://hexo.io/themes/)。
[NexT](https://theme-next.org/) 因其精简的风格，一直被广大用户所喜爱。


## 安装前提

安装 Hexo 相当简单，只需要先安装下列应用程序即可：

{% note info %}
* Node.js (Node.js 版本需不低于 8.10，建议使用 Node.js 10.0 及以上版本)
* Git
{% endnote %}

如果您的电脑中已经安装上述必备程序，那么恭喜您！你可以直接前往 安装 Hexo 步骤。

如果您的电脑中尚未安装所需要的程序，请根据以下安装指示完成安装。


## 安装 Git

Windows：下载并安装 [git](https://git-scm.com/download/win).
Mac：使用 [Homebrew](http://mxcl.github.com/homebrew/), [MacPorts](http://www.macports.org/) 或者下载 [安装程序](http://sourceforge.net/projects/git-osx-installer/)。
Linux (Ubuntu, Debian)：`sudo apt-get install git-core`
Linux (Fedora, Red Hat, CentOS)：`sudo yum install git-core`

{% note danger %}
### Mac 用户
如果在编译时可能会遇到问题，请先到 App Store 安装 Xcode，Xcode 完成后，启动并进入 **Preferences -> Download -> Command Line Tools -> Install** 安装命令行工具。
{% endnote %}

{% note info %}
### Windows 用户
对于中国大陆地区用户，可以前往 [淘宝 Git for Windows 镜像](https://npm.taobao.org/mirrors/git-for-windows/) 下载 git 安装包。
{% endnote %}

## 安装 Node.js

Node.js 为大多数平台提供了官方的 [安装程序](https://nodejs.org/en/download/)。对于中国大陆地区用户，可以前往 [淘宝 Node.js 镜像](https://npm.taobao.org/mirrors/node) 下载。

其它的安装方法：

* Windows：通过 [nvs](https://github.com/jasongin/nvs/)（推荐）或者[nvm](https://github.com/nvm-sh/nvm) 安装。
* Mac：使用 [Homebrew](https://brew.sh/) 或 [MacPorts](http://www.macports.org/) 安装。
* Linux（DEB/RPM-based）：从 [NodeSource](https://github.com/nodesource/distributions) 安装。
* 其它：使用相应的软件包管理器进行安装，可以参考由 Node.js 提供的 [指导](https://nodejs.org/en/download/package-manager/)

对于 Mac 和 Linux 同样建议使用 nvs 或者 nvm，以避免可能会出现的权限问题。

{% note info %}
### Windows 用户
使用 Node.js 官方安装程序时，请确保勾选 **Add to PATH** 选项（默认已勾选）
{% endnote %}

{% note danger %}
### For Mac / Linux 用户
如果在尝试安装 Hexo 的过程中出现 `EACCES` 权限错误，请遵循 [由 npmjs 发布的指导](https://docs.npmjs.com/resolving-eacces-permissions-errors-when-installing-packages-globally) 修复该问题。强烈建议 **不要** 使用 root、sudo 等方法覆盖权限
{% endnote %}

## 安装 Hexo

打开git bash，为了避免出现错误后面的操作在git bash进行

使用 npm 安装 Hexo
```shell script
$ npm install -g hexo-cli
```
此命令会把 hexo.cmd 安装到全局包仓库中，由于该仓库文件夹在 Windows 系统的 path 中。所以你就可以在任意位置执行 hexo 命令了。

执行一下命令确认hexo安装完好

```shell script
$ hexo -v
hexo: 4.2.0
hexo-cli: 3.1.0
os: Windows_NT 10.0.17763 win32 x64
node: 12.16.2
v8: 7.8.279.23-node.34
uv: 1.34.2
zlib: 1.2.11
brotli: 1.0.7
ares: 1.15.0
modules: 72
nghttp2: 1.40.0
napi: 5
llhttp: 2.0.4
http_parser: 2.9.3
openssl: 1.1.1e
cldr: 36.0
icu: 65.1
tz: 2019c
unicode: 12.1
```

安装 Hexo 完成后，我们需要为博客创建一个指定文件夹，在指定文件夹下执行以下命令，Hexo 将会在该文件夹中新建所需要的文件。

```shell script
$ mkdir blog
$ cd blog
$ hexo init
```

安装完成后，指定文件夹目录如下

```shell script
.  
├── _config.yml  
├── package.json  
├── scaffolds  
├── source  
|   ├── _drafts  
|   └── _posts  
└──
```

我们继续执行命令

```shell script
$ hexo generate # 生成静态资源
$ hexo server --debug # 启动服务器 并开启调试模式
```

我们在浏览器中访问 http://localhost:4000/ ，就可以看到基于 Hexo 的默认主题的原型

## 安装 Hexo 主题

指定文件夹目录下的 `theme` 文件夹下存放的就是博客的主题，Hexo 便是依据主题来生成静态文件的，挑选主题可以在 [官方网站](https://hexo.io/themes/) 查找，根据自己的喜好来挑选。

下载主题的方式如下：

```shell script
$ cd your-hexo-site  #eg: blog
$ git clone {主题链接} themes/{主题名称}
```

启用主题的方式也很简单

打开指定文件夹下 Hexo 的配置文件 `_config.yml`, Ctrl+F 搜索 `theme` 关键字，修改其主题名称为下载的主题名称即可。

```shell script
theme: {主题名称}
```

以本人使用的 NexT 主题为例：

### 下载 NexT 

```shell script
$ cd blog
$ git clone https://github.com/theme-next/hexo-theme-next themes/next
```
### 启用 NexT

修改 Hexo 目录下的 `_config.yml`

```shell script
theme: next
```

### 验证主题是否安装成功

启动 Hexo 本地站点，**在服务启动的过程，注意观察命令行输出是否有任何异常信息。**

```shell script
$ hexo clean # 清除生成的静态资源
$ hexo s -d  # hexo server -debug 的缩写
```

当命令行输出中提示：
```
INFO Hexo is running at http://0.0.0.0:4000/. Press Ctrl+C to stop.
```
此时即可使用浏览器访问 http://localhost:4000/ ，检查站点是否正确运行

当你看到站点的外观与下图所示类似时即说明你已成功安装 NexT 主题。这是 NexT 默认的 Scheme —— Muse
![博客首页](/images/pasted-0.png)

现在，我们已经成功安装并启用了 NexT 主题。

关于更多基本操作和基础知识，请查阅 [Hexo](https://hexo.io/zh-cn/) 与 [NexT](https://theme-next.org/) 官方文档.

## Hexo 常用命令

### 博客操作类

#### 初始化博客
```shell script
$ hexo init [folder]
```
#### 启动本地服务器
```shell script
$ hexo clean && hexo s -d
```
#### 部署到 Github Pages
```shell script
$ hexo clean && hexo g -d
```

### 文章操作类

```shell script
$ hexo new 'postName' #新建文章
$ hexo new page 'pageName' # 新建页面
```
