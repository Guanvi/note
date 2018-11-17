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
