---
title: 搭建shadowsocks服务器
categories:
  - 环境搭建
tags:
  - 搭建shadowsocks服务器
  - 搭梯子
abbrlink: 13905
date: 2016-11-21 16:50:39
---


目前 shadowsocks 服务已经受到了影响，不过部署在 25 端口目前还可用。

shadowsocks 客户端会在本地开启一个 socks5 代理，通过此代理的网络访问请求由客户端发送至服务端，服务端发出请求，收到响应数据后再发回客户端。
因此使用 shadowsocks 需要一台墙外的服务器来部署 shadowsocks 服务端。

主流的 VPS（虚拟主机）服务器提供商有三家：

linode
digital ocean
bandwagon（搬瓦工）
下面的比上面的便宜。如果只是自用，bandwagon 足够。

一般使用 paypal 绑定一个 visa 或 mastercard 信用卡来付款。注意要用国际 paypal 帐号，国内的是不能用外币付款的。

# 服务端
## 安装 shadowsocks

### Debian/Ubuntu:
```
apt-get install python-pip
pip install shadowsocks ```
如果遇到第一个命令安装 python-pip 时找不到包的情况。pip 官方给出了一个安装脚本，可以自动安装 pip。先下载脚本，然后执行即可：
```
wget https://bootstrap.pypa.io/get-pip.py python get-pip.py ```

### CentOS
```
yum install python-setuptools && easy_install pip
pip install shadowsocks ```

### 源码编译
```
git clone https://github.com/madeye/shadowsocks-libev.git```

进入目录编译安装
```
cd shadowsocks-libev
./configure --prefix=/usr
make && make install```

配置服务及配置文件
```
mkdir -p /etc/shadowsocks-libev
cp ./debian/shadowsocks-libev.init /etc/init.d/shadowsocks-libev
cp ./debian/shadowsocks-libev.default /etc/default/shadowsocks-libev
cp ./debian/config.json /etc/shadowsocks-libev/config.json
chmod +x /etc/init.d/shadowsocks-libev```

配置shadowsocks配置文件
`vi /etc/shadowsocks-libev/config.json`
```
{
          "server":"vps的ip",
          "server_port":8388,   #服务器端口，与SSH端口不一样
          "local_port":1080,
          "password":"barfoo!", #认证密码
          "timeout":60,
          "method":"aes-256-cfb" #加密方式，推荐使用aes-256-cfb
}```

重启shadowsocks服务。
```
/etc/init.d/shadowsocks-libev stop
/etc/init.d/shadowsocks-libev start```



---
## 编写配置文件

shadowsocks 启动时的参数，如服务器端口，代理端口，登录密码等，可以通过启动时的**命令行参数**来设定，也可以通过** json 格式的配置文件设定**。推荐使用配置文件，方便查看和修改。

用 **vi 新建**一个配置文件：`vi /etc/shadowsocks.json `
然后输入如下内容：
```
{ 
   "server":"my_server_ip",       #服务器ip地址
   "server_port":25,              #绑定的端口，端口最好小于1024，注意不要设置已经使用了的端口
   "local_address": "127.0.0.1",  
   "local_port":1080, 
   "password":"mypassword",       #连接密码
    "timeout":300,                #超时时间（秒）
   "method":"aes-256-cfb",        #加密方法
   "fast_open": false }           #Linux 内核版本大于3.7，设置为true可降低延迟```

如果需要配置多个SS账号，可以按照如下案例进行配置：
```
{
"server":"your_server_ip",
"port_password":{
     "8381":"password1",
     "8382":"password2",
     "8383":"password3",
     "8384":"password4"
     },
"timeout":300,
"method":"rc4-md5",
"fast_open":false,
"workers":1
}```

## 启动 shadowsocks
启动 shadowsocks 服务器的命令如下：
```
ssserver -c /etc/shadowsocks.json           #启动服务
ssserver -c /etc/shadowsocks.json -d start  #后台启动服务
ssserver -c /etc/shadowsocks.json -d stop   #停止服务```

shadowsocks 的日志保存在:** /var/log/shadowsocks.log**
---
# 一键安装脚本
这里提供一键安装脚本
**Ubuntu、Debian**
[点我直接下载脚本文件](http://ofyfogrgx.bkt.clouddn.com/blog/20161121/172019083.sh)

安装中出现的选择界面，请一律选择YES，然后回车。
安装过程中脚本会提示输入server_port及password
server_port建议取小一些，如443,80等。
password自定
安装完成后有提示。
卸载：`name.sh uninstall`
更新：`name.sh update`更新其实是卸载了重装，配置不会丢失。
shadowsocks的配置文件位于：**/etc/shadowsocks-libev/config.json**可以编辑该文件从而修改密码、服务器端口及加密方式，修改之后记得保存重启。
```
/etc/init.d/shadowsocks-libev stop
/etc/init.d/shadowsocks-libev start```
脚本已加入开机自启。
```
#! /bin/bash
#===============================================================================================
#   System Required:  Debian or Ubuntu (32bit/64bit)
#   Description:  Install Shadowsocks(libev) for Debian or Ubuntu
#   Author: tennfy <admin@tennfy.com>
#   Intro:  http://www.tennfy.com
#===============================================================================================

clear
echo "#############################################################"
echo "# Install Shadowsocks(libev) for Debian or Ubuntu (32bit/64bit)"
echo "# Intro: http://www.tennfy.com"
echo "#"
echo "# Author: tennfy <admin@tennfy.com>"
echo "#"
echo "#############################################################"
echo ""

function check_sanity {
	# Do some sanity checking.
	if [ $(/usr/bin/id -u) != "0" ]
	then
		die 'Must be run by root user'
	fi

	if [ ! -f /etc/debian_version ]
	then
		die "Distribution is not supported"
	fi
}

function die {
	echo "ERROR: $1" > /dev/null 1>&2
	exit 1
}

############################### install function##################################
function install_shadowsocks_tennfy(){
cd $HOME

# install
apt-get update
apt-get install -y --force-yes build-essential autoconf libtool libssl-dev git curl asciidoc xmlto libpcre3 libpcre3-dev

#download source code
git clone https://github.com/madeye/shadowsocks-libev.git

#compile install
cd shadowsocks-libev
./configure --prefix=/usr
make && make install
mkdir -p /etc/shadowsocks-libev
cp ./debian/shadowsocks-libev.init /etc/init.d/shadowsocks-libev
cp ./debian/shadowsocks-libev.default /etc/default/shadowsocks-libev
chmod +x /etc/init.d/shadowsocks-libev

# Get IP address(Default No.1)
IP=`curl -s checkip.dyndns.com | cut -d' ' -f 6  | cut -d'<' -f 1`
if [ -z $IP ]; then
   IP=`curl -s ifconfig.me/ip`
fi

#config setting
echo "#############################################################"
echo "#"
echo "# Please input your shadowsocks server_port and password"
echo "#"
echo "#############################################################"
echo ""
echo "input server_port(443 is suggested):"
read serverport
echo "input password:"
read shadowsockspwd

# Config shadowsocks
cat > /etc/shadowsocks-libev/config.json<<-EOF
{
    "server":"${IP}",
    "server_port":${serverport},
    "local_port":1080,
    "password":"${shadowsockspwd}",
    "timeout":60,
    "method":"rc4-md5"
}
EOF

#restart
/etc/init.d/shadowsocks-libev start

#start with boot
update-rc.d shadowsocks-libev defaults

#install successfully
    echo ""
    echo "Congratulations, shadowsocks-libev install completed!"
    echo -e "Your Server IP: ${IP}"
    echo -e "Your Server Port: ${serverport}"
    echo -e "Your Password: ${shadowsockspwd}"
    echo -e "Your Local Port: 1080"
    echo -e "Your Encryption Method:rc4-md5"
}
############################### uninstall function##################################
function uninstall_shadowsocks_tennfy(){
#change the dir to shadowsocks-libev
cd $HOME
cd shadowsocks-libev

#stop shadowsocks-libev process
/etc/init.d/shadowsocks-libev stop

#uninstall shadowsocks-libev
make uninstall
make clean
cd ..
rm -rf shadowsocks-libev

# delete config file
rm -rf /etc/shadowsocks-libev

# delete shadowsocks-libev init file
rm -f /etc/init.d/shadowsocks-libev
rm -f /etc/default/shadowsocks-libev

#delete start with boot
update-rc.d -f shadowsocks-libev remove

echo "Shadowsocks-libev uninstall success!"

}

############################### update function##################################
function update_shadowsocks_tennfy(){
     uninstall_shadowsocks_tennfy
     install_shadowsocks_tennfy
	 echo "Shadowsocks-libev update success!"
}
############################### Initialization##################################
# Make sure only root can run our script
check_sanity

action=$1
[  -z $1 ] && action=install
case "$action" in
install)
    install_shadowsocks_tennfy
    ;;
uninstall)
    uninstall_shadowsocks_tennfy
    ;;
update)
    update_shadowsocks_tennfy
    ;;	
*)
    echo "Arguments error! [${action} ]"
    echo "Usage: `basename $0` {install|uninstall|update}"
    ;;
esac```

---
# 客户端
## 安装并启动 shadowsocks 客户端

shadowsocks 支持 windows、Mac OS X、Linux、Android、iOS 等多个平台。不过 iOS 由于系统对应用后台运行的限制，推荐使用客户端内嵌的浏览器科学上网，给其他应用代理时需要每过几分钟重新启动一下 app。

shadowsocks 项目 Github 主页在[这里](https://github.com/shadowsocks)。

里面可以找到客户端下载地址。

下载安装客户端以后，只需按服务器的配置填写 IP 地址、服务器端口、本地端口（如果没有本地端口选项，就是默认的 1080）、密码、加密方式等参数，启动就可以了。

客户端支持全局代理和 PAC 代理两种方式，后者会使用一个脚本来自动检查一个网站是否在需要代理的网站列表中，自动选择直接连接或代理连接。

PAC 列表可以在线更新，但是难免有收录不全的情况。这时可以选择关闭 shadowsocks 代理（实际上是取消对系统代理的配置，shadowsocks 客户端仍然保持工作），然后使用支持自定义规则的代理管理插件来实现自动切换代理，比如 switchyOmega。

## 使用 switchyOmega 实现自动切换代理

switchyOmega 是 chrome 浏览器上一个很好用的代理管理插件。它的前身 switchySharp 更有名。

chrome 应用商店本身需要翻墙才能访问，因此需要先在 shadowsocks 启动代理模式下下载安装，再关闭 shadowsocks 代理。

安装完毕后，右击 switchyOmega 图标，选择选项，进入 switchOmega 配置界面。

创建 shadowsocks 情景模式

新建一个情景模式，比如叫 SS，代理协议选择 socks5，代理地址为 127.0.0.1，端口 1080。

现在切换到 SS 情景模式就可以通过 shadowsocks 科学上网了。后面获取自动切换规则列表

设置自动切换模式

在设置界面选择自动切换模式，在 “切换规则” 中勾选“规则列表规则”，对应的情景模式选择刚刚新建的 SS。

然后在下面的规则列表地址中填写

https://autoproxy-gfwlist.googlecode.com/svn/trunk/gfwlist.txt

规则列表格式选择 AutoProxy。

然后点击立即更新情景模式， 更新完成后会有提示。

点击左侧的 “应用选项”。然后单击 switchyOmega 图标，选择自动切换，就可以在访问“不存在的网站” 时自动切换到 shadowsocks 代理了。

## 添加自定义规则

如果遇到某个国外网站无法直接连接或速度太慢时，可以单击 switchyOmega 图标，选择 “添加条件”，情景模式选择 SS，就可以了。

这时打开 switchyOmega 选项，在自动切换模式的切换规则中就可以看到刚刚添加的规则。可以在这里管理自定义的规则。

导入和导出 switchyOmega 设置

如果换了一台电脑，重新设置一遍 switchyOmega 就太麻烦了。可以在设置好的 switchyOmega 中导出设置文件，在另一个 chrome 浏览器中导入，就可以直接复制原来的设置了。

在 switchyOmega 选项的左侧点击 “导入 / 导出”，点击“生成备份文件” 即可生成 switchyOmega 设置备份。点击 “从备份文件恢复” 可以导入备份

---
