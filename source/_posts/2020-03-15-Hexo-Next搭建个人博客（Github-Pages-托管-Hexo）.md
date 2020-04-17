title: Hexo+Next搭建个人博客（Github Pages 托管 Hexo）
author: Li Zhiyuan
tags:
  - Hexo
  - Next
  - 博客
categories:
  - 博客搭建
  - Hexo
date: 2020-03-15 16:55:05
---
## 前言

最近将博客从 Jekyll 迁移到 Hexo，在迁移的过程中也遇到一些问题，下面就简单记录一下 {% label info@Hexo+NexT+Github Pages %} 的搭建步骤。

在上一章，我们对博客进行了一些基础设置并安装了几个第三方插件， 在本章我们将把博客部署到 Github Pages 中。

<!-- more -->

## 什么是 GitHub Pages

`GitHub Pages` 是一个静态站点托管服务。

`Github page` 旨在直接从 `GitHub` 仓库中直接托管您的个人、组织或项目页面。了解关于 `GitHub Pages` 网站不同类型的更多信息，请参阅[用户、组织和项目页面](https://help.github.com/articles/user-organization-and-project-pages/)。

`GitHub Pages` 是静态站点托管服务器，不支持 PHP ，Ruby 或 Python 等服务器端代码。

### GitHub Pages使用指南

在2016年6月15日之后创建的 GitHub Pages 并且使用 github.io 作为域名的网站提供了 HTTPS 支持。如果您在2016年6月15日之前创建了您的网站，您可以为您的网站启用 HTTPS 支持。

GitHub Pages 网站不应用于敏感交易，如发送密码或信用卡号码。

您使用 GitHub 页面需遵守 GitHub 服务条款，包括禁止转售。

警告：GitHub Pages网站在互联网上是公开的，即使他们的存储库是私有的。 如果您的页面存储库中有敏感数据，则可能需要在发布之前将其删除。

### 使用限制

GitHub Pages 网站受到以下使用限制：

* GitHub Pages 源仓库建议限制为1GB；

* 发布的 GitHub Pages 网站可能不超过1GB；

* GitHub Pages 网站每月的带宽限制为100GB；

* GitHub Pages 网站每小时限制10个软件。

如果您的网站超过这些使用配额，我们可能无法为您的网站提供服务，或者您可能会收到 GitHub Support 的礼貌的电子邮件，建议您减少网站对我们的服务器影响的策略，包括放置第三方内容分发网络 ，利用其他GitHub功能（如发行版），或转移到可能更适合您需求的其他托管服务。

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

安装完成后，还需要最后一步设置，在命令行输入

```shell script
$ git config --global user.name "Your Name"
$ git config --global user.email "email@example.com"
```

**注意：** `git config`命令的`--global`参数，用了这个参数，表示你这台机器上所有的Git仓库都会使用这个配置，当然也可以对某个仓库指定不同的用户名和Email地址。

## 注册 GitHub 账号

GitHub官方网站：https://github.com/

进入[GitHub官网注册页面](https://github.com/join)，会见到所示界面，分别输入Username，Email和Password，然后点击Create account。

注意：该处的Username、Email和Pssword一定要记住，后边要多次使用，如果太长比较难记，建议最好记在本子上。

![GitHub 注册页面](/images/github-create-account.png)


然后我们直接去注册填写的邮箱进行邮箱验证，验证通过后点击 Create a repository 创建版本仓库，如下图
![邮箱验证成功](/images/github-email-verified.png)


来到创建版本库页面如下图所示，填写Repository name，注意其格式不要写错。

例如：你的Username是xiaoming，那你的Repository name就是xiaoming.github.io。

![创建版本库](/images/github-create-repository.png)

点击Create repository，完成创建。

## 配置 SSH

配置shh key是让本地git项目与远程的github建立联系

* 检查是否已经有SSH Key，打开Git Bash，输入
  ```shell script
  $ cd ~/.ssh
  ```
  
* 如果没有.ssh这个目录，则生成一个新的SSH，输入
  ```shell script
  $ ssh-keygen -t rsa -C "your e-mail"
  ```
  
**注意:**  
1. 此处的邮箱地址，你可以输入自己的邮箱地址；
2. 此处的「-C」的是大写的「C」

* 之后会出现
  ```shell script
   Generating public/private rsa key pair.  
   Enter file in which to save the key (/c/Users/you/.ssh/id_rsa):  
   //到这里可以直接回车将密钥按默认文件进行存储 
  ```

* 然后会出现
  ```shell script
   Enter passphrase (empty for no passphrase):  
   //这个密码会在你提交项目时使用，如果为空的话提交项目时则不用输入。这个设置是防止别人往你的项目里提交内容。这里我们暂时不输入
   Enter same passphrase again:
  ```

* 接下来会显示
  ```shell script
   Your identification has been saved in /c/Users/you/.ssh/id_rsa.  
   Your public key has been saved in /c/Users/you/.ssh/id_rsa.pub.  
   The key fingerprint is:  
   这里是各种字母数字组成的字符串，结尾是你的邮箱  
   The key's randomart image is:  
   这里也是各种字母数字符号组成的字符串 
  ```
  
* 运行以下命令，将公钥的内容复制到系统粘贴板上
  ```shell script
  $ clip < ~/.ssh/id_rsa.pub
  ```
## 添加 SSH Key 到 GitHub

* 登陆 GitHub，进入 Settings：
![GitHub 设置](/images/github-setting.png/)

* 点击左侧菜单 SSH and GPG Keys：
![GitHub SSH 设置](/images/github-ssh-setting.png)

* 选择 New SSH key：
![GitHub 新建SSH](/images/github-ssh-new.png)

* 粘贴密钥：
![粘贴秘钥](/images/github-create-ssh.png)

## 测试 SSH Key 是否配置成功

* 输入以下命令：注意：git@github.com不要做任何更改！
  ```shell script
  $ ssh -T git@github.com
  ```
  
* 如配置了密码则要输入密码,输完按回车
  
  如果显示以下内容，则说明Github中的ssh配置成功。
  ```shell script
  Hi username! You've successfully authenticated, but GitHub does not provide shell access.
  ```
  
## 将博客网站上传到 GitHub

* 打开 Hexo 文件夹中的 `_config.yml` 文件，搜索 `deploy` 关键字，修改如下
  ```shell script
  # Deployment
  ## Docs: https://hexo.io/docs/deployment.html
  deploy:
    type: git
    repo: https://github.com/leezhiy/leezhiy.github.io # 这里换成自己的仓库地址
    branch: master
  ```

* 打开 `git bash` 执行以下命令
  ```shell script
  $ hexo g  
  $ hexo d
  ```

* 或者直接执行
  ```shell script
  $ hexo g -d
  ```
  
* 执行完之后会让你输入你的 Github 的账号和密码，如果此时报以下错误，说明你的 deployer 没有安装成功
  ```shell script
   ERROR Deployer not found: git
  ```
  
* 需要执行以下命令再安装一次：
  ```shell script
  npm install hexo-deployer-git --save
  ```
  
* 再执行 `hexo g -d`，你的博客就会部署到 Github 上了

  此时, 通过访问 http://yourname.github.io 可以看到默认的Hexo首页面（与之前本地测试时一样）。
  
## 在博客上发表文章

博客已经成功搭建了，但是我们该怎么写博客呢？

* 新建一个空文章，输入以下命令，会在项目 **\Hexo\source\_posts** 中生成 文章标题 **.md** 文件，文章标题根据需要命名
  ```shell script
  $ hexo n "文章标题"
  ```
  当然也可以直接在 **\Hexo\source\_posts** 目录下右键鼠标新建文本文档，改后缀为 **.md** 即可，这种方法比较方便

* 用编辑器编写文章
  
  **md** 全称 **Markdown**， Markdown 是 2004 年由 John Gruberis 设计和开发的纯文本格式的语法，非常的简单实用，常用的标记符号屈指可数，几分钟即可学会， **.md** 文件可以使用支持 Markdown 语法的编辑器编辑，然后保存文件到 **\Hexo\source\_posts**文件夹下即可

  文章标题，标签，分类，封面图片，摘要等，可以在 Front-matter 里面配置（Front-matter 是文件最上方以 — 分隔的区域，用于指定个别文件的变量，更多可以查看 [官方文档](https://hexo.io/zh-cn/docs/front-matter) ），举个例子：

  ```shell script
  
  ---
  layout: 页面布局（配合主题文档使用）
  title: 文章名称
  date: 文章日期
  comments: 文章是否开启评论
  photos: 文章封面图（仅部分主题支持）
  tags: 
    - 文章标签一
    - 文章标签二
  categories: 文章分类
  description: 文章描述，即要在首页显示的摘要（仅部分主题支持）
  ---
  这里是摘要
  
  <!-- more -->

  这里是正文

  注意：description 和 <!-- more --> 方式显示摘要二选一即可，部分主题不支持description，每个配置英文冒号后面要空一格，不同主题配置有所差异，具体要参考主题文档
  ```

* 当我们用编辑器写好文章后，可以使用以下命令将其推送到服务器上
  ```shell script
  $ hexo g  
  $ hexo d
  ```
* 或者将两个命令合二为一输入以下命令：
  ```shell script
  $ hexo d -g
  ```
  
现在访问你的博客就可以看见写好的文章啦！
