---
layout: post
title: javascript基础入门
date: 2015-7-18
tags: javascript   
---


JavaScript 语言正越来越受欢迎，可以说是是互联网上最突出的语言之一。你可以跨平台和浏览器使用它，其并不排斥后端语言。现在有许多不同的开发库——有些非常棒—— 这些库对开发很有帮助，比如说加快了开发的时间等等。问题是，有时候这些库与原始语言之间很是有一些距离，这使得像我们这种刚入门的开发者缺乏一种对语言的基础了解。

### 了解JavaScript语言

JavaScript语言是一种免费的客户端脚本语言，其能够让你往超文本标记语言(Hypertext Markup Language，HTML)页面中加入交互行为。客户端(client-side)意味着JavaScript运行在浏览器中，而不是用在服务器端。在网页被服务器送达并被浏览器加载后，客户端脚本就允许用户与网页进行交互。例如，Google Maps就是使用JavaScript语言来支持用户与地图之间的交互的，交互的方式有移动地图、放大和缩小等。没有JavaScript语言的话，网页需要为每次和每个用户的交互行为进行刷新，当然，除非页面用到了诸如Adobe Flash或是Microsoft® Silverlight一类的插件。JavaScript语言不需要插件。

因为JavaScript语言为加载后的网页提供用户交互行为，因此开发者通常会用它来实现下面的一些功能：

1. 动态添加、编辑和删除HTML元素及它们的值。

2. 在提交之前校验表单。

3. 在用户的计算机上创建cookies以用于在将来的访问中保存和检索数据。

在开始之前，只要知道语言的几个基本原则就行了：

1. 要在HTML文件中把JavaScript代码包含进来的话，你必须要把代码放在脚本标签(script)的内部，并加入text/javascript这一类型(type)属性(清单1)。

2. 所有的JavaScript语句以分号结束。

3. 语言是大小写敏感的。

4. 所有的变量名都必须以字母或是下划线作为开始。

5. 你可以使用注释来说明脚本中的某些行，注释的编写方式是，以一个双斜线(//)为开始，后面跟着注释。

6. 你还可以使用注释来把脚本注释掉。要注释脚本的多行的话，一种好的做法是使用/* 你的脚本在这里 */。任何位于星号之内的脚本在执行过程中都不会运行。

清单1.需要使用script标签和type属性来把JavaScript代码包含到HTML文件中来

```html
<script  type="text/javascript"></script> 
```

要隐藏浏览器不支持的JavaScript的代码，或是用户想把代码关掉的话，只要在JavaScrip语句的前后使用注释标签就可以了(清单2)。

清单2. 使用注释来隐藏浏览器不支持的JavaScript代码

```html
<script type="text/javascript">  

<!--  
Example statement here  
//-->  
</script> 
```

最常用的把JavaScript代码包含到网页中的方式是，使用脚本(script)标签中的src属性来把代码从一个外部的JavaScript文件中加载进来(清单3)。

清单3. 在HTML文件中包含外部的JavaScript文件

```html
<script type="text/javascript" src="path/to/javascript.js" kesrc="path/to/javascript.js"></script>
```

外部JavaScript文件是最常见的包含JavaScript代码的方式，这是有一些很实在的原因的：

1. 如果你的HTML页面中有着更少的代码的话，搜索引擎就能够以更快的速度来抓取和索引你的网站。

2. 保持JavaScript代码和HTML的分离，这样代码显得更清晰，且最终更易于管理。

3. 因为可以在HTML代码中包含进多个JavaScript文件，因此你可以把JavaScript文件分开放在web服务器上不同的文件目录结构中，这类似于图像的存放方式，这是一种更容易管理代码的做法。清晰、有条理的代码始终是让网站管理变得容易起来的关键。

### 变量

变量存储数据，这些数据稍后要被检索的或是要使用新的数据来更新。存储在变量中的数据可以是一个值或表达式，JavaScript语言有三种类型的表达式，表1对此做了描述。

表1. JavaScript表达式

表达式描述

算术　计算的结果为一个数值

字符串计算的结果为一个字符串

逻辑　计算的结果为一个布尔值(true或者false)

变量有两种类型：局部的和全局的。局部变量使用var这一关键字来声明，声明全局变量则不需要使用var关键字。使用了var关键字的变量被看成是 局部的，因为除了你声明它的地方所处的范围之外，它不能在其他任何地方被访问。例如，如果你在一个函数(在将近文章的结尾部分我会谈论到)的内部声明了一个局部变量的话，该变量就不能在该函数之外被访问，这就使得它是这一函数局部的。如果你没有使用var关键字声明这同一变量的话，它在整个脚本中就都是可被访问到的，而不仅限定于只能在那个函数中被访问。

清单4给出了一个局部变量的例子，其被命名为num，并被赋值为10。

清单4. 声明一个局部变量

```javascript
var num = 10;
```

要在脚本中的另一个位置访问num变量的值的话，你只需要通过名称来引用该变量就可以了，如清单5所示。

清单5. 访问变量的值

```javascript
document.write("The value of num is: "+ num); 
```

这一语句的结果是“The value of num is: 10”。这一document.write函数把数据写到网页中，在本文余下的部分中你都是使用这一函数来把例子写到网页中。

要把算术表达式存储到变量中的话，你只要把变量指配给计算的值就可以了，如清单6所示。计算的结果而非算式本身被存储在变量中。因此，我们又一次得到这一结果“The value of num is: 10”。

清单6. 存储算术表达式

```javascript
var num = (5 + 5);  
document.write("The value of num is: "+ num); 
```

要改变变量的值的话，通过你为变量所分配的名称来引用变量，并使用等号来为其赋一个新的值(清单7)。这次的不同之处在于你不需要使用var关键字，因为变量已经声明过了。

清单7. 改变现有变量的值

```javascript
var num = 10;  
document.write("The value of num is: "+ num);  
 
// 把num的值更新成15  
num = 15;  
document.write("The new value of num is: "+ num); 
```

这一脚本的结果先是一句“The value of num is: 10”，后面跟着“The new value of num is: 15”。除了讲解变量之外，这一节内容还引入了下一个主题，也就是运算符。你用来把值赋给变量的等号(=)就是一个赋值运算符，以及你用在5+5中的加号(+)是一个算术运算符。下一节内容谈论JavaScript语言中的所有变量运算符及其用法。

### 运算符

在执行JavaScript语言中的任何运算时，你都需要运算符。运算包括了加法、减法、比较等。JavaScript语言中有四种运算符。

1. 算术

2. 赋值

3. 比较

4. 逻辑

算术运算符

算术运算符执行基本的数学运算，比如说加减乘除等。表2列出并描述了JavaScript语言中的所有可用的算术运算。

表2. 算术运算符

运算符描述

+ 加法

- 减法

* 乘法

/ 除法

% 取模(找出余数)

++　 递增

--递减

赋值运算符

算术运算符执行基本的数学运算，而赋值运算符则是把值赋给JavaScript变量。当你在前面一节中把值赋给变量时，你已经见到了最常用的赋值运算符。表3列出并描述了JavaScript语言中所有可用的赋值运算符。

表3. 赋值运算符

运算符描述

=等于

+=把加法值(变量加上值的结果值)赋给变量

-=把减法值(变量减去值的结果值)赋给变量

*=把乘法值(变量乘上值的结果值)赋给变量

/=把除法值(变量除以值的结果值)赋给变量

%=把取模值(变量对值取模的结果)赋给变量

你已经看到了如何使用等号来把值或是表达式赋给变量，但现在我会给展示如何使用一个令人稍加困惑的赋值运算符。把一个加法值赋给一个变量可能是一个很奇怪的概念，但实际上很简单(清单8)。

清单8. 把一个加法值赋给一个变量

```javascript
var num = 10;  
document.write("The value of num is: "+ num);  
 
// 把num的值更新为15  
num += 5;  
document.write("The new value of num is: "+ num); 
```

这一脚本的结果是“The value of num is: 10”后面跟着“"The new value of num is: 15”。你可以看到，这一脚本中的运算符把加法值赋给了变量。这也可以当作是清单9中所编写的脚本的一种简短写法。

清单9. 把加法值赋给变量的一种更长的写法。

```javascript
var num = 10;  
document.write("The value of num is: "+ num);  
 
// 把num的值更新为15  
num = (num + 5);  
document.write("The new value of num is: "+ num); 
```

比较运算符

比较运算符确定变量或是它们的值之间的关系。你在条件语句中使用比较运算符，通过比较变量或是它们的值来计算出语句为true还是为false，以此创建逻辑。表4列出并描述了JavaScrpit语言中所有可用的比较运算符。

表4. 比较运算符

运算符描述

```
==等于

===　全等，用于值和对象类型

!=不等于

>大于

<小于

>=　大于或等于

<=　小于或等于
```

在编写任何类型的逻辑时，变量和值的比较都是最基本的。清单10中的例子展示了如何使用等于这一比较运算符(==)来确定10是否等于1。

清单10. 使用比较运算符

```javascript
document.write(10 == 1); 
```

逻辑运算符

逻辑运算符通常是用来组合条件语句中的比较运算符。表5列出并描述了JavaScript语言中的所有可用的逻辑运算符。

表5. 逻辑运算符

运算符描述

&&与

||或

! 非

现在在变量和运算符方面你已经有些经验了，是时候了解如何创建一种比简单的变量有着更多存储内容的机制了。

数组

数组类似于变量，但不同之处在于它们可以把多个值和表达式放在一个名称之下。把多个值存放在一个变量中，这种做法造就了数组的强大。你可存放在 JavaScript数组中的数据的类型和数量都没有限制，在脚本中声明数组之后，你就可以随时访问数组中的任何项的任何数据。虽然数组可以保存 JavaScript语言的任何数据类型，包括其他数组，但最常见的做法是，把相类似的数据存储在同一个数组中，并给它指定一个与数组项有关联意思的名称。清单11提供的例子使用了两个独立的数组来各自存放相类似的数据。

清单11. 把相类似的值存放在数组中

```javascript
var colors = new Array("orange", "blue", "red", "brown");  
var shapes = new Array("circle", "square", "triangle", "pentagon"); 
```

正如你见到的那样，是可以把所有的这些数据项都保存在一个数组中，但这是不符合逻辑的，且有可能会在以后给脚本带来问题，比如说在识别数组中存放的是什么数据时。

访问数组中的值很容易，但这里有一个陷阱存在。数组的ID总是从0而不是从1开始的，在第一次使用的时候你可能会有些困惑。ID从0开始递增，例如0、1、2、3等。要访问数组项的话你就必须要使用它的ID，其指向子项在数组中的位置(清单12)。

清单12. 把相类似的值保存在一个数组中

```javascript
var colors = new Array("orange", "blue", "red", "brown");   
document.write("Orange: "+ colors[0]);  
document.write("Blue: "+ colors[1]);  
document.write("Red: "+ colors[2]);  
document.write("Brown: "+ colors[3]); 
```

也可以给数组中的某个位置赋值，或是更新数组中的某项的值，就像前面访问数组中的项的做法一样(清单13)。

清单13. 给数组中的特定位置赋值

```javascript
var colors = new Array();  
colors[0] = "orange";  
colors[1] = "blue";  
colors[2] = "red";  
colors[3] = "brown";  
document.write("Blue: "+ colors[1]);  
 
// 把blue更新成purple  
colors[1] = "purple";  
document.write("Purple: "+ colors[1]); 
```

现在你已经很好地了解了变量、运算符和数组，接下来把你所学的东西运用到实践中，开始创建一些逻辑。

条件语句

条件语句是创建脚本语言或是编程语言中各种类型的逻辑的骨架，JavaScript语言也不例外。条件语句基于你所写的条件来确定要采取的行为，JavaScript语言有四种编写条件语句的方式，表6对此做了描述。

表6. 条件语句

语句描述

if如果某个特定条件为true的话就执行脚本

if...else　如果某个特定条件为true的话就执行某个脚本，

如果条件为false的话则执行令一个脚本

if...else if...else　 如果不限个数的多个条件中之一为true的话就执行某个脚本，

如果所有的条件都为false的话 就执行其他的脚本

switch　执行许多脚本中的一个

如果你只想在某个条件为true时执行某个脚本的话，就使用if语句。清单14展示了如何使用带有比较运算符的if语句来在条件为true时执行脚本。

清单14. 使用if语句

```javascript
var num = 10;  
if(num == 5)  
{  
   document.write("num is equal to 5");  
} 
```

如果你打算在某个条件为true时执行一个脚本，而在条件为false时执行另一个脚本话，那么使用if...else语句，如清单15所示。

清单15. 使用if...else语句

```javascript
var num = 10;  
if(num == 5)  
{  
   document.write("num is equal to 5");  
}  
else 
{  
   document.write("num is NOT equal to 5, num is: "+ num);  
} 
```

如果要基于不同的条件来执行不同的脚本的话，则使用if...else if...else语句，如清单16所示。

清单16. 使用if...else if...else语句

```javascript
var num = 10;  
if(num == 5)  
{  
     document.write("num is equal to 5");  
}  
else if(num == 10)  
{  
   document.write("num is equal to 10");  
}  
else  
{  
  document.write("num is: "+ num);  
} 
```

Swith语句不同于if语句，它们不能用来确定变量值是否大于或是小于另一个值。清单17给出的例子说明了使用switch语句来确定要执行的脚本的适当时机。

清单17. 使用switch语句

```javascript
var num = 10;  
switch(num)  
{  
   case 5:  
      document.write("num is equal to 5");  
      break;  
   case 10:  
      document.write("num is equal to 10");  
      break;  
   default:  
      document.write("num is: "+ num);  
} 
```

你可能已经注意到清单17用到了case子句、break语句和default子句。这些子句和语句对switch语句来说都是很重要的部分。case子句确定了switch的值是否与子句中用到的数据值相等;break语句中断——或是停止——switch语句执行语句的余下部分;而default子句则标明了在没有case语句执行的情况下或是已执行的case语句没有break语句的情况下，缺省要运行的脚本。例如，清单18说明了在已执行的case语句中如果没有break语句的话，多个case语句和default语句是如何执行的。

清单18. 通过不包含break的方式来执行多行代码

```javascript
var num = 10;  
switch(num)  
{  
   case 5:  
      document.write("num is equal to 5");  
      break;  
   case 10:  
      document.write("num is equal to 10");  
   default:  
      document.write("num is: "+ num);  
} 
```

这一脚本的结果先是一句“num is equal to 10”，后面再跟着一句“num is: 10”。这种情况有时被称为switch直落。

正如本节开头提到的那样，条件语句是任何脚本语言或是编程语言中的所有逻辑的骨架，不过如果不用函数的话，你得到的代码就会像纠缠不清的一团乱麻。

### 函数

有许多理由可用来证明函数是很有用的。函数是那些只能由事件或是函数调用来执行的脚本的容器，因此，在浏览器最初加载和执行包含在网页中的脚本的时候，函数并没有被执行。函数的目的是包含那些要完成某个任务的脚本，这样你就随时都能够执行该脚本和运行该任务。

构建一个函数很容易，其以function这一关键字作为开始，接着是一个空格，然后是函数的名称。你可以选择任何的字串来作为函数的名称，不过让函数的名称和其要执行任务之间有某种关联意思是很重要的。清单19给出了一个函数例子，该函数修改一个现有变量的值。

清单19. 构建一个简单的函数

```javascript
var num = 10;  
function changeVariableValue()  
{  
   num = 11;  
}  
changeVariableValue();  
document.write("num is: "+ num);
```


清单19中的例子不仅说明了如何构建一个函数，还说明了如何调用函数来修改变量的值。在这一例子中你能够修改变量的值是因为，变量是在主脚本范围里做声明的，函数也是一样，因此函数知道变量的存在。然而，如果变量是在函数的内部做声明的话，那么在函数的外部你是不能访问该变量的。

函数还能够通过函数的参数来接受数据，函数可以有一个或多个形式参数，函数调用基于函数的形式参数个数可以有一个或多个实际参数。形式参数(形参，parameter)和实际参数(实参，argument)常会被弄混;形参是函数定义的组成部分，而实参则是在调用函数时用到的表达式。清单20给出了一个函数例子，该函数带有形参，函数调用则用到了实参。

清单20. 使用函数参数

```javascript
var num = 10;  
function increase(_num)  
{  
   _num++;  
}  
increase(num);  
document.write("num is: "+ num); 
```

这一例子中的函数递增了任何传递给它的实际参数的值，该例中的实际参数是一个你已预先声明了的变量。通过把它作为一个实际参数传递给函数，你把它的值递增成了11。

return语句在函数中也是常被用到的，它们在执行完函数中的脚本后返回一个值。例如，你可以把函数返回的值赋给一个变量。清单21中的例子说明了在执行脚本之后，如何从函数中返回一个值。

清单21. 在函数中使用return语句

```javascript
function add(_num1, _num2)  
{  
   return _num1+_num2;  
}  
var num = add(10, 10);  
document.write("num is: "+ num); 
```

这一脚本的结果是“num is: 20”。这一函数的好处是，它可以把你传递给它的任意两个数字相加并返回相加后的值，你可以把该值赋给任何变量，而不是像清单20那样总是改变同一个变量的值。

### 循环

正如你已经见到的那样，数组是存储大量可重用数据的一种很棒的方式。但这不过是一个开始;for和while循环提供了遍历这些数组、访问它们的值和使用它们来执行脚本的功能。

JavaScript语言中最常用到的循环类型是for循环。for循环通常是这样构成的，先是一个赋了数值的变量，然后该变量使用一个比较运算符来和另一个值做比较，最后该数字值被递增或是递减。for循环中的比较通常是确定初始变量的数值是否小于或是大于另一个数值，接着在条件为true的这段时间内，循环运行，变量递增或是递减直到条件的计算结果为false。清单22给出的例子说明了如何编写一个for循环，当数值小于数组的长度时循环运行。

清单22. 构建一个for循环并遍历一个数组

```javascript
var colors = new Array("orange", "blue", "red", "brown");  
for(var i=0; i<colors.length; i++)  
{  
   document.write("The color is: "+ colors[i] );  
}
```

数组的length属性提供了一个与数组中的子项个数相等的数值，再一次说明，这里容易让你出错的一点是，数组的ID是从0开始的，因此，如果数组中有4个子项的话，长度就是4，但数组中的索引则是0、1、2和3——没有4。

另一种循环类型是while循环，它们的执行速度比for循环快，但适用在一些不是遍历数组的情况中，比如说当某个条件为true时执行某个脚本。清单23展示了如何编写这样的一个while循环，即当数值变量小于10时执行某个脚本。

清单23. 构建while循环

```javascript
var i = 0;  
while(i<10)  
{  
   document.write(i +"");  
   i++;  
} 
```

可以注意到，while循环中的脚本包含了一行代码，该行代码叠加数值变量直到while循环中的条件为false为止。没有这行代码的话，你得到的就是一个无限循环。

### 结论

JavaScript语言可以说是最受欢迎的语言之一，现在你明白这是为什么了。这一简单而又丰富的脚本语言带来了如此之多的可能性，它提供的工具允许网站访问者和下载后的网页进行交互，这一功能非常的强大。本文为理解JavaScript语言的基本原理奠定了基础，现在对你来说，要了解JavaScript库函数的作用方式，以及如何使用它们来简化网页客户端逻辑的编写过程都应该是更容易的事了。接下来要做到事情就是把这些概念付诸实践，并开始探索JavaScript对象。