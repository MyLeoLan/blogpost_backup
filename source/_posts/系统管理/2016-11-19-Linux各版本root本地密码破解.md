---
title: Linux各版本root本地密码破解
categories:
  - 系统管理
tags:
  - Linux各版本root本地密码破解
  - root密码破解
abbrlink: 65067
date: 2016-11-19 01:09:09
---

忘记了root密码可以用此方法修复。

---
# RedHat/CentOS/Fedora
　　1.在grub选项菜单**按E**进入编辑模式
　　2.编辑kernel **那行最后空一格加上S **(或者Single)然后回车
　　3.按B，启动到**single-user mode**模式
　　4.进入后执行下列命令
```
passwd
reboot
或
mount -t proc proc /proc
mount -o remount,rw /
passwd
sync
reboot```

---
# Debian linux
　　1.在grub选项菜单**Debian GNU/Linux,…(recovery mode)**，按e进入编辑模式
　　2.编辑kernel那行最后面的 **ro single** 改成 **rw single init=/bin/bash**，按**b**执行重启
　　3.进入后执行下列命令
```
mount -a
passwd root
reboot```

---
# Freebsd 系统
　　1.开机进入引导菜单
　　2.选择每项**(按4)**进入单用户模式
　　3.进入之后输入一列命令
```
mount -a
fsck -y
passwd   #(修改密码命令)
root     #(要破解密码的用户名)
#Enter new unix password:
init 6   #(重启)```

---
# Solaris 系统
　　1.在grub选项菜中选择**solaris failasfe** 项
　　2.系统提示Do you wish to have it mounted read-write on /a ?[y,n,?] 选择y
　　3.就进入单用户模式
　　4.输入下列命令:`passwd`
　　5.`init 6` (重启)

---
# NetBsd 系统
　　1.开机：当出现提示符号并开始倒数五秒时， 键入以下指令：
　　> **boot -s **(进入单用户模式命令)
　　2.在以下的提示符号中
　　Enter pathname of shell or RETURN for sh:
　　按下 Enter。
　　3.键入以下指令：
```
mount -a
fsck -y```
　　4.使用 `passwd` 更改 root 的密码。
　　5.使用 `exit` 指令进入多人模式。

---
# SUSE 系统
　　1.重新启动机器，在出现grub引导界面后，在启动linux的选项里加上**init=/bin/bash**，通过给内核传递init=/bin/bash参数使得OS在运行login程序之前运行bash，出现命令行。
　　2.稍等片刻出现(none)#:**命令行**。
　　3.这时输入`mount -n / -o remount,rw` 表示将根文件系统重新mount为可读写，有了读写权限后就可以通过passwd命令修改密码了。
　　4.这时输入`passwd`命令就可以重置密码了
　　5.修改完成后记得用`mount -n / -o remount,ro`将根文件系统置为原来的状态。


---




