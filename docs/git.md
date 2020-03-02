# Git/Github

## 1.git push without password
```
ssh-keygen # 公钥生成，然后把公钥放到GitHub上
git config --global user.email "xxx@xxmail.com"
git config --global user.name "xxx"
git config --global user.password "xxx"
git config --global credential.helper store # git push的时候记住用户名和密码
git config --global push.default simple
```

## 2.git basic operations
```
# git clone https://github.com/dick7/mydocs.git
git init /git pull
# git branch --set-upstream-to=origin/master
git branch --set-upstream-to=origin/dev
git add .
git commit -m '1st upload to github'
git remote add origin dev https://github.com/dick7/mydocs.git
git push -u origin dev
```

## 3.git server

当然我们也可以自己搭建一台 Git 服务器作为私有仓库使用。

接下来我们将以 Centos 为例搭建 Git 服务器。

### (1)、安装Git
```
$ yum install curl-devel expat-devel gettext-devel openssl-devel zlib-devel perl-devel
$ yum install git
```
接下来我们 创建一个git用户组和用户，用来运行git服务：
```
$ groupadd git
$ useradd git -g git
```
### (2)、创建证书登录

收集所有需要登录的用户的公钥，公钥位于id_rsa.pub文件中，把我们的公钥导入到/home/git/.ssh/authorized_keys文件里，一行一个。

如果没有该文件创建它：
```
$ cd /home/git/
$ mkdir .ssh
$ chmod 755 .ssh
$ touch .ssh/authorized_keys
$ chmod 644 .ssh/authorized_keys
```
### (3)、初始化Git仓库

首先我们选定一个目录作为Git仓库，假定是/home/gitrepo/mygit.git，在/home/gitrepo目录下输入命令：
```
$ cd /home
$ mkdir gitrepo
$ chown git:git gitrepo/
$ cd gitrepo

$ git init --bare mygit.git
Initialized empty Git repository in /home/gitrepo/mygit.git

```
以上命令Git创建一个空仓库，服务器上的Git仓库通常都以.git结尾。然后，把仓库所属用户改为git：
```
$ chown -R git:git mygit.git
```

### (4)、克隆仓库
```
$ git clone git@192.168.45.4:/home/gitrepo/mygit.git
Cloning into 'runoob'...
warning: You appear to have cloned an empty repository.
Checking connectivity... done.
```
192.168.45.4 为 Git 所在服务器 ip ，你需要将其修改为你自己的 Git 服务 ip。

这样我们的 Git 服务器安装就完成。

## 4.webhook on [github](github.com)

宝塔面板插件webhook脚本文件：

* test-webhook.sh 
```
#!/bin/bash

echo "Let's test webhook!"

date --date='0 days ago' "+%Y-%m-%d %H:%M:%S"

PARAM=mydocs

if [ ! -n "$PARAM" ];
then
    echo "'$PARAM' is NULL!No param come in!"
    exit
fi

gitLocal="/www/wwwroot/$PARAM"
gitRemote="https://github.com/dick7/$PARAM.git"

echo "gitLocal: $gitLocal"
echo "gitRemote: $gitRemote"

if [ -d "$gitPath"  ];
then
    cd $gitPath
    echo "判断是否存在git目录"
    if [ ! -d ".git"  ]; then
        echo "在该目录下克隆 git"
        git clone $gitHttp gittemp
        echo "git clone to 'gittemp' completed!"
        echo "mv gittemp/.git ."
        mv gittemp/.git .
        echo "rm -rf gittemp"
        rm -rf gittemp
    fi
    echo "拉取最新的项目文件"
    #git reset --hard origin/master
    git pull
    echo "设置目录权限'www:www'"
    chown -R www:www $gitPath
    echo "End"
    exit
else
    echo "该项目路径不存在"
    echo "End"
    exit
fi
```

### github webhook config and test

- Webhooks / Manage webhook

We’ll send a POST request to the URL below with details of any subscribed events. You can also specify which data format you’d like to receive (JSON, x-www-form-urlencoded, etc). More information can be found in our developer documentation.

- Payload URL
```

```

- Content type
```

```
- Secret
```

```

- Which events would you like to trigger this webhook?
> *   Just the push event.
>     Send me everything.
>     Let me select individual events.

- Active

We will deliver event details when this hook is triggered.
Recent Deliveries

- Recent Deliveries

    e3125208-5c62-11ea-8fe3-094f6a057ebd

|Request|Response|
|-------|--------|
|...    | ...    |
