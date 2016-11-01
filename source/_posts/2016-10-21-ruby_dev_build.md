---
layout: post
title: "Ruby2.3.1安装"
categories:

---
# Ubuntu 16 #
安装ruby环境
`sudo apt-get install ruby ruby-dev`
检查ruby版本
`ruby -v`
`gem --version`
 irb     环境测试
irb(main):001:0> 3+5
=> 8
irb(main):002:0> puts "hello world!"
hello world!
irb(main):001:0>exit

---

# Centos #
`yum list ruby `看看yum仓库版本是多少，版本太低就源码安装。
```
yum install openssl* openssl-devel zlib-devel gcc gcc-c++ make autoconf readline-devel curl-devel expat-devel gettext-devel -y
```

关闭iptables和SELINUX（不关闭也是可以的）
```
service iptables stop
setenforce 0
vi /etc/sysconfig/selinux
SELINUX=disabled         #禁用selinux  
```
源码编译安装：
```
wget http://ftp.ruby-lang.org/pub/ruby/2.3/ruby-2.3.1.tar.gz
tar zxvf ruby-2.3.1.tar.gz
cd ruby-2.3.1
./configure --enable-shared --enable-pthread --prefix=/usr/local/ruby
make && make install
```
编译时如果报错如下：
ossl_pkey_ec.c:815: error: ‘EC_GROUP_new_curve_GF2m' undeclared (first use in this function)
需要安装补丁，也就是替换两个ssl库文件，以下为该补丁文件打包下载地址
详见：https://bugs.ruby-lang.org/projects/ruby-trunk/repository/revisions/41808
解决方法：
```
cd ruby-2.3.1
wget --no-check-certificate https://bugs.ruby-lang.org/projects/rubytrunk/repository/revisions/41808/raw/ext/openssl/ossl_pkey_ec.c
wget --no-check-certificate https://bugs.ruby-lang.org/projects/ruby-trunk/repository/revisions/41808/raw/test/openssl/test_pkey_ec.rb
mv ext/openssl/ossl_pkey_ec.c  ext/openssl/ossl_pkey_ec.c.bak
cp ossl_pkey_ec.c ext/openssl/
mv test/openssl/test_pkey_ec.rb test/openssl/test_pkey_ec.rb.bak
cp test_pkey_ec.rb  test/openssl/
```
重新编译：
`make && make install`

将ruby命令集加入系统环境变量
```
echo "PATH=$PATH:/usr/local/ruby/bin;export PATH" >> /etc/profile
source /etc/profile
```
检查ruby版本
`ruby -v`
`gem --version`
 irb     环境测试
irb(main):001:0> 3+5
=> 8
irb(main):002:0> puts "hello world!"
hello world!
irb(main):001:0>exit

---

# Mac10.12 #
mac在10.11之后的版本，安全机制发生了变更，/usr/local/目录已经没有写权限了。

* xcode升级到8.0及以上版本

不要用mac自带的ruby及brew方式安装ruby，容易出各种错误。
安装rvm（ruby的版本控制器）https://github.com/rvm/rvm
`curl -L https://get.rvm.io | bash -s stable --autolibs=enabled --ruby --rails --trace`
可能会有警告，有提示把某一句加入/Users/用户名/.bash_profile 中，重开终端。`rvm -v`显示版本，说明安装成功。

安装homebrew（官网http://brew.sh/index_zh-cn.html）https://github.com/Homebrew/homebrew
/usr/bin/ruby使用的是mac自带的2.0版本的ruby，也可以直接用ruby使用新版本的ruby。
```ruby
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" 
```
`brew -v`

列出ruby可安装的版本信息
`rvm list known`
安装一个ruby版本
`rvm install 2.3.1`
如果想设置为默认版本，可以用这条命令来完成
`rvm use 2.3.1 --default`     一般上一步安装好就已经设为默认了
查看已安装的ruby
`rvm list`
卸载一个已安装ruby版本
`rvm remove 2.3.1`
`ruby -v`
会发现版本号变成最新的啦！

检查ruby版本
`ruby -v`
`gem --version`
 irb     环境测试
irb(main):001:0> 3+5
=> 8
irb(main):002:0> puts "hello world!"
hello world!
irb(main):001:0>exit

安装各种扩展（可选）
rails：ruby web框架
`gem install rails`

---

# Windows #
直接到官网下载：
http://rubyinstaller.org/downloads 
http://www.ruby-lang.org/zh_cn/downloads/ （源码）
安装时勾选自动添加PATH，安装完成后重启生效。
也可以cmd运行 `set a = b` 然后重开cmd，环境变量就生效了。

---

# Ruby源 #
国外源如果屏蔽了，更改gem安装源到淘宝，每条命令都有成功提示
`gem update --system`     #升级gem版本
`gem uninstall rubygems-update`    #移除gem升级脚本
`gem sources --remove https://rubygems.org/`
`gem sources -a https://ruby.taobao.org/`
`gem sources -l`

* windows 不要更换源，添加不了淘宝源，就换回原来的源。

* Mac 如果报-SSL错误请把https改为http。
*** CURRENT SOURCES ***
http://ruby.taobao.org/




















