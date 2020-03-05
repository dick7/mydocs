# Linux 

## 1.批量查找与替换

经常要使用到 Linux 的批量查找与替换，这里我们为大家介绍使用 sed 命令来实现查找文件中的内容并替换。

### 语法格式
```
sed -i "s/原字符串/新字符串/g" `grep 原字符串 -rl 所在目录`
```
### 实例

以下我们实现在当前目录下查找包含 "1" 的字符串，并将字符串 "1" 替换为 "PARAM"，执行命令：
```
sed -i "s/1/PARAM/g" `grep "1" -rl ./test-webhook.sh`
```
接下来使用一个更复杂实例，批量替换网址 baidu.com 为 ztloadfield.com：
```
sed -i "s/https:\/\/baidu.com/https:\/\/ztloadfield.com\/g" `grep -rl "baidu.com" ./`
```
### 参考命令
  -  Linux sed命令： http://www.runoob.com/linux/linux-comm-sed.html
  -  Linux grep命令：http://www.runoob.com/linux/linux-comm-grep.html

## 2.git webhook

ref:[*webhook.sh*](https://blog.csdn.net/qq_40995752/article/details/89467931)

Here is mine: 

`webhook.sh`

```bash
#!/bin/bash

echo "Some ('push') event(s) makes webhook start!"
echo "-------------------Start-------------------"
date --date='0 days ago' "+%Y-%m-%d %H:%M:%S"

access_key=KjL3aQB6mvapcokPhOuWJ6NLPACa5QYVZzY1cRtjEp2s3as0

printf "'PARAM=$PARAM'\n '0=$0'\n '1=$1'\n '2=$2'\n"
# PARAM=mydocs
PARAM=$1
# CD=/www/wwwroot/
CD=/www/wwwroot/
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
