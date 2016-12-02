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

## **DMS6.0后无法用root登陆的问题**

shell登陆后输入 sudo -i，可切换root账号登陆（root账号密码同admin密码）
直接输入`chmod 7777 /etc/ssh/sshd_config`然后就可以修改这个文件了，把root登陆那一块被打上了注释符  “//”，删除即可。
![mark](http://ofyfogrgx.bkt.clouddn.com/blog/20161129/161120656.png)

---
## **DMS6.0后无法用迅雷远程下载（官方不支持了）**
安装Docker套件，搜索**xware**，安装yinheli/docker-thunder-xware；配置启动时端口什么的都不用管，设置好**挂载目录**就行了，要有**读写权限**！启动后看容器日志，
![mark](http://ofyfogrgx.bkt.clouddn.com/blog/20161129/161802732.png)
在迅雷远程下载官网登录账号绑定即可。

---
## **虚拟机U盘启动无法挂载问题**
虚拟机U盘启动有两种，一种是直接U盘连接进虚拟机并设置可移动磁盘启动（前提是虚拟机能正常识别到你的U盘）；另一种是对于虚拟机无法识别到U盘的情况，就只能在虚拟机中添加硬盘，在创建新硬盘时有个使用物理磁盘选项，选择它，之后选择物理磁盘时一般最后一个就是你的U盘，最后确定后能看到U盘容量；开机启动提示：![mark](http://ofyfogrgx.bkt.clouddn.com/blog/20161202/122419252.png)
勾选独立，永久模式，即可解决问题。
![mark](http://ofyfogrgx.bkt.clouddn.com/blog/20161202/122615977.png)

---
## 硬盘分区模式 RAID、SHR、BASIC
SATA接口数量不多，挂的硬盘不多，但不想RAID的（RAID0不安全，RAID1太浪费，自带的SHR混合模式对数据恢复不利），建议用BASIC方式，一个新硬盘怎么也得3-5年才会出现坏道，用BASIC方式创建ext4或btrfs分区，对于更换硬盘特别方便挂载在其他系统下转移数据。组RAID0的目的在于合并容量和提升速度，一般大于2T家用级以上的的硬盘，读写速度都有100M左右，千兆网口速度也差不多，瓶颈不在硬盘上。
**群晖双盘位机器SHR、RAID1阵列模式拆分、降级为BASIC教程**参考：
https://www.chiphell.com/thread-1392816-1-1.html
http://support-cn.synology.me/wordpress/?p=589

官网容量计算器：[RAID 容量计算器](https://www.synology.com/zh-cn/support/RAID_calculator)

---
## 群晖绑定自己的域名
方法有很多，可以在DDNS里设置花生壳、万网账号等。

[用NAT123做无公网IP的远程连接](http://post.smzdm.com/p/306444/)


---
# 黑群晖
一般都是黑群晖的型号都为DS3615xs(高配置)，这样才能适应不同硬件环境。在虚拟机中安装可以设置硬件，很容易洗白；一般家用都是用低配机子安装，这里主要是实体机安装。

如果是虚拟机安装可以用VMware、EXSI、Virtual（[VirtualDSM](https://www.synology.com/zh-cn/support/download/VirtualDSM)）或者Docker（[Docker版的群晖](https://www.synology.com/zh-cn/support/download/DockerDSM)）

黑群晖中**引导**是很重要的。
引导有Nanoboot、gnoboot和XPEnoboot（xpenology）建议用XPEnoboot，支持的主板多，更新快。

**黑群晖所需工具下载**：
引导下载：[xpenology](http://xpenology.me/downloads/)  
写U盘引导工具：[win32diskimager](http://sourceforge.net/projects/win32diskimager/files/latest/download)或[Roadkil DiskImage](http://ofyfogrgx.bkt.clouddn.com/blog/20161202/104059350.exe)
代码编辑工具：[Notepad++](https://notepad-plus-plus.org/download/v7.2.2.html)或[sublimetext](http://www.sublimetext.com/3)
启动测试：[Qemu启动测试器](http://ofyfogrgx.bkt.clouddn.com/blog/20161202/105826397.exe)


---
## 黑群晖DSM_5.2
引导下载：[xpenology官网](http://xpenology.me/downloads/)
5.2_5592是比较新的版本，也相对稳定一些，5.2_5644和[5.2_5967](http://source.wifihell.com/8-NAS-BUFFALO/ts5000/DSM5.2-5967/)也是可以的。
用写U盘引导工具，把下载的img镜像文件用工具写进U盘中（U盘数据全无，做好备份），写好后重插U盘，U盘空间显示很小，其他空间被屏蔽掉了。用**Qemu启动测试器**测试一下能否启动，正常就插入主机设置U盘启动（事先没有设置好的要接显示器）。

官网下载DSM系统：[DS3615xs](https://www.synology.com/zh-cn/support/download/DS3615xs)下载PAT文件。

**开始安装：**
如果局域网内只有少量待安装的机子直接浏览器输入：**http://find.synology.com** 即可直接跳转到安装界面（对于黑群晖，用的sn码如果网上有人使用了，可能看到的是别人的机子）。如果你知道机子分配的IP地址也可以输入：**http://IP:5000**

当然也可以用群晖官方的管理工具：**群晖助手Synology Assistant**
[windows](https://global.download.synology.com/download/Tools/Assistant/6.0-7319/Windows/SynologyAssistantSetup-6.0-7319.exe)
[mac](https://global.download.synology.com/download/Tools/Assistant/6.0-7319/Mac/Synology-Assistant-6.0-7319.dmg)
[Ubuntu](https://global.download.synology.com/download/Tools/Assistant/6.0-7319/Ubuntu/x86_64/synology-assistant_6.0-7319_amd64.deb)

---
## 黑群晖DSM_6.0
引导下载：[DS3615xs 6.0.2 Jun's Mod V1.01](http://ofyfogrgx.bkt.clouddn.com/DS3615xs%206.0.2%20Jun%27s%20Mod%20V1.01.zip)或[Jun's的网盘](http://source.wifihell.com/8-NAS-BUFFALO/ts5000/DSM6.02-v1.01/)
此压缩文件包含了img引导文件和VMware虚拟机配置文件（支持6.0.2_8451），虚拟机配置文件点开即可使用（自己设置网卡桥接并添加硬盘（设置为SATA接口），硬盘空间小于5G无法安装）。img镜像刻录到U盘后是**GPT+BIOS/UEFI**格式的分区，太老的主板可能无法识别到分区。

用写U盘引导工具，把下载的img镜像文件用工具写进U盘中（U盘数据全无，做好备份），写好后重插U盘，U盘空间显示很小，其他空间被屏蔽掉了。用**Qemu启动测试器**测试一下能否启动，正常就插入主机设置U盘启动（事先没有设置好的要接显示器）。

官网下载DSM系统：[DS3615xs](https://www.synology.com/zh-cn/support/download/DS3615xs)下载PAT文件。

**开始安装：**
如果局域网内只有少量待安装的机子直接浏览器输入：**http://find.synology.com** 即可直接跳转到安装界面（对于黑群晖，用的sn码如果网上有人使用了，可能看到的是别人的机子）。如果你知道机子分配的IP地址也可以输入：**http://IP:5000**

当然也可以用群晖官方的管理工具：**群晖助手Synology Assistant**
[windows](https://global.download.synology.com/download/Tools/Assistant/6.0-7319/Windows/SynologyAssistantSetup-6.0-7319.exe)  |  [mac](https://global.download.synology.com/download/Tools/Assistant/6.0-7319/Mac/Synology-Assistant-6.0-7319.dmg)  |  [Ubuntu](https://global.download.synology.com/download/Tools/Assistant/6.0-7319/Ubuntu/x86_64/synology-assistant_6.0-7319_amd64.deb)

新的6.0设定好mac,sn,vid,pid和老的5.2系统一样的话，可以无损数据直接从5.2升级到6.0；个人不建议，有时会出现数据升天的情况。那就有的玩咯，建议全新安装。附升级教程原文：[Migrate from DSM 5.2 to 6.0 - Baremetal](http://xpenology.com/forum/viewtopic.php?f=2&t=22100)

---
## 洗白
### 修改引导U盘syslinux.cfg文件
把U盘插入电脑，查看VID和PID
**linux**：命令行输入`lsusb`
![mark](http://ofyfogrgx.bkt.clouddn.com/blog/20161129/151859616.png)

**mac**：终端输入`system_profiler SPUSBDataType`
![mark](http://ofyfogrgx.bkt.clouddn.com/blog/20161129/152000090.png)

**windows**:在设备管理器的属性中，或用什么芯片无忧、芯片精灵等工具都可以看得到。

**SN生成并计算Mac**
1.[群晖所有型号官方SN和MAC生成器(在线版，需翻墙)](https://onedrive.live.com/view.aspx?resid=AFD1164BAADDF81C!168&ithint=file%2cxlsm&app=Excel&authkey=!AAQuOGpVwRe7bu8)
2.[群晖所有型号官方SN和MAC生成器下载](http://ofyfogrgx.bkt.clouddn.com/blog/20161202/110736454.xlsm)
Exelc打开后启用宏，选择型号后**在空白地方双击生成SN**，记录下来，底部选项卡选择Mac**已经计算出对应了SN的Mac**了，也记录下来备用。


在U盘根目录下有个**syslinux.cfg**文件（如果是6.0版本则修改grub下的**grub.cfg**文件），修改该文件的sn、vid、pid、mac的值，三处都要修改,mac1在群晖硬件版本DS3615xs之后，在sn前面，如果多网卡再加上mac2...别忘了空格是整行的没有换行，是编辑器显示区域不够了。
类似于这样：
![mark](http://ofyfogrgx.bkt.clouddn.com/blog/20161202/111813709.png)
改好后插回机子中启动系统，顺利的话在DSM中看不到此U盘外接设备了，在群晖助手中的MAC和序列号也是对应设定的，这时**Quickconnect ID**已经可以正常使用了。
![](http://ofyfogrgx.bkt.clouddn.com/blog/20161202/120106459.png)

6.0.x系统在升级过程中，不管是在线升级，还是手动上传pat档，均提示pat损毁，升级失败的问题。修改U盘**grub.cfg**文件中**SataPortMap=x**的值（这是指主板原生SATA接口数，主板固件总线中已经定义了，而不是通过外设方式集成的），默认为1 改成**SataPortMap=2**试试。可以搜索主板厂商去核实主板原生的SATA口的个数，也就是 x 的值，自己对应更改，错误的值可能启动不了系统的。

---

如果要设置网卡远程唤醒（当然路由已经设置了5000端口转发）要刷网卡MAC**（不建议这么做，这里只提供方法，不提供工具，由此造成的任何问题，本人不负责。）**根据网卡型号的不同方法不同，一般有通用的MSDOS工具刷，用软碟通制作MSDOS启动U盘并把MAC刷写工具拷到U盘根目录，插上黑群晖主机启动到DOS，进入U盘根目录命令行刷写MAC（先备份网卡BIOS），一般刷网卡MAC只需要改前面六位就行了(改为00:11:32)，后面的保持原来的不变。刷好后远程唤醒功能就正常使用了。如果没刷成功很可能网卡就废了（用备份的BIOS恢复）。

**启动盘与系统盘集成**可参考：[洗白+启动盘与系统盘集成](http://www.xxxxxbbs.com/thread/95147.html)

---
### 修改synoinfo.conf（高级定制系统，不建议这么做，除非你是极客）
**synoinfo.conf文件是整个群晖系统的主要配置文件，几乎所有的网络端口、主板接口、系统功能都在这里设定。配置错误将导致系统崩溃，请谨慎修改。**

---
#### 修改SATA、eSATA
开启DSM系统的终端登录功能，自己用shell工具连接群晖主机，账号密码是群晖系统中的用户和密码。
用admin账户登陆，编辑`vim /etc.defaults/synoinfo.conf`文件。
![mark](http://ofyfogrgx.bkt.clouddn.com/blog/20161129/154631465.png)

* 修改指定的SATA口为eSATA口，这样原来装有资料的硬盘就不用格式化，作为eSATA外接硬盘接入，群晖中SATA设备是不支持NTFS格式的。
修改**esataportcfg**和**internalportcfg**对应的16进制的值。
![mark](http://ofyfogrgx.bkt.clouddn.com/blog/20161129/154246686.PNG)
1-12代表1-12号SATA接口，用作群晖系统盘的那个接口必须是SATA接口，必须由群晖系统来初始化硬盘（数据提前做好备份）

---
#### 修改网络端口
* 可以修改默认的管理端口**admin_port="5000"**；及各种端口修改，一般不建议随便修改（部分端口在DSM系统中可以修改）。


---
