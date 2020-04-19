title: static $this self 之间的区别
author: Li Zhiyuan
tags:
  - PHP
  - 面向对象编程
categories:
  - PHP
date: 2015-09-13 19:52:01
---

## 前言

最近在做项目时候，碰到一个问题，发现是对 self static 的理解不深，才出现了问题，所以记录下来，避免再次犯同样的错误。

<!-- more -->
## 正文

### $this 

this 比较好理解，就是指向当前对象，用于访问当前对象的非静态变量和非静态方法，它是和对象相关的；

```php
<?php
class Person {
    public $name;

    public function getName() {
        echo $this->name;
    }
}

$p = new Person();
$p2 = new Person();
$p->name = "小红";
$p2->name = "小明";
$p->getName();  // 小红
$p2->getName();  // 小明
```

上例中 new 了两个对象，并分别设置对象的 name 属性，`getName()` 中使用了 this 访问当前对象的 name 属性，所以分别输出了 name 的值。所以说，this 就是指向当前对象，不指向其他对象或类。

### self

self 和 this 不同，它指向类本身，不指向任何实例化对象，一般用来访问类中的静态变量和静态方法；

```php
<?php
class Person {
    public static $name = "小红";

    public static function getName() {
        echo self::$name;
    }
}

$p = new Person();
$p2 = new Person();
$p::getName();  // 小红
$p2::getName();  // 小红
$p::$name = "小明";
$p::getName();  // 小明
$p2::getName();  // 小明
```

上例中 new 了两个对象，并修改了其中一个对象的 name 属性，另一个对象的 name 属性值也改变了，所以说，self 是指向当前类的，和对象无关，所有的对象共用一个值。

### static

static 和 self 一样，都是指向类，一般都用来访问类中的静态变量和静态方法，但是又有一些不一样，具体来讲：self 写在哪个类里，实际调用的就是这个类；static 则是写在父类里，然后通过子类用到了这个 static，这个 static 指向的是这个子类，官方称之为 延时静态绑定 。
```php
<?php
class A {
    public function say() {
        echo "Hello";
    }

    public function saySelf() {
        self::say();
    }

    public function sayStatic() {
        static::say();
    }
}

class B extends A {
    public function say() {
        echo "World";
    }
}

$b = new B();
$b->say();  // World
$b->saySelf();  // Hello
$b->sayStatic();  // World
```

上例中可以看到，self 写在 A 类里，调用时就指向了 A 类，static 同样写在 A 类里，但是用 A 类的子类 B 类的对象去调用时，却指向了 B 类，在使用时，static 才确定指向哪个类，这就是  `后期静态绑定` 。

## 总结

this 指向当前对象，用来访问当前对象的非静态变量和非静态方法；

self 指向类，一般用来访问当前类的静态变量和静态方法，运行之前已经确定指向哪个类；

static 指向类，一般用来访问当前类的静态变量和静态方法，但又 不限于 静态的调用，运行时才确定指向哪个类。
