#!/bin/bash

# 0. kill mkdocs
ps -ef|grep mkdocs|awk '{print $2}'|xargs kill -9
# 1.启动虚拟环境
cd /home/dick7/GitHub/mydocs
source venv/bin/activate
# 2.切换项目目录
cd mydocs
# 3.运行服务程序
mkdocs serve --dev-addr 0.0.0.0:8000

# 4.Deployment
tar -czvf site.tar.gz site
scp site.tar.gz root@121.43.154.253:/www/wwwroot/ztloadfield.com/doc/
