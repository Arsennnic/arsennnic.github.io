---
layout:     post
title:      Sublime Text 3 Configuration
subtitle:   
date:       2018-10-04
header-img: img/posts/Sublime Text 3 Configuration/header_bg.png
catalog: true
mathjax: false
tags:
    - Configuration
---


# 1 Installation & Crack

Download **SUblime Text 3** (Build version 3176) [here]({{site.url}}/files/{{page.title}}/Sublime.rar) and unzip it to some directory.

Double-click on **Sublime Text Build 3176 x64 Setup.exe** to install.

After installation is finished, add these lines to "C:\Windows\System32\drivers\etc\hosts":

```
127.0.0.1 www.sublimetext.com
127.0.0.1 license.sublimehq.com
```

Launch Sublime Text 3, click "**Help >> Enter Lisence**", then paste these lines:

```
----- BEGIN LICENSE -----
sgbteam
Single User License
EA7E-1153259
8891CBB9 F1513E4F 1A3405C1 A865D53F
115F202E 7B91AB2D 0D2A40ED 352B269B
76E84F0B CD69BFC7 59F2DFEF E267328F
215652A3 E88F9D8F 4C38E3BA 5B2DAAE4
969624E7 DC9CD4D5 717FB40C 1B9738CF
20B3C4F1 E917B5B3 87C38D9C ACCE7DD8
5F7EF854 86B9743C FADC04AA FB0DA5C0
F913BE58 42FEA319 F954EFDD AE881E0B
------ END LICENSE ------
```





# 2 Recommended Configuration

## 2.1 Right-click Menu Item

If you want to add "Open with Sublime" in your right-click menu, copy "**sublime_addright.inf**" into installation directory (*by default C:\Program Files\Sublime Text 3*), then right-click it to install.

## 2.2 Hot Exit

If you want to disable exiting with files remembered, click "**Preferences >> Settings**" and add these lines:

```
{
	// Disable exiting with files remembered.
	"hot_exit": false,
	"remember_open_files": false,

	// Disable update check.
	"update_check": false
}
```

## 2.3 Package Control

With Package Control, you can download open-source plugins to improve Sublime performance.

Click "**Tools >> Install Package Control...**" to install.





# 3 Compiler Environment Configuration

## 3.1 Python

Downlaod Python [here](https://www.python.org/downloads/), where I select **Python 3.6.6**.

Without any more configuration, you can compile and run **\*.py** with "Ctrl+B".


## 3.2 C/C++

Download MinGW [here]({{site.url}}/files/{{page.title}}/MinGW-0.6.3.exe) and install.

Run MinGW Installation Manager, click the rectangle before "**mingw32-base**" and "**mingw32-gcc-g++**", mark them for installation, then click "**Installation >> Apply Changes**".

![MinGW32_Base_1]({{site.url}}/img/posts/{{page.title}}/c_config_mingw_1.png)

![MinGW32_Base_2]({{site.url}}/img/posts/{{page.title}}/c_config_mingw_2.png)

Close the installation dialouge and qiut MinGW Installation Manager. Then add MinGW to *PATH* (*by default "C:\MinGW\bin"*).

![MinGW_Environment_Variable_1]({{site.url}}/img/posts/{{page.title}}/c_config_path.png)

Add new system variables called "**LIBRARY_PATH**" and "**C_INCLUDEDE_PATH**", set their value as "\MinGW\lib" and "\MinGW\include".

![MinGW_Environment_Variable_2]({{site.url}}/img/posts/{{page.title}}/c_config_lib.png)

![MinGW_Environment_Variable_3]({{site.url}}/img/posts/{{page.title}}/c_config_include.png)

Launch Sublime Text 3. Click "**Tools >> Build System >> New Build System**" and paste these lines:

```
{
 "cmd": ["g++", "${file}", "-std=c++11", "-o", "${file_path}/${file_base_name}", "&", "start", "cmd", "/c", "${file_base_name} & echo. & pause"],
 "file_regex": "^(..[^:]*):([0-9]+):?([0-9]+)?:? (.*)$",
 "working_dir": "${file_path}",
 "selector": "source.c, source.c++",
 "shell": true,
 "encoding":"cp936",
}
```

Save it as "**C & C++.sublime-build**", and now you can compile and run **\*.c** or **\*.cpp** with "Ctrl+B".


## 3.3 Markdown

To be continue...

## 3.4 LaTex

To be continue...

## 3.5 Fortran90

To be continue...