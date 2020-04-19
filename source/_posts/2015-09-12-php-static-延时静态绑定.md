title: php static 延时静态绑定
author: Li Zhiyuan
tags:
  - PHP
  - 面向对象编程
categories:
  - PHP
date: 2015-09-12 17:44:36
---
## 前言

最近在做项目时候，碰到一个问题，发现是对 self static 的理解不深，才出现了问题，所以记录下来，避免再次犯同样的错误。

<!-- more -->

## 详情

后期静态绑定（也叫延迟静态绑定），可用于在继承范围内引用静态调用的类，也就是代码运行时最初调用的类。

后期静态绑定本想通过引入一个新的关键字来表示，但最终还是沿用了 static 关键字。

我们来看一个例子来更好的理解它：

```php
abstract class DomainObject{
}
 
class User extends DomainObject{
    public static function create(){
        return new User();
    }
}
 
class Document extends DomainObject{
    public static funtion create(){
        return new Documnet();
    }
}
```

如果把create()放在抽象类中

```php
abstract class DomainObject{
    public static function create(){
        return new self();
    }
}
 
class User extends DomainObject{
}
 
class Document extends DomainObject{
}
Document ::create();
```

但是事实上self指的不是调用上下文，它指的是解析上下文，因此self被解析为定义create()的DomainObiect，而不是解析为调用self的Document类。

php5.3 引入了延迟静态绑定的概念，static 类似于 self，但它指的是被调用的类而不是包含类，在本例中，它的意思是调用 Document::create() 将生成一个 Document 对象，而不是实例化一个 DomainObject 对象

```php
abstract class DomainObject{
    public static function create(){
        return new static();
    }
}
 
class User extends DomainObject{
}
 
class Document extends DomainObject{
}
Document ::create();
```
