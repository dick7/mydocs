#!/bin/bash

# 1.启动虚拟环境
cd ~/GitHub/mydocs
source venv/bin/activate

# 2.运行服务程序
mkdocs build

# 3.Deployment
tar -czvf site.tar.gz site
scp site.tar.gz root@121.43.154.253:/www/wwwroot/ztloadfield.com/doc/
