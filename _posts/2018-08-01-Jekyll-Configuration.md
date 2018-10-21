---
layout:     post
title:      Jekyll Configuration
subtitle:   
date:       2018-08-01
header-img: img/posts/Jekyll Configuration/header_bg.png
catalog: true
mathjax: false
tags:
    - Configuration
---


> [Jekyll](https://jekyllrb.com/) transforms your plain text into static websites and blogs. Following steps will instruct you how to install and configure Jekyll.


### 1 Install Ruby & DevKit

Jekyll is a plugin developed with Ruby, so it will be necessary to install Ruby first. 

Download Ruby [here](http://rubyinstaller.org/downloads/), where I select **Ruby+DevKit 2.5.1-2 (x64)**.

Install them in a directory without any space, so you cannot install them in "*X:\Program Files*" as usual. Besides, add Ruby executables to your *PATH*. 

Run following code in command prompt. 

```
ruby -v
```

Version information shows whether Ruby has been successfully installed or not.

Then, make sure Gem has been properly installed.

```
gem -v
```

Version information shows whether Gem has been successfully installed or not. Usually, Gem will be automatically installed with DevKit.


### 2 Install Jekyll

You can install Jekyll with following command:

```
gem install jekyll
```

### 3 Start Jekyll

Change into your blog directory, then start Jekyll with command:

```
jekyll serve
```

Or

```
jekyll s
```

Then visit [127.0.0.1:4000](127.0.0.1:4000) (*default*) for preview.