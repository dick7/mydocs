# Travis CI 持续集成

Travis CI 是在线托管的持续集成服务，绑定Github项目，抓取新的代码自动进行测试构建，甚至自动部署到测试环境。 使用这项服务，每次我们提交新的代码，都能及时发现问题并修复。
基本步骤

- 访问官网 [travis-ci.org](https://travis-ci.org/), 用Github账户登陆。
- Travis会列出你所有的Github库以及你所属的组织。我们选择需要建立 Travis CI 服务的项目，将项目旁边的开关打开。这样，Travis CI会监听该项目的变化，在每次push/pull request操作后执行测试脚本。

- 编写测试脚本。

- 在项目的根目录下新建.travis.yml配置文件，并提交到Github库中。

> 如果需要在Github库下的README.md中显示一个高大上的build-passing图标，可以进行如下配置：

> 在Travis CI中点击监听项目的Settings

> 点击头像旁边的build-passing图片，复制url至Github项目的README.md末尾，即可看到当前测试的状态。点击该图标可以跳转到 Travis 查看测试日志

## .travis.yml文件

该文件采用yaml格式，存储了测试配置信息。
下面说明.travis.yml中的主要字段

-    language
    指定了默认的运行环境
-    script
    指定了需要运行的测试脚本
-    sudo
    指定是否需要root权限
    如以下就是一个简单的python运行环境的配置文件
-    install
    指定安装脚本
-    env
    定义环境变量
-    services
    指定需要的服务
```
language: python
sudo: required
python:
    - '3.5'
services:
    - mysql
install :
    - pip install -r requirements.txt
script:
    - python manage.py test
```
.travis.yml还提供了加密服务
第一种加密方式是通过在travis CI网页上在仓库设置页添加环境变量，可以用来加密信息。
第二种加密方式则更为安全，实用性更广。通过travis encrypt命令来加密信息或文件。
首先安装travis命令行客户端
```
$ apt install travis
```
登录travis CI
```
$ travis login
```
进入本地项目的根目录，加密文件。
```
$ travis encrypt-file test.txt --add
```
注：--add操作会自动将加密环境变量写入.travis.yml。如果想要自己添加，则可不添加--add，命令行会打印出秘钥，
```
- openssl aes-256-cbc -K $encrypted_741b9a365d8e_key -iv $encrypted_741b9a365d8e_iv
  -in id_rsa.enc -out ~/.ssh/id_rsa -d
```
将秘钥手动添加到.travis.yml中的before_install字段中即可。

此外，在.travis.yml中还可以配置钩子方法，在执行script，install，deploy的前后做一些工作，提高灵活性。

整个测试配置的完整生命周期如下：
```
before_install
install
before_script
script
aftersuccess or afterfailure
[OPTIONAL] before_deploy
[OPTIONAL] deploy
[OPTIONAL] after_deploy
after_script
```
### ref:
> [1].https://www.jianshu.com/p/8fa9322b8e73
