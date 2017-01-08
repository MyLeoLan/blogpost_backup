---
title: 群晖DSM_Synology
categories:
  - NAS
tags:
  - 群晖DSM_Synology
  - Aria2
  - 迅雷离线
  - opkg、ipkg、dpkg
  - Entware
  - shadowsocks
abbrlink: 26301
date: 2016-11-29 14:04:23
---

# 群晖
官网：https://www.synology.cn
开发者专区：https://www.synology.cn/zh-cn/support/developer
开源项目：https://sourceforge.net/u/synology/profile/
CPU信息查询：https://www.synology.com/en-global/knowledgebase/DSM/tutorial/General/What_kind_of_CPU_does_my_NAS_have
群晖中文论坛：https://forum.synology.com/cht/
群晖英文论坛（内容更全面）：https://forum.synology.com/enu/index.php

第三方套件地址：
http://www.gebi1.com/thread-84115-1-1.html?_dsign=b839635c
原文：http://xpenology.com/forum/viewtopic.php?f=2&t=2994

---
# 黑群晖
一般都是黑群晖的型号都为DS3615xs(高配置)，这样才能适应不同硬件环境。在虚拟机中安装可以设置硬件，很容易洗白；一般家用都是用低配机子安装，这里主要是实体机安装。

如果是虚拟机安装可以用VMware、EXSI、Virtual（[VirtualDSM](https://www.synology.com/zh-cn/support/download/VirtualDSM)）或者Docker（[Docker版的群晖](https://www.synology.com/zh-cn/support/download/DockerDSM)）

黑群晖中**引导**是很重要的。
引导有Nanoboot、gnoboot和XPEnoboot（xpenology）建议用XPEnoboot，支持的主板多，更新快。

## 黑群晖所需工具下载

引导下载：[xpenology](http://xpenology.me/downloads/)  
写U盘引导工具：[win32diskimager](http://sourceforge.net/projects/win32diskimager/files/latest/download)或[Roadkil DiskImage](http://ofyfogrgx.bkt.clouddn.com/blog/20161202/104059350.exe)
代码编辑工具：[Notepad++](https://notepad-plus-plus.org/download/v7.2.2.html)或[sublimetext](http://www.sublimetext.com/3)
启动测试：[Qemu启动测试器](http://ofyfogrgx.bkt.clouddn.com/blog/20161202/105826397.exe)


---
## 黑群晖DSM_5.2
引导下载：[xpenology官网](http://xpenology.me/downloads/)
5.2_5592是比较新的版本，也相对稳定一些，5.2_5644和[5.2_5967](http://source.wifihell.com/8-NAS-BUFFALO/ts5000/DSM5.2-5967/)也是可以的。
用写U盘引导工具，把下载的img镜像文件用工具写进U盘中（U盘数据全无，做好备份），写好后重插U盘，U盘空间显示很小，其他空间被屏蔽掉了。用**Qemu启动测试器**测试一下能否启动，正常就插入主机设置U盘启动（事先没有设置好的要接显示器）。

**选择机型是DS3615xs的**
官网下载DSM系统：[DS3615xs](https://www.synology.com/zh-cn/support/download/DS3615xs)下载PAT文件。
历史版本：http://cndl.synology.cn/download/DSM/release


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

**选择机型是DS3615xs的**
官网下载DSM系统：[DS3615xs](https://www.synology.com/zh-cn/support/download/DS3615xs)下载PAT文件。
历史版本：http://cndl.synology.cn/download/DSM/release


**开始安装：**
如果局域网内只有少量待安装的机子直接浏览器输入：**http://find.synology.com** 即可直接跳转到安装界面（对于黑群晖，用的sn码如果网上有人使用了，可能看到的是别人的机子）。如果你知道机子分配的IP地址也可以输入：**http://IP:5000**

当然也可以用群晖官方的管理工具：**群晖助手Synology Assistant**
[windows](https://global.download.synology.com/download/Tools/Assistant/6.0-7319/Windows/SynologyAssistantSetup-6.0-7319.exe)  |  [mac](https://global.download.synology.com/download/Tools/Assistant/6.0-7319/Mac/Synology-Assistant-6.0-7319.dmg)  |  [Ubuntu](https://global.download.synology.com/download/Tools/Assistant/6.0-7319/Ubuntu/x86_64/synology-assistant_6.0-7319_amd64.deb)

新的6.0设定好mac,sn,vid,pid和老的5.2系统一样的话，可以无损数据直接从5.2升级到6.0；个人不建议，有时会出现数据升天的情况。那就有的玩咯，建议全新安装。附升级教程原文：[Migrate from DSM 5.2 to 6.0 - Baremetal](http://xpenology.com/forum/viewtopic.php?f=2&t=22100)

---

---
# 配置设置技巧
**以下软硬件配置都是本人实验过的，确实可行，偶尔经常断线，不稳定，报错等，首先检查是不是用的大天朝的长城宽带，如果是，那么恭喜你，很可能是NAT3，连DDNS都没法用，更别说其他什么服务了，鼓励你去申请IP；另外检查你的路由是不是那种多登陆几次就打不开路由管理界面的那种路由，例如K1、K2、newifi（官方固件）等换路由，果断或其他路由测试你就明白了**

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
用admin账户登陆，编辑`vi /etc.defaults/synoinfo.conf`文件。
![mark](http://ofyfogrgx.bkt.clouddn.com/blog/20161129/154631465.png)

* 修改指定的SATA口为eSATA口，这样原来装有资料的硬盘就不用格式化，作为eSATA外接硬盘接入，群晖中SATA设备是不支持NTFS格式的。
修改**esataportcfg**和**internalportcfg**对应的16进制的值，**esataportcfg**值不够位数就写最后三位；**internalportcfg**值要写全。
![mark](http://ofyfogrgx.bkt.clouddn.com/blog/20161129/154246686.PNG)
1-12代表1-12号SATA接口，用作群晖系统盘的那个接口必须是SATA接口，必须由群晖系统来初始化硬盘（数据提前做好备份）
参考：http://www.7po.com/thread-456016-1-1.html

---
#### 修改网络端口
* 可以修改默认的管理端口**admin_port="5000"**；及各种端口修改，一般不建议随便修改（部分端口在DSM系统中可以修改）。

---

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
## 硬盘分区模式 RAID、SHR、BASIC、JBOD
SATA接口数量不多，挂的硬盘不多，但不想RAID的（RAID0不安全，RAID1太浪费，自带的SHR混合模式数据恢复麻烦一点；JBOD是类似SHR的软阵列模式，没用过，不评论），建议用BASIC方式(硬盘挂久了就知道原因了)，一个新硬盘怎么也得3-5年才会出现坏道，用BASIC方式创建ext4或btrfs分区，对于更换硬盘特别方便挂载在其他系统下转移数据。组RAID0的目的在于合并容量和提升速度，一般大于2T家用级以上的的硬盘，读写速度都有100M左右，千兆网口速度也差不多，瓶颈不在硬盘上。
**群晖双盘位机器SHR、RAID1阵列模式拆分、降级为BASIC教程**参考：
https://www.chiphell.com/thread-1392816-1-1.html
http://support-cn.synology.me/wordpress/?p=589

官网容量计算器：[RAID 容量计算器](https://www.synology.com/zh-cn/support/RAID_calculator)

---
## 硬盘数据恢复
当系统或硬盘出现问题导致无法启动时，可以恢复数据，当时心疼数据，折腾了2天终于找到办法了，原谅我忘记截图了。后来换硬盘了，补上
![mark](http://ofyfogrgx.bkt.clouddn.com/blog/20161229/083143984.png)
![mark](http://ofyfogrgx.bkt.clouddn.com/blog/20161229/083232912.png)

**重要：**群晖在初次安装系统时，不管有几块硬盘，则默认且必须有一块硬盘是SHR阵列，这样在之后添加的硬盘不管选用何种模式，分区都为RAID类型；恢复数据有以下**三种方法**

### 克隆DSM系统分区
这种方法对于喜欢装系统的朋友来说很好理解，群晖DSM是在每个硬盘之前分了三个分区（第一个空闲，第二个系统分区，第三个SWAP分区），之后第四个分区开始才是存储数据的，这也是为什么拔掉任何一块硬盘，系统也不会崩溃的原因（因为其他硬盘上还是有DSM系统的）。
那么我们只要克隆系统分区就行了，注意**GPT分区格式的硬盘只能克隆到GPT分区上，MBR的也同理**，混刻是启动不了系统的，但是可以插入正常运行的DSM系统（有SHR阵列）中恢复（会自动挂载，就要要等10分钟左右）这样也比装Ubuntu恢复省了不少时间。

---
### 群晖系统内恢复
**适用于：BASIC、SHR等等**
随便一块能正常启动群晖的硬盘，就是SHR阵列，带有系统的那个硬盘（就是所谓的“必须有一块硬盘是SHR阵列”），没有这种硬盘可以随便找一块没有存数据的硬盘安装群晖或用别的群晖机子初始化并建立SHR阵列。

完成后，用该硬盘启动群晖系统，启动后把要恢复数据的硬盘连接主机，DSM检测到硬盘显示为未初始化，不用管，就这样等上10分钟左右就会自动挂载（这时文件管理器里可以看到数据了），这时DSM是橙色报警，显示无法访问该硬盘的系统分区，只要点修复就行啦（怕丢失数据的先不要点，在文件管理器中先备份或转移资料），数据是无损的，但还是强烈建议备份（例如扇区复制）

---
### 安装Ubuntu进行恢复
**适用于：SHR、RAID0、RAID1、JDOB等等阵列（`fdisk -l`显示有RAID字样的）**

**下载Ubuntu镜像：**http://www.ubuntu.com/download/desktop
制作U盘启动或虚拟机什么的都行，能进入系统就行，注意考虑恢复数据的速度及时间，这就决定了多长时间内要稳定运行，要是U盘启动用live模式，恢复时突然崩溃就白玩了。
```
sudo -i
apt-get update
apt-get install lvm2
apt-get install mdadm```
安装mdadm的时候如果是Ubuntu14的选No configuration 来完成安装。
Ubuntu16的不会有这个选择窗口，默认就行。
![mark](http://ofyfogrgx.bkt.clouddn.com/blog/20161228/111920349.png)
安装完成后运行：`mdadm -Asf && vgchange -ay`
可能会报错，不用管，打开文件管理器就能看到了

参考：[还原存储在 DiskStation 中的数据](https://www.synology.cn/zh-cn/knowledgebase/faq/579)



---
## 群晖绑定自己的域名
方法有很多，可以在DDNS里设置花生壳、万网账号、用已备案的域名跳转到quickconnectID等等。

[用NAT123做无公网IP的远程连接](http://post.smzdm.com/p/306444/)

---
## 永久屏蔽黑群晖升级或去除更新提示
### 替换图形文件（法1）
用WinSCP使用root权限登录到群辉。
定位到**/usr/syno/synoman/synoSDSjslib/images**目录。
下载文件：http://ofyfogrgx.bkt.clouddn.com/blog/20161222/105033516.zip
替换该目录下的**dsm5_badge_num.png**和**dsm5_notification_num.png**文件

---
### 修改VERSION文件（法2）
开启群晖系统的终端SSH功能，用任意ssh工具连接，账号密码是群晖系统的管理员账号和密码，连接进入系统sshell后；输入`su`(5.2及以下版本的系统)；`sudo -i`(6.0及以上版本的系统)后输入密码，进行提权（#号开头拥有root权限）
![mark](http://ofyfogrgx.bkt.clouddn.com/blog/20161222/090936723.png)
```
cd /etc.defaults/
vi VERSION```
文件内容是类似下面这样子的
进官网查参数：https://www.synology.cn/zh-cn/releaseNote/DS3615xs
经群晖系统升级界面看看可升级的最新版本是多少？最好不要跨大版本。
![mark](http://ofyfogrgx.bkt.clouddn.com/blog/20161222/101644792.png)

![mark](http://ofyfogrgx.bkt.clouddn.com/blog/20161222/101602040.png)
```
majorversion="5"        #大版本号
minorversion="2"         #小版本
buildphase="hotfix"
buildnumber="5967"       #细分版本号
smallfixnumber="2"       #Update版本号，这是是DSM 5.2-5967 Update 2
builddate="2016/07/27"   #版本时间
buildtime="17:15:53"
```
`:wq`或`ZZ`保存退出vi编辑器。

实际上我的是5.2_5592的，但目前5.2最新的是5.2-5967 Update 2就更改为此版本，这样就会显示为最新版本了。不要改为远大于官方的版本，比如10.1_9999之类的，会出现所有套件无法安装的情况。

---
### 一行代码搞定（法3）
`vi /usr/syno/synoman/synoSDSjslib/sds-default.css`
按`shift+$`跳到行尾，增加以下这行代码，同一行，不要换行。

```
.sds-application-notify-badge-num{display:none !important;}
```
保存退出，刷新一下网页桌面的控制面板就不会显示小角标了（所有提示都不显示小角标了，所以不建议此法），不过设置中还是会显示的。

---
## DDNS设置3322
DSM6.0后的DDNS没[3322.org](http://www.pubyun.com/)了。
在自定义中添加以下代码就行啦！
```
http://members.3322.net/dyndns/update?system=dyndns&hostname=__HOSTNAME__```
![mark](http://ofyfogrgx.bkt.clouddn.com/blog/20161222/141001114.png)
之后新建就嫩刚看到3322了。

---
## SVN 和 Git
SVN的话直接安装套件，设置用户，设置仓库名就可以正常使用了。

### 创建git仓库
Git的话先安装git server套件
进入**“控制面板”“用户账户”**，然后新增一个用户，当然也可以用现用账户（如果单独增加的是git用户，最好修改用户和用户组的权限，其他任何权限什么都没有，不能登陆，不能同步文件，不能ssh登陆等等，普通用户因为要用这些功能就不用改了），然后再git server中对应用户打钩，允许访问。群晖的用户改权限可以用图形化界面，当然也可以用命令行，参考：[自己搭建Git服务器](https://www.leolan.top/posts/41310/)

接着开启群晖的ssh功能，用root或admin管理员账户登录shell。

```
cd /volume1     #硬盘挂载点一般是/volume1或者/volume2，你可以通过 ls /来查看
mkdir git       #在硬盘中创建一个git目录，我们会把所有的git repos放在这里
cd git
git init --bare testgit.git         #初始化一个版本库，并创建一个testgit.git项目仓库
chown -R leolan:users testgit.git   
# 格式【用户名:用户组】让git用户对这个板块库目录拥有可执行的权限，否则push的时候，是没有权限写入文件的```
服务端就OK了，接下来本地电脑克隆下来。
```
git clone ssh://leolan@192.168.0.58/volume1/git/testgit.git          
# ssh://协议可能会提示某些错误，可以先不要理会，只要能克隆下来就可以了。
#如果不克隆，可以在本地创建文件夹，绑定ssh://leolan@192.168.0.58/volume1/git/testgit.git源即可。
#在windows上通过git客户端克隆时，要勾选克隆空项目的一个选项。

cd testgit.git
git remote -v     #查看项目的远程仓库地址
git config --global user.name "leolan"            #绑定用户名
git config --global user.email 842632422@qq.com   #设置邮箱
echo "hello Git" >> hello.txt
git add . && git commit -m "first push" && git push
#如果正常提交不报错就可以使用啦，如果报错了再看具体内容，解决。
```

以后新建仓库时
```
cd /volume1/git/
git init --bare newgit.git  #创建新的仓库并初始化（初始化会清除该项目的所有数据）
#如果已有目录或需要重新初始化则进入目录执行：git init --bare 命令
```
接着克隆下来，和上面的步骤是一样的。

### 免密钥登录
```
cat ~/.ssh/id_rsa.pub  #查看本地的ssh密钥，copy备用```

```
mkdir /volume1/homes/leolan/.ssh
cd /volume1/homes/leolan/.ssh/
vi authorized_keys
#粘贴上一步copy的ssh密钥，一行一个
chown -R leolan:users /volume1/homes/leolan/.ssh
chmod 644 /volume1/homes/leolan/.ssh/authorized_keys
```

编辑ssh配置文件`vim /etc/ssh/sshd_config`
```
RSAAuthentication yes     
PubkeyAuthentication yes     
AuthorizedKeysFile  .ssh/authorized_keys
```
![mark](http://ofyfogrgx.bkt.clouddn.com/blog/20161222/171554297.png)
然后在群晖系统中停用ssh功能，再次开启。就能免密钥操作啦！

---
## VPN
群晖的VPN服务是安装套件的，简单设置就行
但是群晖连接别的VPN并不是在套件中设置的，而是在网络中设置
![mark](http://ofyfogrgx.bkt.clouddn.com/blog/20161227/164348644.png)
填写IP，账号密码就行，其他不知道的参数默认就行。

---
## shadowsocks
群晖DSM是基于Debain定制的系统，但是移除了apt包管理程序，只支持dpkg安装包，但是我们可以通过第三方软件安装插件的形式来安装说需要的软件。

连接SS本来是路由上设置是比较方便的，但某些路由不支持SS，所以用群晖连接SS，再把代理地址指向群晖的地址。

### pip安装SS
**此篇未完成，结尾运行报RuntimeError: can not find library crypto错误，目前还没有找到解决方法，有知道怎么解决的朋友欢迎留言**

首先通过套件中心安装python及python3
开启SSH服务。并通过SSH连入NAS
```
su         #DSM5.x
或 
sudo -i    #DSM6.x

cd /tmp​
​wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py
pip install shadowsocks
pip install crypto
​cd /etc/
vi shadowsocks.json```
内容如下：配置文件参考：[编写配置文件](www.leolan.top/posts/13905)
```
{ 
"server":"远程的SS服务器地址", 
"server_port":8388,            #远程SS服务器的服务端口
"local_address": "127.0.0.1", 
"local_port":1080,             #端口随意，不要冲突就行，默认1080
"password":"mypassword",       #SS密码
"timeout":300, 
"method":"aes-256-cfb",        #加密方式
"fast_open": false             #FS加速
}```

退出保存并运行服务
```
sslocal -c /etc/shadowsocks.json -d start```

设置开机自启
```
vi /etc/rc
#光标移动到最底下，在exit 0 之前添加以下这一句，保存退出。
sslocal -c /etc/shadowsocks.json -d start```

添加开机自启也可以通过计划任务添加，只是麻烦一点
![mark](http://ofyfogrgx.bkt.clouddn.com/blog/20161227/163522654.png)

---
### Docker安装SS
Docker安装也是可行的，直接下载安装，一定要看镜像说明，不同的作者定义的端口不同，打开看了才知道端口是什么。
![mark](http://ofyfogrgx.bkt.clouddn.com/blog/20161227/163803852.png)
![mark](http://ofyfogrgx.bkt.clouddn.com/blog/20161227/164015157.png)
这里的端口是1984，运行Docker容器后，代理的端口,设置1984就OK了（当然，1984只是容器端口，真正的端口取决于你映射出来的端口）

---
### shadowsocks-libev(C语言版)
**这节内容摘录网文，只提供思路，本人没有进行测试，有需求测试后会改写内容并删除此段文字**

> 先要在 [群晖开源项目(Synology Open Source Project)](https://sourceforge.net/projects/dsgpl/files/) 找到 DS216Play 的交叉编译工具：monaco-gcc493_glibc220_hard-GPL.txz
然后 SSH 连接 VPS 进行编译工作:
```
apt-get -y install make binutils
mkdir ss
cd ss
wget http://iweb.dl.sourceforge.net/project/dsgpl/DSM%206.0%20Tool%20Chains/STMicroelectronics%20Monaco%20Linux%203.10.77/monaco-gcc493_glibc220_hard-GPL.txz
tar xvf monaco-gcc493_glibc220_hard-GPL.txz
export PATH="/root/ss/arm-unknown-linux-gnueabi/bin:$PATH"
export CC=/root/ss/arm-unknown-linux-gnueabi/bin/arm-unknown-linux-gnueabi-gcc
export LD=/root/ss/arm-unknown-linux-gnueabi/bin/arm-unknown-linux-gnueabi-ld
export RANLIB=/root/ss/arm-unknown-linux-gnueabi/bin/arm-unknown-linux-gnueabi-ranlib
export CFLAGS="-I/root/ss/arm-unknown-linux-gnueabi/arm-unknown-linux-gnueabi/include"
export LDFLAGS="-L/root/ss/arm-unknown-linux-gnueabi/arm-unknown-linux-gnueabi/lib"

# 依赖zlib，下载编译
wget http://zlib.net/zlib-1.2.8.tar.gz
tar xvf zlib-1.2.8.tar.gz
cd zlib-1.2.8/
./configure --prefix=/root/dist/zlib-1.2.8
make & make install

# 依赖openssl，下载编译
wget https://www.openssl.org/source/openssl-1.0.2h.tar.gz
tar xvf openssl-1.0.2h.tar.gz
cd openssl-1.0.2h
./Configure dist --prefix=/root/dist/openssl-1.0.2h
make
make install

# 编译shadowsocks-libev
wget https://github.com/shadowsocks/shadowsocks-libev/archive/v2.4.6.tar.gz
tar xvf v2.4.6.tar.gz
cd shadowsocks-libev-2.4.6
# 配置 需要注意的是--host选项，目标NAS不同值可能也会不同
# 详见Synology开发指南的Compile Open Source Projects章节
./configure \
    --with-zlib=/root/dist/zlib-1.2.8 \
    --with-openssl=/root/dist/openssl-1.0.2h \
    --prefix=/root/dist/ss \
    --host=arm-unknown-linux-gnueabi
make
make install
```
这样 ss 就会编译到 /root/dist/ss 目录，这个时候打包:
```
tar cvf shadowsocks.tar ss/```
登录群晖终端从远程取回文件：
```
scp xxx@xxx.xxx.xxx.xxx:/root/dist/shadowsocks.tar .```

**运行**

需要知道的是 shadowsocks 是一个 socket 代理，而群晖 NAS 只支持 HTTP 代理，所以我们需要 Privoxy软件转换下，幸运的是 ipkg 里面刚好有此软件包。
```
sudo ipkg install privoxy```
新建 shadowsocks 配置文件 config.json，内容如下：
```
{
 "server":"xxx.xx.xx.xx",
 "server_port":1984,
 "local_port":16800,
 "password":"xxxx",
 "method":"aes-256-cfb",
 "timeout":60
}```
新建 Privoxy 配置文件 privoxy.config：
```
listen-address 127.0.0.1:16801  #监听本地的16801端口
forward / .
forward-socks5 .dropbox.com 127.0.0.1:16800 . #把访问 dropbox 的数据都通过ss 的代理端口转发出去
forward-socks5 .tmdb.org 127.0.0.1:16800 .  #把访问 tmdb 的数据都通过ss 的代理端口转发出去
#forward-socks5 / 127.0.0.1:16800 . #全部转发```

表示监听本地 16801 的端口数据转发到本地的socks5 16800 端口。这里只有两个网站的数据经过 ss 代理，一个是 Dropbox ，另一个是 tmdb（VideoStation 封面数据抓取网址）。如果需要更多可以一个个添加进去或者使用 actionfiles。

后台运行：
```
./ss-local -c config.json & 
privoxy privoxy.config```
然后进 NAS 设置一下就 OK 了：
![mark](http://ofyfogrgx.bkt.clouddn.com/blog/20161228/120135818.png)

---
**自动运行**

最后写一段自动运行脚本，放在 NAS 的任务计划中，设置每二十分钟运行一下，因为发现两个进程会有意外退出的情况，还没找原因：
```
#!/bin/sh
echo "Please run it with source command!"
i1=`ps -ef | grep -E "ss-local*"|grep -v grep|awk '{print $2}'`
if (kill -9 $i1)
then
{
	echo 'ss killed'
}
else
{
	echo 'no ss found!'
}
fi
~/Software/ShadowSocks/bin/ss-local -c ~/Software/ShadowSocks/bin/config.json &
echo "ss lunched!"

i2=`ps -ef | grep -E "privoxy*"|grep -v grep|awk '{print $2}'`
if (kill -9 $i2)
then
{
	echo 'privoxy killed'
}
else
{
	echo 'no privoxy found!'
}
fi
privoxy ~/Software/ShadowSocks/privoxy.config
echo "privoxy lunched!"```

---
## ipkg、opkg、dpkg、Entware
ipkg、opkg、dpkg是包管理程序，类似于yum和apt-get，群晖安装后可以扩展许多功能。
**Optware**运行库，opkg就是基于此。
**Entware**本身是一个跨平台运行库，自动识别Intel、ARM平台，可以提供Linux运行环境，严格来说可以算是一种系统，可以实现Linux非常多的功能，神器！
实在不懂的进[群晖英文论坛](https://forum.synology.com/enu/)能找到你想要的。

### dpkg
群晖自带了dpkg，但好像只能安装下载好的ipk文件，命令也很繁琐，没什么用处。

---
### 安装ipkg
ipkg功能很强大，可以在线安装，但是在大天朝完全给墙了，只有Google能访问到[官网的快照](http://webcache.googleusercontent.com/search?q=cache:http://ipkg.nslu2-linux.org/feeds/optware/syno-i686/cross/unstable/)。如果无法安装可用opdk

```
sudo -i
wget http://ipkg.nslu2-linux.org/feeds/optware/syno-i686/cross/unstable/syno-i686-bootstrap_1.2-7_i686.xsh
chmod +x syno-i686-bootstrap_1.2-7_i686.xsh
sh syno-i686-bootstrap_1.2-7_i686.xsh
rm syno-i686-bootstrap_1.2-7_i686.xsh
vi /root/.profile

#在PATH的等号后面加入以下这一句(注意格式和其他一样，千万不要改错了，不然几乎全部命令都失效)
/opt/bin:```
然后保存退出，重启DSM（必须重启），重启运行`ipkg update`，之后就可以使用ipkg命令啦。

---
### 安装opdk
```
sudo -i
wget http://qnapware.zyxmon.org/binaries-x86/installer/qnapware_install_x86.sh
chmod +x qnapware_install_x86.sh
./qnapware_install_x86.sh
#安装完了可能会报Info:Found a Bug?，不用理。

vi /etc/profile
vi /root/.profile
#分别在这两个文件的export CLASSPATH PATH JAVA_HOME LANG # Synology Java runtime enviroment（最后一行）的下一行加入以下这一句(注意格式和其他一样，千万不要改错了，不然几乎全部命令都失效)
PATH=$PATH:/Apps/opt/bin:/Apps/opt/sbin```
然后保存退出，重启DSM（必须重启），重启运行`opkg update`，之后就可以使用opkg命令啦。

---
### Entware-ng神器
Entware-ng是全平台运行库

官方项目：https://github.com/Entware-ng/Entware-ng
README有说明安装在各个平台的链接

安装在群晖上：https://github.com/Entware-ng/Entware-ng/wiki/Install-on-Synology-NAS

安装Entware同时会安装opkg

---
## Aria2 下载神器
### Docker安装Aria2
直接在镜像中心搜索下载镜像运行。
添加端口映射和目录挂载，端口默认是6800，不知道的看镜像文档。挂载目录可以把容器目录挂载到群晖的指定目录中。

---
### 通过opkg安装Aria2
```
opkg update
opkg install aria2

#启动aria2
aria2c --enable-rpc=true --rpc-listen-all=true --rpc-allow-origin-all=true --dir=/volume1/139G/aria2(这里是你的存储位置)/ --file-allocation=none -s 5 -j 3 -x 5 -c -D```
下载Aria2管理界面：[webui-aria2](https://github.com/ziahamza/webui-aria2)
解压后得到webui-aria2-master文件夹，改名为aria2放在web网站根目录
然后通过：**http://群晖IP/aria2/**  访问
然后就可以正常使用了，速度还是很快的
![mark](http://ofyfogrgx.bkt.clouddn.com/blog/20161229/145417486.png)

Aria2配置参考：http://aria2c.com/usage.html

---
**以下功能有时间再折腾，之后完善**

**开机启动Aria2**
参考：http://www.tweaking4all.com/qnap/qnap-aria2-download-manager/

放弃迅雷Xware3.0 转投Aria2：http://www.nasyun.com/thread-25850-1-1.html
迅雷离线https://github.com/binux/ThunderLixianExporter
，百度云下载，，，，，，，

远程下载，远程控制，百度云导出
若[BaiduExporter](https://github.com/acgotaku/BaiduExporter/releases)插件不行就用以下这个
https://chrome.google.com/webstore/detail/aria2c-integration/edcakfpjaobkpdfpicldlccdffkhpbfk?hl=en-US

http://www.cnplugins.com/fuzhu/baiduexporter/detail.html
http://www.nasyun.com/forum.php?mod=viewthread&tid=26077&pid=83563&page=1&extra=

---



