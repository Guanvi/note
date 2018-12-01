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


- 解决MariaDB中文乱码问题
```
vim /etc/my.cnf.d/mariadb-server.cnf
在[mysqld]下面添加
character-set-server=utf8
vim /etc/mycnf.d/clients.cnf
在[client]下面添加
vim /etc/mycnf.d/clients.cnf

```
