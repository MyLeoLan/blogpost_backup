---
title: CentOS上搭建PHP环境
categories:
  - 环境搭建
tags:
  - Centos PHP
abbrlink: 36733
date: 2016-11-02 12:21:24
---

在CentOS上搭建PHP服务器环境,可以使用一键自动部署环境的工具，请参见网友开发的这个工具LAMP，LNMP，LNAMP
**http://www.centos.bz/2013/08/ezhttp-tutorial/**
 
安装:

```
yum install httpd httpd-devel
yum install php php-devel
yum install php-mysql php-gd php-imap php-ldap php-odbc php-pear php-xml php-xmlrpc
yum install mysql mysql-server
/etc/init.d/mysqld start
/etc/init.d/httpd restart
```

此时可以在目录：/var/www/html/下建立一个PHP文件
代码：

`<?php phpinfo(); ?>`

然后访问这个文件，就能看到PHP的一些信息，php.ini配置文件的路径可以在这个页面上看到

 
**测试mysql是否链接成功的php代码**

```php
<?php
$con = mysql_connect("10.0.@.@@","@@","@@");
if (!$con)
  {
  die('Could not connect: ' . mysql_error());
  }
 
mysql_select_db("mydb", $con);
 
$result = mysql_query("SELECT * FROM sys_user");
 
while($row = mysql_fetch_array($result))
  {
  echo $row['UserName'] . " " . $row['PassWord'] . " " . $row['id'];
  echo "<br />";
  }
 
mysql_close($con);
?>
```

可以把上面的代码传入目录/var/www/html/
就可以看到执行情况



---
