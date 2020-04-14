---
layout: post
title: 浅析session和cookie的区别和联系
date: 2015-7-15 
tags: [PHP,Session,Cookie,面试问题]
categories: [PHP,面试问题]
---

### COOKIE介绍

 　cookie 常用于识别用户。cookie 是服务器留在用户计算机中的小文件。每当相同的计算机通过浏览器请求页面时，它同时会发送 cookie。通过 PHP，您能够创建并取回 cookie 的值。

<!--more-->

 1. 设置Cookie
 
PHP用SetCookie函数来设置Cookie。

SetCookie函数定义了一个Cookie，并且把它附加在HTTP头的后面，SetCookie函数的原型如下：

```php
int SetCookie(string name, string value, int expire, string path, string domain, int secure);
```

参数说明：cookie名称，cookie值，过期时间(int),有效路径，有限域名，https传递才有效

    注意：当前设置的Cookie不是立即生效的，而是要等到下一个页面时才能看到.这是由于在设置的这个页面里Cookie由服务器传递给客户浏览器，在下一个页面浏览器才能把Cookie从客户的机器里取出传回服务器的原因。

使用例子：

普通使用：

```php
setcookie('name','leezhiy');
```

带失效时间的：

```php  
setcookie('name','leezhiy',time()+24*60*60);//1day
```

Cookie是面向路径的 ,默认存储在当前文件下,如果没有设置路径，不同文件下的cookie默认保存在不同文件夹下，如图：默认保存在mytest文件夹下

![](/assets/images/sessionandcookie/save.png)

2. 接收和处理Cookie

用户端与服务端的web通信协议是http。而PHP通过http取得用户数据惯用的三种方法分别是:POST方法、GET方法还有Cookie。而PHP默认传递方法正是Cookie,也是最佳方法。

比如设置一个名为MyCookier的Cookie，PHP会自动从WEB服务器接收的HTTP头里把它分析出来，并形成一个与普通变量一样的变量，名为$myCookie，这个变量的值就是Cookie的值

3. 删除Cookie

要删除一个已经存在的Cookie，有两个办法：

一是调用只带有name参数的SetCookie，那么名为这个name的Cookie将被从关系户机上删掉；例如：setcookie('name','');
另一个办法是设置Cookie的失效时间为time()或time()-1，那么这个Cookie在这个页面的浏览完之后就被删除了（其实是失效了）。 例如：
```php
    setcookie('name','leezhiy',time()-24*60*60); 
```

     要注意的是，当一个Cookie被删除时，它的值在当前页在仍然有效的。 

使用Cookie的注意事项：

首先是必须在HTML文件的内容输出之前设置(Cookie是HTTP协议头的一部分，用于浏览器和服务器之间传递信息，所以必须在任何属于HTML文件本身的内容输出之前调用Cookie函数。

在PHP页面可以先使用

```php
ob_start();//开启

code…..

ob_end_flush(); //刷新缓存
```

可以防止header提示错误；

1. 不同的浏览器对Cookie的处理机制不一样
2. cookie限制是在客户端的。一个浏览器能创建的Cookie数量最多为30个，并且每个不能超过4KB，每个WEB站点能设置的Cookie总数不能超过20个。
3. 当前设置的Cookie不是立即生效的，而是要等到下一个页面时才能看到

### Session介绍

session机制是一种服务器端的机制，服务器使用一种类似于散列表的结构（也可能就是使用散列表）来保存信息，每一个网站访客都会被分配给一个唯一的标志符,即会话ID,它的存放形式无非两种:要么经过url传递,要么保存在客户端的Cookies里.当然,你也可以将Session保存到数据库里,这样会更安全,但效率方面会有所下降.url方式传递安全性肯定太差,PHP的会话机制是通过设置Cookie,在Cookie中保存会话id(Session ID),在服务器端会生成session文件,与用户进行关联,Web应用程序存储与这些Session相关的数据,并在各页面间进行传递.

PHP相关函数

在PHP中有关Session的函数比较多,不过我们最常用到的也就这么几个函数:

```php
session_start();#启用session机制,在需要用到session的程序文件的最开始调用它.

session_register();#注册session变量

session_unregister();#删除session变量(一个一个删除)

session_is_registered();#判断session变量是否注册

session_distroy();#销毁所有session变量(所有session变量销毁，包括文件)
```

需要注意下面几个方面:

1. 函数session_start()必须在程序最开始执行,在其前面不能有任何输出内容,否则    就会出现“Warning:Cannot send session cookie - headers already sent"类似这样的警告信息。

2. 函数session_register()用于注册要保存在session中的相关变量,其用法如下:

```php
<?php

  $val = "session value";

  session_register("val");

?>
```

val即为要注册的session变量名,在注册时一定不要加上"$"符号,只写其变量名称即可.

3. 函数session_unregister()与上面函数用法完全相同,但功能相反,上面函数是注册session变量,而其则是删除指定的session变量.

4. 函数session_is_registered()用于判断session变量是否注册.

5. 函数session_destroy()主要用于在系统注销和退出时，销毁所有的session变量，它没有参数，直接调用即可。

Session与PHP.ini的关系配置

1. session.save_handler = file

用于读取/回写session数据的方式，默认是files。它会让PHP的session管理函数使用指定的文本文件存储session数据

2. session.save_path = “/xammp/temp/”

 

指定保存session文件的目录，可以指定到别的目录，但是指定目录必须要有httpd守护进程属主(比如apache或www等)写权限，否则无法回存session数据。它还可以写成这样session.save_path = “N;/path” 其中N是整数。这样使得不是所有的session文件都保存在同一个目录中，而是分散在不同目录。这对于服务器处理大量session文件是很有帮助的。(注:目录需要自己手工创建)

3. session.auto_start = 0

如果启用该选项，用户的每次请求都会初始化session。不推荐使用，最好通过session_start()显示地初始化session。

### cookie与session的区别和关系

存储位置：

session存储在服务器位置上，可以通过php.ini里面配置session相关配置
cookie存储在客户端上的上（其实可以分两种：
1. 持久性cookie，设置了cookie的时间，以文件方式存在硬盘上，
2. 会话cookie，没有设置cookie时间，cookie的生命周期也就是关闭浏览器前就消失，一般不会保存在硬盘，而是保存在内存上）

cookie和session的关系

cookie通过http报头发送：

Cookie  name=PHP%BB%B4%B1%B1; PHPSESSID=cpt2ah3pi4cu7lo69nfbfllbo7

其中PHPSESSID就是关联服务器session的重要参数

再看session文件：sess_cpt2ah3pi4cu7lo69nfbfllbo7

session_id的生成格式就是：sess_加上一串PHPSESSID的值

我们可以这样理解：

当程序需要为某个客户端的请求创建一个session时，服务器首先检查这个客户端的请求里是否已包含了一个session标识 （称为session id），如果已包含则说明以前已经为此客户端创建过session，服务器就按照session id把这个session检索出来 使用（检索不到，会新建一个），如果客户端请求不包含session id，则为此客户端创建一个session并且生成一个与此session相 关联的session id，session id的值应该是一个既不会重复，又不容易被找到规律以仿造的字符串，这个session id将被在本次响应 中返回给客户端保存。保存这个session id的方式可以采用cookie，这样在交互过程中浏览器可以自动的按照规则把这个标识发送给 服务器。一般这个cookie的名字都是类似于SEEESIONID

php.ini里面关于session和cookie有关的配置

1. session.use_cookie = 1 
是否采用Cookie方法传递session id值。默认是1，表示启用。 
2. session.name = PHPSESSID 
不管是Cookie传递sessioin_id，还是GET方法传递session_id，都需要使用键值。他们的格式分别是Cookie:  sess_name=session_id;和/path.php?sess_name=session_id，其中sess_name就是由这里指定的。 
3. session.use_only_cookies = 0 
表示只使用Cookie 的方法传递session id。我们说过，传递cookie的方法，除了cookie，还有GET方法，GET方法是不安全的方法。在用户端禁用了cookie的时候，会采用GET方法传递session_id，可以通过这个设置尽用GET方法传递session_id。 
4. session.cookie_lifetime = 0, session.cookie_path = / 以及session.cookie_domain = 
如果使用Cookie方法传递session_id的话，这里分别指定了cookie有效域、目录和时间。分别对应setcookie()函数的形参$expire、$path和$domain。其中cookie_lifetime=0表示直到关闭浏览器才删除Cookie。还可以使用session_set_cookie_params()函数修改这些值。 
5. session_name([string $name]) 
获取或更新session_name。如果传了name，则表示不使用默认的名称PHPSESSID(由session.name)指定，否则获取当前session_name。注意:如果设置session_name，则必须在session_start()之前调用才生效。 
6. session_id([string $id]) 
与session_name()类似，但它是读取或者设置session_id的方法。同样，设置session_id的话，必须在session_start()之前调用才有效。 
7. session_set_cookie_params()和session_get_cookie_params() 
通过session_set_cookie_params()可以重新设定session.cookie_lifetime, session.cookie_path以及session.cookie_domain这三个php.ini设置。而session_get_cookie_params()则是获取这些设定的值。

### 总结：

1. 服务端session的相对于客户端的cookie安全性要较高一点
2. session在服务器集群的时候容易不同步，而cookie不会

ps：下午关于使用cookie退出出现的问题

当退出的时候使用：

```php
setcookie('username','',time()-3600); 
setcookie('name','',time()-3600); 
```

理论上cookie应该正常清除，测试的时候发现第一登录退出完全正常，但是再次登录就是退出不了（页面是退出了，只是使用getjson获取服务端cookie，然后根据cookie值做的相关判断没有变化），很是郁闷，使用firebug查看原来页面设置了缓存，使用nginx设置了页面缓存，原因也就是找到了。

由于设置了缓存，本地客户端getjson不能及时向向服务器申请信息，getjson获取还是上次页面的cookie值，使用php header设置header报头 不设置cache ，问题解决。