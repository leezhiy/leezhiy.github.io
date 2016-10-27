---
title:  "如何利用jekyll+github.io搭建自己的个人博客"
date:   2016-10-26 12:04:23
categories: [github]
tags: [博客创建]
---
今天刚刚搭好自己的Blog，很兴奋，在这记录一下搭建Blog的历程

在Github上搭建一个博客，很简单，只需要三步： 

1.在 Github 上建一个库，库的名字是名为 xxx.github.com ，其中的xxx是你的github的账号名

2.下载jekyll创建属于自己的博客

3.写一篇自己的博客，将博客push到自己的库中

在Github上建立仓库

第一步，想在Github上建仓库库，你得有个Github账号，如果没有，那你就得注册一个账号，进入Github官网，填写注册信息，这些应该对你来说非常简单了，接着建立一个版本仓库 库的名字是名为 xxx.github.com ，其中的xxx是你的github的账号名。

第二步，安装jekyll

jekyll在其官方网站上说并不建议在windows操作系统安装，可是我们已经在windows环境下操作比较习惯了，而安装linux或mac的成本又比较高。因此，虽然在windows安装jekyll的流程比较麻烦一些，但是也是能够安装成功的。下面就来讲解如何在windows下安装jekyll，进行一些本地预览等功能。

首先给windows上装一款类似于centos上yum的windows命令行软件包管理工具   chocolatey  它可以帮助我们更快的安装好jekyll

打开管理员cmd  输入

``` java
@powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
```

因为安装jekyll之前要先安装ruby 所以我们在安装完成chocolatey 之后先利用管理工具安装ruby  输入

``` java
choco install ruby -version 2.2.4
```

``` java
choco install ruby2.devkit
```

安装完成后我们把devkit和ruby关联起来

```java
cd C:\tools\DevKit2
```

执行

```java
ruby dk.rb init
```

创建了一个名为  

```java
config.yml
```

的文件，编辑这个文件 在最下方引入ruby安装路径

```java
- C:/tools/ruby22
```

执行

```java
ruby dk.rb install
```

执行完成后 ruby 已经安装成功了

接下来我们执行

```java
#安装jekyll
gem install jekyll -v 3.0.0 
#安装bundler
gem install bundler
```
 
安装成功之后找一个文件夹打开cmd 输入

```java
jekyll new 'your blog name'
cd 'your blog name'
jekyll serve 
```

执行成功后 浏览器输入http://localhost:4000 访问你的博客首页

成功后便可以在_post文件夹下写你的博客了

参考地址：[jekyll官方安装文档][jekyll]    [markdown中文文档][markdown]    [jekyll模板][jekyll-themes]

[jekyll]:      https://jekyllrb.com/docs/windows/
[markdown]:   http://www.appinn.com/markdown/
[jekyll-themes]: http://jekyllthemes.org/
