# MySQL

## 登录：
```
mysql -u root -p 123
```
## 初始化/导入数据库
```
mysql>use [database-name];source *.sql;
or
>mysql -u root -p 123 [database-name] < *.sql
```

## 使用cat命令查看默认密码
```
sudo cat /etc/mysql/debian.cnf
```
显示的内容：
```
# Automatically generated for Debian scripts. DO NOT TOUCH!
[client]
host     = localhost
user     = debian-sys-maint
password = 6b76NDnr65gNCcia
socket   = /var/run/mysqld/mysqld.sock
[mysql_upgrade]
host     = localhost
user     = debian-sys-maint
password = 6b76NDnr65gNCcia
socket   = /var/run/mysqld/mysqld.sock
```
### 使用默认密码登录
```
# mysql -udebian-sys-maint -p
Enter password: 
...
mysql>
```
## 修改密码
```
UPDATE mysql.user SET authentication_string=PASSWORD('root'), PLUGIN='mysql_native_password' WHERE USER='root';
```

## 重启服务
```
/etc/init.d/mysql restart
```

## 退出重新登录
```
mysql -u root -p root
```
即可登陆成功！！！

## Ubuntu系统下MySQL数据库基本操作

Ubuntu系统下安装MySQL后,所有新创建的数据库的默认目录为/var/lib/mysql目录,以后用户自己创建的数据库默认就保存在这个目录下.在终端输入mysql回车后,启动mysql服务,可以开始输入命令了.下面介绍一些最基本的数据操作命令:
```
1. show databases;  #查看有哪些数据库存在
2. create database name; #创建一个叫name的数据库
3. use name; #进入(打开)名字叫name的数据库
4. show tables; #查看这个数据库中有哪些表
5. create table tb1(nid int,name varchar(20),pwd varchar(64)) ; #在数据库中创建一个名叫tb1的表,表中共有3个字段,第1个字段叫nid,是int型的,第2 外字段叫name,是varchar()型的,长度为20,第3个字段名叫pwd,也是varchar()型的,长度为64
6. select * from tb1;   #查看tb1表中的所有数据
7. insert into tb1(nid,name,pwd) values(1,'alex','123'); #在tb1表中插入一行数据.
8.create user guoming@localhost identified by '990310' ; #创建新用户,用户名是guoming,密码是990310
9. mysql -u guoming -p        #使用guoming用户启动mysql,要求输入密码,输入990310,通过验证后启动了mysql.
10. drop user guoming@localhost  #将用户 guoming 删除
11. rename user guoming@localhost to dongyang@127.0.0.1 将guoming用户更名为dongyang用户
12. set password for root@localhost = Password('990310'); #将root用户密码设置为990310
```
## MySQL创建数据库与创建用户以及授权

```
1、create schema [数据库名称] default character set utf8 collate utf8_general_ci;--创建数据库
采用create schema和create database创建数据库的效果一样。
2、create user '[用户名称]'@'%' identified by '[用户密码]';--创建用户
密码8位以上，包括：大写字母、小写字母、数字、特殊字符
%：匹配所有主机，该地方还可以设置成‘localhost’，代表只能本地访问，例如root账户默认为‘localhost‘
3、grant select,insert,update,delete,create,ALTER,REFERENCES,INDEX on [数据库名称].* to [用户名称];--用户授权数据库
*代表整个数据库
---------------------------------
GRANT all ON djangoblog.* TO 'djangoblog'@'localhost';
GRANT all ON  [数据库名称].* TO[数据库名称].* to '[用户名称]';--用户授权数据库，*代表整个数据库
--------------------------------
4、flush  privileges ;--立即启用修改
5、revoke all on *.* from tester;--取消用户所有数据库（表）的所有权限
6、delete from mysql.user where user='tester';--删除用户
7、drop database [schema名称|数据库名称];--删除数据库

create user 'erp_test'@'%' identified by 'erp_test@abc'; -- 创建用户
grant select,insert,update,delete,create on *.* to erp_test; --用户授权数据库
flush privileges;--立即启用修改
```
