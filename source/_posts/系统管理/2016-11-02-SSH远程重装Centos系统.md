---
title: SSH远程重装Centos系统
categories:
  - 系统管理
tags:
  - ssh远程重装centos系统
date: 2016-11-02 16:29:28
---

#### 注意：
旧Linux系统必须能够正常ssh登录。旧Linux系统可以是任意Linux版本，现在的Linux用的一般都是grub引导管理器,新Linux系统必须是CentOS,RHEL或者Fedora，可以是32位或者64位。这几个Linux都支持VNC安装。


## 步骤如下： 
可以建一个内网镜像源，也可以不建立，用公网的源（建议用公网源，简单快捷）。
### 一.建一个内网的镜像源（如果使用在线源则跳过此步骤）
登录服务器 192.168.1.83 （用此服务器搭建内网源）
#### 1、安装apache 
```
yum install httpd 
mkdir /var/www/html/centos/6 -p ```
挂载iso镜像 
```
mount -o loop /opt/CentOS-6.6-x86_64-bin-DVD1.iso /var/www/html/centos/6 ```
启动apache，通过浏览器访问**http://192.168.1.83/centos/6** 看是否有内容
只有带**bin**字样的完整版光盘才有对应的启动内核，别的版本都不行

### 二.远程重装服务器 
#### 2、ssh登录要重装的服务器 
如果用在线源请按网易源的修改方法修改

```
mkdir /centos_install 
cd /centos_install 
wget http://192.168.1.83/centos/6/images/pxeboot/initrd.img 
wget http://192.168.1.83/centos/6/images/pxeboot/vmlinuz 
cp vmlinuz /boot/vmlinuz.cent.pxe 
cp initrd.img /boot/initrd.img.cent.pxe```

网址可用**网易源：http://mirrors.163.com/centos/6.8/os/x86_64/images/pxeboot/**代替       
centos 7目前还不支持pxe安装
```
cd /boot
wget http://mirrors.163.com/centos/6.8/os/x86_64/images/pxeboot/initrd.img
wget http://mirrors.163.com/centos/6.8/os/x86_64/images/pxeboot/vmlinuz
chmod 755 vmlinuz
chmod 600 initrd.img
```
启动文件是放在**/boot**下的，启动时以**/boot**为一级目录，所以注意**grub.conf**里的文件位置。
#### 3.修改grub 
`vim /boot/grub/grub.conf`   或者 `menu.lst`  也行，这两个文件是链接在一起的。
`default=0` 看情况修改，**default=0**表示默认启动**第一个标有title的项目**，**=1**为**第二个标有title**的项目，以此类推，直接把新增的放在最前面就不用修改**default=0**了。
增加：
```
title Centos Install (PXE) 
root (hd0,0) 
kernel /vmlinuz vnc vncpassword=123456 headless ip=192.168.1.106 netmask=255.225.255.0 gateway=192.168.1.1 dns=8.8.8.8 ksdevice=eth0 method=http://192.168.1.83/centos/6/或[http://mirrors.163.com/centos/6.8/os/x86_64/] lang=en_US或zh_CH.UTF-8 keymap=us 
initrd /initrd.img```
例：
```
title Centos Install (PXE) 
        root (hd0,0)
        kernel /vmlinuz vnc vncpassword=123456 headless ip=192.168.30.145 netmask=255.225.255.0 gateway=192.168.30.1 dns=8.8.8.8 ksdevice=eth0 method=http://mirrors.163.com/centos/6.8/os/x86_64/ lang=zh_CH.UTF-8 keymap=us
        initrd /initrd.img```
                  
保存退出   重启系统

* root用户参数，要和grub.conf中的其他root参数一致；
kernel参数和initrd参数后面的路径（是否/boot/开头）也要和grub.conf中的其他项一致；
* ip地址，子网掩码和网关地址一定要和服务器一致；
ksdevice是主网卡
* method后面的地址是新Linux系统的安装文件地址。如果这些配置有一项出错，就会导致远程安装失败。

#### 4、开始安装 
ping服务器ip，ping通时，打开vnc重新连接**IP:1**或**IP:5901**，开始安装centos
此时主机端显示

安装好后重启系统，**登陆用户，root 密码，静态IP**等不变。


---