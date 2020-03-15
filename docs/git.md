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
`vi .gitignore`
```
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
```
## 3.webhook on [github](https://github.com/dick7/mydocs)

> [***`mywebhook.sh`***](/server/linux-shell/#2git-webhook)

### 3.1 github webhook config and test

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

### 4.1.gitea

> [gitea](https://docs.gitea.io/en-us/install-from-binary/)

```
wget -O gitea https://dl.gitea.io/gitea/1.11.2/gitea-1.11.2-linux-amd64
chmod +x gitea
./gitea web
```

***Like `frp`:go,anywhere,micro.***

> **Browser install**

```
http://git.ztloadfield.com:3000/install
```
`cat custom/conf/app.ini`
```
APP_NAME = myGit-Gitea
RUN_USER = root
RUN_MODE = prod

[oauth2]
JWT_SECRET = ApXBvO0h3EWoo9ADmIbBTRJWONqy3WQhScbz8RUvEdw

[security]
INTERNAL_TOKEN = eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYmYiOjE1ODQyODUyODV9.CqsITnL3jLyuTqJtPMQF7UXTo9HLlclR_1JIByeA2sU
INSTALL_LOCK   = true
SECRET_KEY     = N7vP6emXYrKNIsjKW1RWdWGP4MAPSyBcSIJveSPXqgjuL8IAlYCz9kFFSxqNMqci

[database]
DB_TYPE  = mysql
HOST     = 127.0.0.1:3306
NAME     = gitea
USER     = gitea
PASSWD   = p2YpCjdETsyyFeaY
SSL_MODE = disable
CHARSET  = utf8
PATH     = /www/wwwroot/ftp/data/gitea.db

[repository]
ROOT = /www/wwwroot/gitea/gitea-repositories

[server]
SSH_DOMAIN       = git.ztloadfield.com
DOMAIN           = git.ztloadfield.com
HTTP_PORT        = 3000
ROOT_URL         = http://git.ztloadfield.com:3000/
DISABLE_SSH      = false
SSH_PORT         = 22
LFS_START_SERVER = true
LFS_CONTENT_PATH = /www/wwwroot/gitea
LFS_JWT_SECRET   = 7wRGQGjvUPoHD1gYepAUsWa4aol7uT8MrvGaHkBbl5Y
OFFLINE_MODE     = false

[mailer]
ENABLED = false

[service]
REGISTER_EMAIL_CONFIRM            = false
ENABLE_NOTIFY_MAIL                = false
DISABLE_REGISTRATION              = false
ALLOW_ONLY_EXTERNAL_REGISTRATION  = false
ENABLE_CAPTCHA                    = false
REQUIRE_SIGNIN_VIEW               = false
DEFAULT_KEEP_EMAIL_PRIVATE        = false
DEFAULT_ALLOW_CREATE_ORGANIZATION = true
DEFAULT_ENABLE_TIMETRACKING       = true
NO_REPLY_ADDRESS                  = noreply.localhost

[picture]
DISABLE_GRAVATAR        = false
ENABLE_FEDERATED_AVATAR = true

[openid]
ENABLE_OPENID_SIGNIN = true
ENABLE_OPENID_SIGNUP = true

[session]
PROVIDER = file

[log]
MODE      = file
LEVEL     = info
ROOT_PATH = /www/wwwroot/gitea/log
```

> ***Run gitea in bash***

```
GITEA_WORK_DIR=/var/lib/gitea/ /usr/local/bin/gitea web -c /etc/gitea/app.ini
```

### 4.2.自己搭建一台 Git 服务器作为私有仓库

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
> 192.168.45.4 为 Git 所在服务器 ip ，你需要将其修改为你自己的 Git 服务 ip。这样我们的 Git 服务器安装就完成。


