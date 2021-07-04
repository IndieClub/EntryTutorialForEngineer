# Commit管理

本文基于Git进行团队协作

-   不久的以后,我们将会迁移至PlasticSCM

需要注意的是,模块由每一次项目,重新设立

## 模块划分(scope)

## Commit规范

Commit分为

-   Header 简单的描述

-   Body 具体的描述

-   Footer 任务完成情况

```
Markdown \<type\>(\<scope\>): \<subject\>  // 空一行  \<body\>  // 空一行  \<footer\> 

feat(interact): 完成了互交模块  

1. 完成了InteractZone的编写 

2. 完成了对玩家模块的接接入   
```
### Header

\<类型\>(\<范围\>): \<主题\>

**类型**

**feat**

完成了模块的新功能

-   我开始进行一个新的模块制作,那么第一个push必定是feat

-   比如说"驱逐模块", feat(exile): 完成了驱逐模块

后续该模块的功能,采用feat(exile.某功能).

**fix**

修复bug, 你自己发现的,QA发现的

由于bug一般是通过"Issue"进行管理的,因此后面一般添加的是issue的 id

**docs**

文档修改

在PlasticScm中,我们把文档放置在对应的目录下

**Style**

不影响代码运作,但是把代码整的更好看

| Bash bool a=true; bool IsATrue(){ return a; } bool isbtrue(){ return b } bool b=true |
|--------------------------------------------------------------------------------------|

修改为

| Bash bool a=true; bool b=true;  bool IsATrue(){ return a; } bool IsBTrue(){ return b } |
|----------------------------------------------------------------------------------------|

或者说

| Bash bool a=true; bool b=true; bool c=true;  bool isbtrue(){ return b; } if(a){ }else{ if(b){}else if(!c){} }  |
|----------------------------------------------------------------------------------------------------------------|

修改为

| Bash if(a){}  if(a&&b){}  if(a&&b&&!c){}  bool IsBTrue(){ return b; } |
|-----------------------------------------------------------------------|

**refactor**

你改了一些东西,不算新功能,也不算Bug修复,那么就是refactor.

比如说你完成了玩家状态机, 后面如果是添加一个新的状态机,那么得用feat.

但是如果是把旧的状态机,做修改,来支持新的东西,那么旧用refactor,但是还没有新的东西接入

**Perf**

性能相关的改动

**Test**

test 新增测试 由于本人对测试方面不是很了解,古不多做描述

**Meta(UnityOnly)**

针对Unity中的.meta文件的改动.

**Chore**

非代码的变动,比如说构建工具这类的.

比如说你往项目里面加了一个初始化项目的init_project.sh

只要不是东代码的都可以归类这里来

**Art**

美术类资产的增减

### Body

body则是描述你干了些什么.过于抽象,因此不做描述

### Footer

**不兼容改动**

如果当前代码与上一个版本不兼容，则 Footer 部分以BREAKING
CHANGE开头，后面是对变动的描述、以及变动理由和迁移方法

| Bash fix(interact): 修复互交区域无法显示的bug  1. 出错位置位于 当玩家离线的时候,没有关闭占用  BREAKING CHANGE - 你改了什么 其他人由于你把这个改后怎么使用  |
|------------------------------------------------------------------------------------------------------------------------------------------------------------|

**关闭Issue**

如果当前 commit 针对某个issue，那么可以在 Footer 部分关闭这个 issue
(可依次关闭过个issueCloses \#123, \#245, \#992)

**Revert**

还有一种特殊情况，如果当前 commit 用于撤销以前的
commit，则必须以revert:开头，后面跟着被撤销 Commit 的 Header

其实就是在commit的header前面添加 "revert:"

| Bash revert: type(scope): abcwda  回滚commit bfe307ce57d87677c6c473c228e6c2ed8b81dcec. |
|----------------------------------------------------------------------------------------|
