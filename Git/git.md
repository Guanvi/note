# Git

## Git配置文件

- 设置作者和email
   
`git clone --global user.name "username"`
`git clone --global user.email "xx@yy.com"`

> 如果为了设置一个版本库特定的名字和email地址,覆盖--global的设置,只需要省略`--global`标志

- 查看配置
   `git config -l`


- 查看工作区状态
   `git status`


- 使用git add
   `git add filename`
   > 如果文件是未追踪的,使用时候将会变成已追踪,如果文件是已追踪的,将会将其暂存


- 使用git rm
   `git rm filename`将会在版本库和工作目录中同事删除文件
   `git rm --cached`将会删除索引给中的文件并把它保存在工作目录中
   > 使用git rm --cached会把文件标记为未追踪的


- 使用git mv
   `git mv`可以将文件重命名

