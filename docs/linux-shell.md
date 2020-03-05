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
- Source: *[mydocs](https://github.com/dick7/mydocs)*
- Site: [http://doc.ztloadfield.com/](http://doc.ztloadfield.com:8500)

```bash

```
