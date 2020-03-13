# Linux Commands' Examples

## 1.tar

- 压缩文件 非打包
```
# touch a.c
# tar -czvf test.tar.gz a.c   //压缩 a.c文件为test.tar.gz
a.c
```
- 列出压缩文件内容
```
# tar -tzvf test.tar.gz
-rw-r--r-- root/root     0 2010-05-24 16:51:59 a.c
```
- 解压文件
```
# tar -xzvf test.tar.gz
a.c
```

## 2.grep
```
grep 'name' -r ./
```

## 3.find
```
find ./ -name 'name'
```

## 4.netstat
```
netstat -apn
```

## 5.ln
```
ln -s Source Destination
```

## 6.cd
```
cd ..
```

## 7.cp
```
cp ./* ../
```

## 8.mv
```
mv ./.* ../
```

## 9.rm
```
rm ./*
```

## 10.cat
```
cat file
```

## 11.touch
```
touch newfile
```

## 12.mkdir
```
mkdir -p ./tmp/
```


