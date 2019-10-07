# Linux学习日志


----
- 安装VMware显示


`User interface initialization failed.  Exiting.  Check the log for details.`
- 解决办法


`dnf install ncurses-compat-libs`


- 查看安装的VMware

`vmware-installer -l`

- 卸载VMware

`vmware-installer --uninstall-product vmware-workstation`


- 解决MariaDB中文乱码问题 <br/>
 `vim /etc/my.cnf.d/mariadb-server.cnf` <br/>
在[mysqld]下面添加 <br/>
`character-set-server=utf8` <br/><br/>
 `vim /etc/mycnf.d/clients.cnf` <br/>
在[client]下面添加 <br/>
`character-set-server=utf8` <br/>

- gnome顶栏透明
 `安装Dynamic Top Bar并replace "global.screen" with "global.workspace_manager" in extension.js to get it running on 3.30`
