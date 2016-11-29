---
title: 群晖DSM_Synology
categories:
  - NAS
tags:
  - 群晖DSM_Synology
abbrlink: 26301
date: 2016-11-29 14:04:23
---

# 群晖系统配置设置技巧

* **DMS6.0后无法用root登陆的问题**

shell登陆后输入 sudo -i，可切换root账号登陆（root账号密码同admin密码）
直接输入`chmod 7777 /etc/ssh/sshd_config`然后就可以修改这个文件了，把root登陆那一块被打上了注释符  “//”，删除即可。
![mark](http://ofyfogrgx.bkt.clouddn.com/blog/20161129/161120656.png)

---
* **DMS6.0后无法用迅雷远程下载（官方不支持了）**
安装Docker套件，搜索**xware**，安装yinheli/docker-thunder-xware；配置启动时端口什么的都不用管，设置好挂载目录就行了，要有读写权限！启动后看容器日志，
![mark](http://ofyfogrgx.bkt.clouddn.com/blog/20161129/161802732.png)
在迅雷远程下载官网登录账号绑定即可。

---
# 黑群晖
一般都是黑群晖的型号都为DS3615xs(高配置)，这样才能适应不同硬件环境。在虚拟机中安装可以设置硬件，很容易洗白；一般家用都是用低配机子安装，这里主要是实体机安装。

如果是虚拟机安装可以用VMware、EXSI、Virtual（[VirtualDSM](https://www.synology.com/zh-cn/support/download/VirtualDSM)）或者Docker（[Docker版的群晖](https://www.synology.com/zh-cn/support/download/DockerDSM)）

黑群晖中**引导**是很重要的。
引导有Nanoboot、gnoboot和XPEnoboot（xpenology）建议用XPEnoboot，支持的主板多，更新快。

---
## 黑群晖DSM_5.2
引导下载：[xpenology](http://xpenology.me/downloads/)

写U盘引导工具：[win32diskimager](http://sourceforge.net/projects/win32diskimager/files/latest/download)
把下载的img镜像文件用工具写进U盘中（U盘数据全无，做好备份），写好后重插U盘，U盘空间只显示100M左右，其他空间被屏蔽掉了。没有关系，插入主机设置U盘启动（事先没有设置好的要接显示器）。

官网下载DSM系统：[DS3615xs](https://www.synology.com/zh-cn/support/download/DS3615xs)

开始安装：
如果局域网内只有一台待安装的机子直接浏览器输入：**http://find.synology.com** 即可直接跳转到安装界面。如果你知道机子分配的IP地址也可以输入：**http://IP:5000**

当然也可以用群晖官方的管理工具：**群晖助手Synology Assistant**
[windows](https://global.download.synology.com/download/Tools/Assistant/6.0-7319/Windows/SynologyAssistantSetup-6.0-7319.exe)
[mac](https://global.download.synology.com/download/Tools/Assistant/6.0-7319/Mac/Synology-Assistant-6.0-7319.dmg)
[Ubuntu](https://global.download.synology.com/download/Tools/Assistant/6.0-7319/Ubuntu/x86_64/synology-assistant_6.0-7319_amd64.deb)

---
## 黑群晖DSM_6.0
引导下载：[DS3615xs 6.0.2 Jun's Mod V1.01](http://ofyfogrgx.bkt.clouddn.com/DS3615xs%206.0.2%20Jun%27s%20Mod%20V1.01.zip)
此压缩文件包含了img引导文件和VMware虚拟机配置文件，虚拟机配置文件点开即可使用（自己设置网卡桥接并添加硬盘（设置为SATA接口），硬盘空间小于5G无法安装）。

写U盘引导工具：[win32diskimager](http://sourceforge.net/projects/win32diskimager/files/latest/download)
把下载的img镜像文件用工具写进U盘中（U盘数据全无，做好备份），写好后重插U盘，U盘空间只显示100M左右，其他空间被屏蔽掉了。没有关系，插入主机设置U盘启动（事先没有设置好的要接显示器）。

官网下载DSM系统：[DS3615xs](https://www.synology.com/zh-cn/support/download/DS3615xs)下载PAT文件。

**开始安装：**
如果局域网内只有一台待安装的机子直接浏览器输入：**http://find.synology.com** 即可直接跳转到安装界面。如果你知道机子分配的IP地址也可以输入：**http://IP:5000**

当然也可以用群晖官方的管理工具：**群晖助手Synology Assistant**
[windows](https://global.download.synology.com/download/Tools/Assistant/6.0-7319/Windows/SynologyAssistantSetup-6.0-7319.exe)
[mac](https://global.download.synology.com/download/Tools/Assistant/6.0-7319/Mac/Synology-Assistant-6.0-7319.dmg)
[Ubuntu](https://global.download.synology.com/download/Tools/Assistant/6.0-7319/Ubuntu/x86_64/synology-assistant_6.0-7319_amd64.deb)


---
## 洗白
### 修改引导U盘
把U盘插入电脑，查看VID和PID
**linux**：命令行输入`lsusb`
![mark](http://ofyfogrgx.bkt.clouddn.com/blog/20161129/151859616.png)

**mac**：终端输入`system_profiler SPUSBDataType`
![mark](http://ofyfogrgx.bkt.clouddn.com/blog/20161129/152000090.png)

**windows**:在设备管理器的属性中，或用什么芯片无忧、芯片精灵等工具都可以看得到。

在U盘根目录下有个**syslinux.cfg**文件，修改该文件的sn、vid、pid、mac的值，三处都要修改。
类似于这样：
![mark](http://ofyfogrgx.bkt.clouddn.com/blog/20161129/153137911.png)
改好后插回机子中启动系统，顺利的话在DSM中看不到此U盘外接设备了，在群晖助手中的MAC和序列号也是对应设定的，网卡支持的话就可以远程唤醒了（当然路由已经设置了5000端口转发）

---
### 修改synoinfo.conf
开启DSM系统的终端登录功能，自己用shell工具连接群晖主机，账号密码是群晖系统中的用户和密码。
用admin账户登陆，编辑`vim /etc.defaults/synoinfo.conf`文件。
![mark](http://ofyfogrgx.bkt.clouddn.com/blog/20161129/154631465.png)

---
* 修改指定的SATA口为eSATA口，这样原来装有资料的硬盘就不用格式化，作为eSATA外接硬盘接入，群晖中SATA设备是不支持NTFS格式的。
修改**esataportcfg**和**internalportcfg**对应的16进制的值。
![mark](http://ofyfogrgx.bkt.clouddn.com/blog/20161129/154246686.PNG)
1-12代表1-12号SATA接口，用作群晖系统盘的那个接口必须是SATA接口，必须由群晖系统来初始化硬盘（数据提前做好备份）

---
* 可以修改默认的管理端口**admin_port="5000"**；及各种端口修改，一般不建议随便修改。

---
* quickconnect ID










---
