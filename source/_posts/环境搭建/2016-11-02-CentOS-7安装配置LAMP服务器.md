---
title: CentOS 7安装配置LAMP服务器
categories:
  - 环境搭建
tags:
  - Centos7 lanm
abbrlink: 60501
date: 2016-11-02 12:21:52
---

# CentOS 7搭建LAMP环境(Apache+PHP+MariaDB)

在CentOS上搭建PHP服务器环境,可以使用一键自动部署环境的工具，请参见网友开发的这个工具LAMP，LNMP，LNAMP
**http://www.centos.bz/2013/08/ezhttp-tutorial/**
 
## 准备篇（可跳过此步）：
### 一、配置防火墙，开启80端口、3306端口
CentOS 7默认使用的是firewall作为防火墙，这里改为iptables防火墙。
#### 1、关闭firewall：
```
systemctl stop firewalld.service #停止firewall
systemctl disable firewalld.service #禁止firewall开机启动```
#### 2、安装iptables防火墙
```
yum install iptables-services #安装
vim /etc/sysconfig/iptables #编辑防火墙配置文件```
增加规则：
```
-A INPUT -m state --state NEW -m tcp -p tcp --dport 22 -j ACCEPT
-A INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j ACCEPT
-A INPUT -m state --state NEW -m tcp -p tcp --dport 3306 -j ACCEPT```
:wq! #保存退出
```
systemctl restart iptables #最后重启防火墙使配置生效
systemctl enable iptables #设置防火墙开机启动```
### 二、关闭SELINUX
```
vim /etc/selinux/config
#SELINUX=enforcing #注释掉
#SELINUXTYPE=targeted #注释掉
SELINUX=disabled #增加```
:wq! #保存退出
`setenforce 0` 使配置立即生效

---
## 安装篇：
一、安装MariaDB
CentOS 7.0中，已经使用MariaDB替代了MySQL数据库
#### 1、安装MariaDB
```
yum install mariadb mariadb-server -y
systemctl start mariadb #启动MariaDB```

`cp /usr/share/mysql/my-huge.cnf /etc/my.cnf` 拷贝配置文件（注意：如果/etc目录下面默认有一个my.cnf，直接覆盖即可）
#### 2、为root账户设置密码
`mysql_secure_installation`

* 回车，根据提示输入Y
* 输入2次密码，回车
* 根据提示一路输入Y
* 最后出现：Thanks for using MySQL!
* MariaDB密码设置完成，重新启动 MariaDB：
`systemctl restart mariadb` #重启MariaDB

#### 3、安装Apache和PHP
```
yum install http php php-mysql php-gd libjpeg* php-ldap php-odbc php-pear php-xml php-xmlrpc php-mbstring php-bcmath php-mhash -y
systemctl restart mariadb  #重启MariaDB
systemctl enable mariadb #设置开机启动
systemctl start httpd #启动apache
systemctl enable httpd #设置apache开机启动```

在客户端浏览器中打开服务器IP地址，会出现测试界面，说明apache安装成功

---
## 配置篇
### 一、Apache配置
`vim /etc/httpd/conf/httpd.conf` 编辑配置文件

* ServerSignature On  #添加，在错误页中显示Apache的版本，Off为不显示
* Options Indexes FollowSymLinks  #修改为：Options Includes ExecCGI FollowSymLinks（允许服务器执行CGI及SSI，禁止列出目录）
* #AddHandler cgi-script .cgi　取消注释（允许扩展名为.pl的CGI脚本运行）
* AllowOverride None　 #修改为：AllowOverride All （允许.htaccess）
* AddDefaultCharset UTF-8　#修改为：AddDefaultCharset GB2312　（添加GB2312为默认编码）
* #Options Indexes FollowSymLinks   #修改为 Options FollowSymLinks（不在浏览器上显示树状目录结构）
* DirectoryIndex index.html   #修改为：DirectoryIndex index.html index.htm
* Default.html Default.htmindex.php（设置默认首页文件，增加index.php）
* MaxKeepAliveRequests 500  #添加MaxKeepAliveRequests 500 （增加同时连接数）

:wq! #保存退出
`systemctl restart httpd`重启apache
`rm -f /etc/httpd/conf.d/welcome.conf /var/www/error/noindex.html` 删除默认测试页

---

### 二、php配置
`vim /etc/php.ini` 编辑配置文件

* date.timezone = PRC #把前面的分号去掉，改为date.timezone = PRC
* (这里列出了PHP禁用的函数，如果某些程序需要用到这个函数，可以删除，取消禁用。)
```
disable_functions = passthru,exec,system,chroot,scandir,chgrp,chown,shell_exec,proc_open,proc_get_status,ini_alter,ini_alter,ini_restore,dl,openlog,syslog,readlink,symlink,popepassthru,stream_socket_server,escapeshellcmd,dll,popen,disk_free_space,checkdnsrr,checkdnsrr,getservbyname,getservbyport,disk_total_space,posix_ctermid,posix_get_last_error,posix_getcwd, posix_getegid,posix_geteuid,posix_getgid, posix_getgrgid,posix_getgrnam,posix_getgroups,posix_getlogin,posix_getpgid,posix_getpgrp,posix_getpid, posix_getppid,posix_getpwnam,posix_getpwuid, posix_getrlimit, posix_getsid,posix_getuid,posix_isatty, posix_kill,posix_mkfifo,posix_setegid,posix_seteuid,posix_setgid, posix_setpgid,posix_setsid,posix_setuid,posix_strerror,posix_times,posix_ttyname,posix_uname 
```
* expose_php = Off #禁止显示php版本的信息
* short_open_tag = ON #支持php短标签
* open_basedir = .:/tmp/  (设置表示允许访问当前目录(即PHP脚本文件所在之目录)和/tmp/目录,可以防止php木马跨站,如果改了之后安装程序有问题(例如：织梦内容管理系统)，可以注销此行，或者直接写上程序的目录/data/www.osyunwei.com/:/tmp/)
* 
:wq! #保存退出
```
systemctl restart mariadb #重启MariaDB
systemctl restart httpd #重启apache```
测试篇
```cd /var/www/html
vim index.php #输入下面内容```
```php
<?php
phpinfo();
?>
```
:wq! #保存退出
在客户端浏览器输入服务器IP地址，可以看到相关的配置信息！

注意：apache默认的程序目录是**/var/www/html**
权限设置：`chown apache.apache -R /var/www/html`

参考：http://www.osyunwei.com/archives/7829.html

---