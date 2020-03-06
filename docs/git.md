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
git init 
# git reset --hard origin/master
# git branch --set-upstream-to=origin/master
# git branch --set-upstream-to=origin/dev
git add .
git commit -m '1st upload to github'
git remote add origin https://github.com/dick7/mydocs.git
git pull [--rebase]
git push [-f -u origin dev]
```

## 3.webhook on [github](https://github.com/dick7/mydocs)

宝塔面板插件webhook脚本文件 **BUG** 解决方案：

*** 先用指定参数 `$PARAM` 代替传入参数 `$1` ，然后再换回`$1`***

* test-webhook.sh 
```
#!/bin/bash

echo "Some ('push') event(s) makes webhook start!"
echo "-------------------Start-------------------"
date --date='0 days ago' "+%Y-%m-%d %H:%M:%S"

access_key=KjL3aQB6mvapcokPhOuWJ6NLPACa5QYVZzY1cRtjEp2s3as0

printf "'PARAM=$PARAM'\n '0=$0'\n '1=$1'\n '2=$2'\n"
PARAM=DjangoBlog
# PARAM=$1
# CD=/www/wwwroot/
CD=/www/wwwroot/new-realm.cn/dev
echo "The ONLY parameter you need to change is the 'CD=$CD' you will clone into."

if [ ! -n "$PARAM" ];
then
    echo "$PARAM is NULL!No param come in!"
    echo "--------------------End--------------------"
    exit
fi

gitLocal="$CD/$PARAM"
gitRemote="https://github.com/dick7/$PARAM.git"

echo "gitLocal: $gitLocal"
echo "gitRemote: $gitRemote"

if [ -d "$gitLocal"  ];
then
    echo "$gitLocal EXISTs！"
    cd $gitLocal
    if [ ! -d ".git"  ]; then
        echo "$gitLocal dir does NOT contain '.git'!Needing 'git clone ...'"
        git clone $gitRemote gittemp
        # echo "git clone completed! then 'mv gittemp/.git .'"
        mv gittemp/.* . -f
        echo "FOR GITHUB,needing 'mv gittemp/* .'"
        mv gittemp/* . -f
        echo "Are you sure 'rm -rf gittemp'?"
        rm -rf gittemp
    fi
    echo "'git pull ...' from $gitRemote."
    #git reset --hard origin/master
    git pull
    echo -e "change $gitLocal own rights to 'www:www'.\n NOTICE: the 'git status' will change to 'delete' or 'mode changed'!"
    chown -R www:www $gitLocal
    echo "--------------------End--------------------"
    exit
else
    echo "$gitLocal does NOT EXIST!"
    echo "--------------------End--------------------"
    exit
fi
```

### github webhook config and test

- Webhooks / Manage webhook

We’ll send a POST request to the URL below with details of any subscribed events. You can also specify which data format you’d like to receive (JSON, x-www-form-urlencoded, etc). More information can be found in our developer documentation.

- Payload URL
```
http://IP:8888/hook?access_key=***bTk&param=mydocs
```

- Content type

~~default~~

- Secret

~~default NULL~~

- Which events would you like to trigger this webhook?

>  Just the push event. ~~default~~
>  Send me everything.
>  Let me select individual events.

- **Active**

    When activated, the `github.com` will give a message below:
    ```
    Okay, that hook was successfully created. We sent a ping payload to test it out! Read more about it at https://developer.github.com/webhooks/#ping-event.
    ```
    , stands for setting ok and completed.

We will deliver event details when this hook is triggered.
Recent Deliveries

- Recent Deliveries

    e3125208-5c62-11ea-8fe3-094f6a057ebd

|**Request**|**Response**|
|-------|--------|
|URL: http://IP:8888/hook?access_key=***&param=mydocs| {"code": 1}  |
|...|...|

## 4.git server

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


venv/

*.pyc
__pycache__/

instance/

.pytest_cache/
.coverage
htmlcov/

dist/
build/
*.egg-info/
