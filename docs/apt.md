# apt `/etc/apt/source.list`

```
# https://mirrors.tuna.tsinghua.edu.cn/help/ubuntu/
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-updates main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-updates main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-security main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-security main restricted universe multiverse

# deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-proposed main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-proposed main restricted universe multiverse

# https://opsx.alibaba.com/mirror
deb https://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse
deb https://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse
deb https://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse
deb https://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse
deb https://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse

# deb-src https://mirrors.aliyun.com/ubuntu/ xenial main restricted universe multiverse
# deb-src https://mirrors.aliyun.com/ubuntu/ xenial-security main restricted universe multiverse
# deb-src https://mirrors.aliyun.com/ubuntu/ xenial-updates main restricted universe multiverse
# deb-src https://mirrors.aliyun.com/ubuntu/ xenial-proposed main restricted universe multiverse
# deb-src https://mirrors.aliyun.com/ubuntu/ xenial-backports main restricted universe multiverse
```

# pip `.pip`

```
[global]
timeout = 6000

#douban
index-url = http://pypi.douban.com/simple
trusted-host = pypi.douban.com

#aliyun
# index-url = http://mirrors.aliyun.com/pypi/simple/
# trusted-host = mirrors.aliyun.com

#ustc
# index-url=http://pypi.mirrors.ustc.edu.cn/simple/
# trusted-host =pypi.mirrors.ustc.edu.cn

```
# yum 
```

```

### ref:

> [1].[apt]()
> [2].[pip]()
