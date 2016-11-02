---
layout: post
title: "OpenResty（高性能web服务器）"
categories:
- web服务器
tags:
- OpenResty
- 高性能web服务器


---

# OpenResty#

参考资料：

官方: http://openresty.org/
Github: https://github.com/agentzh/ngx_openresty      https://github.com/openresty/

视频学习：http://www.stuq.org/course/detail/1015

OpenResty最佳实践：https://moonbingbing.gitbooks.io/openresty-best-practices/content/ （https://github.com/moonbingbing/openresty-best-practices）

---

# 安装OpenResty #
默认安装路径如下

* /usr/local/openresty/

OpenResty，也被称为“ngx_openresty”，是一个基于Nginx的核心Web应用程序服务器，它包含了大量的第三方的Nginx模块和大部分系统依赖包。 OpenResty不是Nginx的分支，它只是一个软件包。主要有章亦春维护。
为什么是OpenResty？
OpenResty允许开发人员使用lua编程语言构建现有的Nginx的C模块，支持高流量的应用程序。

依赖的软件包：
> * perl 5.6.1+
> * libreadline
> * libpcre
> * libssl

Debian 和 Ubuntu系统：
```
apt-get install libreadline-dev libncurses5-dev libpcre3-dev libssl-dev perl make
```

Fedora 、RedHat 和 centos系统：
```
yum install readline-devel pcre-devel openssl-devel gc-c++ -y
```

下载OpenResty、解压、编译、安装：
版本选择：https://openresty.org/en/download.html
```
wget http://openresty.org/download/ngx_openresty-1.5.8.1.tar.gz
tar xzvf ngx_openresty-1.5.8.1.tar.gz
cd ngx_openresty-1.5.8.1/
./configure --with-luajit
make
make install
```
另外的配置选项：
```
./configure --prefix=/opt/openresty 
--with-luajit 
--without-http_redis2_module 
--with-http_iconv_module 
--with-http_postgres_module 
-j2
--help to see more options
```
此时安装完成，打开localhost就可以看到nginx页面了。

