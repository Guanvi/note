### **Linux shell**
--- 
- `GNU/Linux shell是一种特殊的交互式工具.它为用户提供了启动程序,管理文件系统中的文件以及运行在Linux系统上的进程的途径.`
- `shell的核心是命令行提示符.命令行提示符是shell负责交互的部分,它允许你输入文本命令,然后解释命令,并在内核中执行`
- `shell包含了一组内部命令,用这些命令可以完成诸如复制文件,移动文件,重命名文件,显示和终止系统中正运行的程序等操作.shell也允许你在命令行提示符中输入程序的名称,它将程序名传递给内核以启动它`
- `你也可以将多个shell命令放入文件中作为程序执行.这些文件被称为shell脚本.你在命令行上执行的任何命令都可放进一个shell脚本中作为一组命令执行.这为创建那种需要把几个命令放在一起来工作的工具提供了便利`
<br/>
<br/>
> <small>在Linux系统上,通常有好几种Linux shell可用.不同的shell有不同的特性,有些更利于创建脚本,有些则更利于管理进程.<br/>所有Linux发行版默认的shell都是bash shell. bash shell由GNU项目开发,被当作标准Unix shell---Bourne shell(以创建者的名字命名)的替代品.bash shell的名称就是针对Bourne shell的拼写所玩的一个文字游戏,称为Bourne again shell</small>

|shell|描述|
|---|---|
|ash|一种运行在内存受限环境中简单的轻量级shell,但与bash shell完全兼容|
|korn|一种与Bourne shell兼容的编程shell但支持如关联数组和浮点运算等一些高级的编程特性|
|tcsh|一种将C语言中的一些元素引入到shell脚本中的shell|
|zsh|一种结合了bash,tcsh和korn的特性同时提供高级编程特性共享历史文件和主题化提示符<br/>的高级shell|
