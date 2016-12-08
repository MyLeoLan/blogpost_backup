---
title: React Native
categories:
  - Dev
tags:
  - React Native
  - 构建原生APP
top: 10
abbrlink: 55168
date: 2016-12-08 11:30:55
keywords: React Native,原生APP构建
---

# React Native开发环境搭建

找Hexo的问题时，无意间看到一篇关于React Native的博文，想起一次源创会上有以为大牛讲过React Native。React Native是使用javascript编写移动跨平台原生app的框架, Facebook已经在多项产品中使用了React Native，并且将持续地投入建设React Native。

官网：[搭建开发环境](http://reactnative.cn/docs/0.39/getting-started.html)

---
## Mac
### 快速构件运行app
安装依赖环境
```
brew install node
brew install watchman
(sudo) npm install -g react-native-cli```
生成项目
```
react-native init demo```
构件运行
```
react-native run-ios```

---
### 调试技巧
执行上面命令后, 会自动启动模拟器, **ctrl+command+z** 可以调出调试菜单.

 **Reload** 刷新app页面,让js代码的更改立刻生效,

 **Enable Remote JS Debugging** 调出**Chrome开发者工具**, 可以看到异常, 打印日志, 使用debugger断点.
```
console.log('something');
debugger;```

---
### 打包发布
**android生成离线包**
```
react-native bundle --platform android --entry-file index.android.js --bundle-output ./bundles/index.android.bundle --dev false```

**配置签名**

**生成apk**：`cd android && ./gradlew installRelease`

**ios生成离线包**
```
react-native bundle --platform ios --entry-file index.ios.js --bundle-output ./bundles/index.ios.bundle --dev false```

* [原生代码中使用离线包](http://reactnative.cn/docs/0.39/running-on-device-ios.html#content)
* [使用xcode生成ipa](http://jingyan.baidu.com/article/ceb9fb10f4dffb8cad2ba03e.html)

原文：[react-native极简教程](https://ipro.xin/2016/07/06/react-native%E6%9E%81%E7%AE%80%E6%95%99%E7%A8%8B/)

---
## Windows
参考官网：http://reactnative.cn/docs/0.39/getting-started.html#content




---
## Linux
参考官网：http://reactnative.cn/docs/0.39/getting-started.html#content


---

# ---未完成---

---

