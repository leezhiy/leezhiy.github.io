---
layout: post
title: javascript之BOM（windows对象）
date: 2015-7-18 
tags: javascript   
---

ECMAScript是JavaScript的核心，但在web使用JavaScript，那么BOM(浏览器对象模型)才是真正的核心。

BOM的核心对象是window，它表示浏览器的一个实例。

在浏览器中，window对象既是JavaScript访问浏览器窗口的一个接口，又是ECMAScript规定的Global对象。也就是说，在网页中定义的任何一个变量、对象和函数以window作为其Global对象。

### 全局作用域

既然window对象扮演着Global对象，那么所有在全局作用域中声明的对象、变量和函数都会变成window的属性和方法。

定义全局变量和在window对象上定义属性还是有差别的：全局变量不能通过delete删除，而在window对象上定义的属性则可以。

```javascript
var age=28; 
window.color="red"; 
//在IE<9是抛出错误，在其他浏览器中都返回false 
delete window.age; 
//在IE<9是抛出错误，在其他浏览器中都返回true 
delete window.color;   //return true 
  
alert(window.age);     //28 
alert(window.color);   //undefined
```

在使用var语句添加window属性时，有一个名为[[Configurable]]的特性，这个特性的值被设置为false,因此这样定义的属性不可以通过delete删除。

在尝试访问未声明的变量会抛出错误，但通过查询window对象，可以知道某个可能未声明的变量是否存在。

```javascript
//这里抛出错误，因为oldValue未声明  
var newValue=oldValue;  
//这里不会抛出错误，因为这是一次属性查询 
var newValue=window.oldValue     //  alert(newValue);  //undefined
其实很多全局JavaScript对象如localtion和navigator实际上都是window对象的属性。
```

### 窗口关系及框架

如果页面中包含框架，则每个框架都有自己的window对象，并保存在frames集合中。

在frame集合中，可以通过数值索引或框架名来进行访问。

```html
<html> 
<head> 
    <title>Frameset Example</title> 
</head> 
<frameset rows="160,*"> 
    <frame src="frame.htm" name="topFrame"> 
    <frameset cols="50%,50%"> 
        <frame src="anotherframe.htm" name="leftFrame"> 
        <frame src="yetanotherframe.htm" name="rightFrame"> 
    </frameset> 
</frameset> 
</html>
```

就这个例子而言，可以通过window.frames[0]或者window.frames["topFrame"]来引用上方框架。不过最好使用top.frames[0]来访问框架。

top对象始终指向最高(外)层框架，也就是浏览器窗口。使用它可以确保在一个框架中正确地访问另一个框架。

与top对象相对的还有另一个window对象是parent,parent（父）对象始终指向当前框架的直接上层框架。

还有一个self对象，它始终指向window,实际上self与window可以互相使用，引入self对象的目的就只是为了与top和parent对象对应起来。

所有的这些对象，都是window的属性，可以使用window.parent或window.top使用它们。

### 窗口位置

多数浏览器都提供了screenLeft和screenTop,分别用于表示窗口相对与屏幕左边和上边的位置。FF则在screenX和screenY属性中提供相同的窗口信息，Safari金额Chorme也同时支持这两个属性。

使用下面代码可以跨浏览器取得窗口左边和上边的位置。

```javascript
var leftPos=(typeof window.screenLeft=="number")?window.screenLeft:window.screenX;
var topPos=(typeof window.screenTop=="number")?window.screenTop:window.screenY;
```
​

值得注意的是，在IE和Opera中screenLeft和screenTop中保存的是从屏幕左边和上边到window对象表示的页面可见区域的距离。在Chrome、FF和Safari中，screenY和screenTop中保存的是整个浏览器对于屏幕的坐标值。

最终结果就是无法在跨浏览器条件下取得窗口左边和上边的精确坐标值。

使用moveTo()和moveBy()方法倒是可以将窗口精确的移动到新位置，两个方法都接收两个参数，moveTo()接收的是x,y轴的坐标，moveBy()接收的是移动的像素。

```javascript
//将屏幕移动到左上方 
moveTo(0,0); 
//将窗口左移50px 
moveBy(-50,0);
```

但是，这两个方法可能会被浏览器禁用。这两个方法也只适用于最外层的window对象，不适用框架。

### 窗口大小

主流浏览器都为确定窗口大小提供了4个属性：innerWidth、innerHight、outerWidth和outerHight。

在IE9+、Safari和FF中，outerWidth和outerHight返回的是浏览器窗口本身的尺寸(无论从哪个框架访问),但在Opera中，这两个属性的值表示页面视图容器的大小(单个标签页窗口的大小)。而innerWidth、innerHight则表示该容器中页面视图的大小（减去边框的宽度）。但在Chrome中，这4个属性都表示视口大小而非浏览器大小。

IE9之前没有提供取得浏览器窗口尺寸的属性；不过它通过DOM提供了页面可视区域的信息。

在IE、FF、Chrome、Opera和Safari中，document.documentElement.clientWidth和document.documentElement.clientHight中保存着页面视口信息。在IE6下，要在标准模式下有效。如果是混杂模式就必须通过document.body.clientWidth和document.body.clientHight取得相同信息。Chrome则不分标准模式还是混杂模式。

虽然最终无法确定浏览器窗口本身的大小，但却可以取得页面视口的大小。

```javascript
var pageWidth = window.innerWidth, 
    pageHeight = window.innerHeight; 
      
if (typeof pageWidth != "number"){ 
    if (document.compatMode == "CSS1Compat"){ 
        pageWidth = document.documentElement.clientWidth; 
        pageHeight = document.documentElement.clientHeight; 
    } else { 
        pageWidth = document.body.clientWidth; 
        pageHeight = document.body.clientHeight; 
    } 
} 
  
alert("Width: " + pageWidth); 
alert("Height: " + pageHeight);
```

对于移动设备，window.innerWidth和window.innerHight保存着可见视口，也就是屏幕上页面区域的大小。移动IE浏览器则要通过document.documentElement.clientWidth和document.documentElement.clientHight获取相同信息。

 使用resizeTo()和resizeBy()方法都可以调整浏览器窗口大小，两个方法都接收两个参数，resizeTo()接收的是浏览器窗口新宽度和新高度，resizeBy()接收的是新窗口和老窗口的宽度差和高度差。

```javascript
//调整到100*100  
resizeTo(100,100);  
//调整到200*150  
moveBy(100,50);
```


但是，这两个方法可能会被浏览器禁用。这两个方法也只适用于最外层的window对象，不适用框架。

### 导航和打开窗口

window.open()方法既可以打开一个特定的URL，也可以打开一个新的浏览器窗口。该方法接收4个参数：URL，窗口目标，一个特性字符串和一个表示新页面是否取代当前页面的布尔值。

弹出窗口

各项参数

其中yes/no也可使用1/0；pixelvalue为具体的数值，单位象素。

参数|取值范围|说明

alwaysLowered|yes/no|指定窗口隐藏在所有窗口之后

alwaysRaised|yes/no|指定窗口悬浮在所有窗口之上

depended|yes/no|是否和父窗口同时关闭

directories|yes/no|Nav2和3的目录栏是否可见

height|pixelvalue|窗口高度

hotkeys|yes/no|在没菜单栏的窗口中设安全退出热键

innerHeight|pixelvalue|窗口中文档的像素高度

innerWidth|pixelvalue|窗口中文档的像素宽度

location|yes/no|位置栏是否可见

menubar|yes/no|菜单栏是否可见

outerHeight|pixelvalue|设定窗口(包括装饰边框)的像素高度

outerWidth|pixelvalue|设定窗口(包括装饰边框)的像素宽度

resizable|yes/no|窗口大小是否可调整

screenX|pixelvalue|窗口距屏幕左边界的像素长度

screenY|pixelvalue|窗口距屏幕上边界的像素长度

scrollbars|yes/no|窗口是否可有滚动栏

titlebar|yes/no|窗口题目栏是否可见

toolbar|yes/no|窗口工具栏是否可见

Width|pixelvalue|窗口的像素宽度

z-look|yes/no|窗口被激活后是否浮在其它窗口之上

示例：

```javascript
window.open('page.html','newwindow','height=100,width=400,top=0,left=0,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no')
```

脚本运行后，page.html将在新窗体newwindow中打开，宽为100，高为400，距屏顶0象素，屏左0象素，无工具条，无菜单条，无滚动条，不可调整大小，无地址栏，无状态栏。

### 间歇调用和超时调用

JavaScript是单线程语言，但它允许通过设置超时值和间歇时间来调度代码在特定时刻执行。前者是在指定的时间过后执行代码，后者则是每个指定的时间就调用一次。

超时调用setTimeout() 
setTimeout() 方法接受两个参数，第一个参数是函数，第二个参数是时间（单位微秒），返回数值ID。

```javascript
setTimeout( function () {  
alert("你好!");  
},1000);
```

调用setTimeout()后该方法会返回一个数值ID，表示超时调用，可以通过它取消超时调用。

```javascript
var timeOutId = setTimeout( function () {  
alert("你好!");  
},1000);  
  
clearTimeout(timeOutId);
```

间歇调用setInterval() 
setInterval()方法接受两个参数，第一个参数是函数，第二个参数是时间（单位微秒），返回数值ID 

```javascript
setInterval( function () {  
alert("你好!");  
},1000);
```

取消调用clearInterval()，接受一个参数间歇调用ID 

```javascript
var intervalId = null;  
var span = document.createElement("span"); //创建span节点  
span.Id="time"; //设置span的id  
document.body.appendChild(span); //body内添加span  
function incrementNumber () {  
var now = new Date();  
var timeStr = now.toLocaleTimeString();  
span.innerText =timeStr;  
num++;  
if (num == 10) {  
clearInterval(intervalId); //十秒后时间不变了  
}  
}  
intervalId = setInterval(incrementNumber,1000);
```

尽量用超时调用替代间歇调用 

```javascript
var num = 0;  
var max = 10;  
function incrementNumber() {  
num++;  
if (num<max) {  
setTimeout(incrementNumber,1000);  
} else {  
alert("OK");  
}  
}  
setTimeout(incrementNumber,1000);
```

### 系统对话框

警告框alert() 

```javascript
alert("欢迎光临!");
```

信息框confirm(),有取消，确定按钮 

```javascript
if (confirm("你同意吗？")) {  
alert("同意");  
} else {  
alert("不同意");  
}
```

提示框prompt(),用于提示用户输入一些文本 

```javascript
var result = prompt("您尊姓大名?"," ");  
if (result !== null) {  
alert(“欢迎光临，”+result);  
}
```
