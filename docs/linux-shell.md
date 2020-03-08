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
sed -i "s/https:\/\/baidu.com/https:\/\/ztloadfield.com/g" `grep -rl "baidu.com" ./`
----------------^-^-----------------^-^--------------------------------------------
**注意：插入 '\'的位置，其他位置不变。**
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
cat << EOF
mywebhook.sh control hooks to github
Author:dick7
Date:20200307
Config sample:
[must]
project=YOUR_PROJECT
CD=WWW_ROOT
[option-default]
access_key='KjL3aQB6mvapcokPhOuWJ6NLPACa5QYVZzY1cRtjEp2s3as0'
git_server='https://github.com'
git_user='dick7'
EOF

echo "Some ('push') event(s) makes webhook start!"
echo "-------------------Start-------------------"
date --date='0 days ago' "+%Y-%m-%d %H:%M:%S"

project=$1
# echo "'project=$project'is the project name on GitHub(git server)."
CD=$2
# echo "'CD=$CD'is the path to clone."
access_key='KjL3aQB6mvapcokPhOuWJ6NLPACa5QYVZzY1cRtjEp2s3as0'
git_server='https://github.com'
git_user='dick7'

if [ ! -n "$project" ];then
    echo "project=$project is NULL!"
    echo "--------------------End--------------------"
    exit
fi
if [ ! -n "$CD" ];then
    echo "CD=$CD is NULL!Use $PWD for default."
    CD=$PWD
fi


printf " 'project=$project'\n 'CD=$CD'\n '0=$0'\n '1=$1'\n '2=$2'\n"

gitLocal="$CD/$project"
gitRemote="$git_server/$git_user/$project.git"

echo "gitLocal=$gitLocal"
echo "gitRemote=$gitRemote"



if [ -d "$gitLocal"  ];then
    echo "$gitLocal EXISTs！"
    cd $gitLocal
    if [ ! -d ".git"  ]; then
        echo -e "$gitLocal does NOT contain '.git'!"
        echo -e "Needing:\n  1.'git init' and\n  2.'git remote add origin'"
        git init
        git remote add origin $gitRemote

        if [ -e $gitLocal ];then
            echo '!exsist file removed!'
            rm -rf ./*
        fi

    fi
    echo "Optional 'git branch -l', to see the branch list."
    git branch -l
    echo "'git pull [master|dev|v0.1|v0.2|v1.0]...' from $gitRemote."
    git pull origin master
    # git pull --rebase
    echo -e "change $gitLocal own rights to 'www:www'."
    # echo -e "NOTICE: the 'git status' will change to 'modified' or 'delete'!"
    chown -R www:www $gitLocal > /dev/null 2>&1
    echo "--------------------End--------------------"
    exit
else
    echo -e "$gitLocal does NOT EXIST!\n'git clone $gitRemote' directly!"
    git clone $gitRemote $gitLocal
    echo "--------------------End--------------------"
    exit
fi
```
## 3.File Operation

**Check File/Directory Mode(s) [Situation/ is Empity?/ is NULL]**

### 3.1 if/for/test/array/case...esac/$#/string

```
#!/bin/bash

# Generate test files
# for (( i=0;i<5;i++ )); do touch tmp-$i.txt;done
# for (( i=0;i<5;i++ )); do touch tmp-$i.txt; echo 'test'-$i >> tmp-$i.txt;done

echo "Number of params=$#"
echo -e "Run file=$0\nParam=$1"

if [ 1 -gt $# ];then
    echo "No param input!Only need one!"
    exit
fi

if [ 1 -lt $# ];then
    echo 'Too many params!Only need one!'
    exit
fi

fm=( '-e' '-b' '-c' '-d' '-f' '-g' '-k' '-p' '-u' '-r' '-w' '-x' '-s' '-S' '-L')
# echo ${fm[1]}
# echo ${fm}
# echo ${fm[*]}
# echo ${#fm[@]}

count=0
ml=""
for m in ${fm[*]}
do
    if [ ! -e $1 ];then
        echo "$1 does NOT exist."
        exit
    fi
    if [ $m $1 ];then
        count=`expr $count + 1`
        ml="$ml"' '"$m"
        # echo "$1 has $m mode!"
    fi
done

echo -e "ml=$ml\ncount=$count"

if [[ ${#ml} -lt 1 || $count -eq 0 ]]; then
    echo "$1 has spacial mode."
    exit
fi

for m in ${ml[*]}
do
    case $m in
        '-e') echo "-e : $1 exists."
            # continue
            ;;
        '-d') echo "-d : $1 is DIR."
            p=`ls -a $1`
            if [ ${#p} -lt 5 ];then
                echo -e "$1 is an empity DIR!But NOT a NULL DIR,it contains:\n[$p]!"
            else
                # ls -a $1
                # echo $p
                continue
            fi
            ;;
        '-f') echo "-f : $1 is common file Nither DIR nor DEVICE."
            p=`cat $1`
            if [ ${#p} -eq 0 ];then
                echo "$1 is NULL common file."
            fi
            # cat $1
            ;;
        '-s') echo "-s : $1 NOT NULL."
            # cat $1
            ;;
        '-x') echo "-x : $1 is an EXEC RUN file."
            ;;
        '-r') echo "-r : $1 is Readable."
            ;;
        '-w') echo "-w : $1 is Writeable."
            ;;
        '-b'|'-c'|'-g'|'-k'|'-p'|'u') echo "'-b'|'-c'|'-g'|'-k'|'-p'|'u' : $1 is something else,such as BLOCKSET, CHARSET, SGID, Sticky Bit, Panel, SUID."
            ;;
        '-S') echo "-S : $1 is a Socket."
            ;;
        '-L') echo "-L : $1 is a Symbol Link."
            ;;
        *) echo "$1 does NOT exist, or is something unknown."
            break
            ;;
    esac
done
```

### 3.2 if/$#/-gt/-e.../||
```
#!/bin/bash


# for (( i=0;i<5;i++ )); do touch tmp-$i.txt;done
# for (( i=0;i<5;i++ )); do touch tmp-$i.txt; echo 'test'-$i >> tmp-$i.txt;done

echo "$#"
echo -e "$0 \n $1 \n $2"

if [ 1 -gt $# ];then
    echo "No param input!Only need one!"
    exit

fi

if [ 1 -lt $# ];then
    echo 'Too many params!Only need one!'
    exit
fi

if [ -e $1 ];then
    echo $1' exists!'
else
    echo $1' NOT exists!'
    exit
fi

if [ -d $1 ];then
    echo $1' is DIR.'
    p=`ls -a $1`
    if [ ${#p} -lt 5 ];then
        echo $1' is NULL DIR!'
    else
        ls -a $1
    fi
    exit
else
    echo $1' is NOT DIR.'
fi

if [ -f $1 ];then
    echo $1' is common file Nither DIR nor device.'
    if [ -s $1 ];then
        echo $1' NOT NULL.'
        if [ -x $1 ];then
            echo $1' is RUN file.'
            exit
        else
            cat $1
            exit
        fi
    else
        echo $1' is NULL file.'
        exit
    fi
else
    if [[ -b $1 || -c $1 || -g $1 || -k $1 || -p $1 || -u $1 ]];then
        echo $1' is something else.'
        exit
    fi
    echo $1' is something unknown.'
    exit
fi

```

