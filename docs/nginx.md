# Configration

## Templates

### master
```
user  www www;
worker_processes auto;
error_log  /www/wwwlogs/nginx_error.log  crit;
pid        /www/server/nginx/logs/nginx.pid;
worker_rlimit_nofile 51200;

events
    {
        use epoll;
        worker_connections 51200;
        multi_accept on;
    }

http
    {
        include       mime.types;
		#include luawaf.conf;

		include proxy.conf;

        default_type  application/octet-stream;

        server_names_hash_bucket_size 512;
        client_header_buffer_size 32k;
        large_client_header_buffers 4 32k;
        client_max_body_size 50m;

        sendfile   on;
        tcp_nopush on;

        keepalive_timeout 60;

        tcp_nodelay on;

        fastcgi_connect_timeout 300;
        fastcgi_send_timeout 300;
        fastcgi_read_timeout 300;
        fastcgi_buffer_size 64k;
        fastcgi_buffers 4 64k;
        fastcgi_busy_buffers_size 128k;
        fastcgi_temp_file_write_size 256k;
		fastcgi_intercept_errors on;

        gzip on;
        gzip_min_length  1k;
        gzip_buffers     4 16k;
        gzip_http_version 1.1;
        gzip_comp_level 2;
        gzip_types     text/plain application/javascript application/x-javascript text/javascript text/css application/xml;
        gzip_vary on;
        gzip_proxied   expired no-cache no-store private auth;
        gzip_disable   "MSIE [1-6]\.";

        limit_conn_zone $binary_remote_addr zone=perip:10m;
		limit_conn_zone $server_name zone=perserver:10m;

        server_tokens off;
        access_log off;

server
    {
        listen 888;
        server_name phpmyadmin;
        index index.html index.htm index.php;
        root  /www/server/phpmyadmin;

        #error_page   404   /404.html;
        include enable-php.conf;

        location ~ .*\.(gif|jpg|jpeg|png|bmp|swf)$
        {
            expires      30d;
        }

        location ~ .*\.(js|css)?$
        {
            expires      12h;
        }

        location ~ /\.
        {
            deny all;
        }

        access_log  /www/wwwlogs/access.log;
    }
include /www/server/panel/vhost/nginx/*.conf;

}

```

### worker
#### Transfer uwsgi_pass of ***flask-osroom***
```
server {
        # 监听80端端口
        listen 80;
        listen [::]:80;
        server_name dev.ztloadfield.com 121.43.154.253;
        gzip on;
        gzip_comp_level 5;
        gzip_types application/json text/plain application/javascript application/x-javascript text/javascript text/xml text/css;
        open_log_file_cache max=1000 inactive=20s valid=1m min_uses=2;
        access_log /www/wwwlogs/dev.ztloadfield.com.log;
        error_log /www/wwwlogs/dev.ztloadfield.com.error.log;
        location / {
             include      uwsgi_params;
             # upstream 的那个名称
             uwsgi_pass 127.0.0.1:5000;
             # python虚拟环境目录路径 
             # uwsgi_param UWSGI:_PYHOME /www/wwwroot/venv;
             # 项目目录路径 
             # uwsgi_param UWSGI_CHDIR /www/wwwroot/ztloadfield.com/dev/osroom;
             # uwsgi_param UWSGI_SCRIPT start:app;
          }
}
```

#### Transfer proxy_pass without uwsgi of ***flask-minimal***
```
server
{
	listen 8765;
	listen [::]:8765;
    server_name 121.43.154.253;
    # server_name 121.43.154.253; # test.ztloadfield.com
    index index.html index.htm default.htm default.html;
    root /www/wwwroot/ztloadfield.com/test/flaskapp;
    
    location / {

      proxy_set_header X-Forwarded-Host $host;

      proxy_set_header X-Forwarded-Server $host;

      proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;

      proxy_pass http://127.0.0.1:5050/;

  }

    access_log  /www/wwwlogs/test.ztloadfield.com.log;
    error_log  /www/wwwlogs/test.ztloadfield.com.error.log;
}

```

#### Transfer ***PHP-site***
```
server
{
    listen 80;
    listen [::]:80;
    server_name blog.new-realm.cn;
    index index.php index.html index.htm default.php default.htm default.html;
    root /www/wwwroot/new-realm.cn/blog;
    
    #SSL-START SSL相关配置，请勿删除或修改下一行带注释的404规则
    #error_page 404/404.html;
    #SSL-END
    
    #ERROR-PAGE-START  错误页配置，可以注释、删除或修改
    #error_page 404 /404.html;
    #error_page 502 /502.html;
    #ERROR-PAGE-END
    
    #PHP-INFO-START  PHP引用配置，可以注释或修改
    include enable-php-71.conf;
    #PHP-INFO-END
    
    #REWRITE-START URL重写规则引用,修改后将导致面板设置的伪静态规则失效
    include /www/server/panel/vhost/rewrite/blog.new-realm.cn.conf;
    #REWRITE-END
    
    #禁止访问的文件或目录
    location ~ ^/(\.user.ini|\.htaccess|\.git|\.svn|\.project|LICENSE|README.md)
    {
        return 404;
    }
    
    #一键申请SSL证书验证目录相关设置
    location ~ \.well-known{
        allow all;
    }
    
    location ~ .*\.(gif|jpg|jpeg|png|bmp|swf)$
    {
        expires      30d;
        error_log off;
        access_log /dev/null;
    }
    
    location ~ .*\.(js|css)?$
    {
        expires      12h;
        error_log off;
        access_log /dev/null; 
    }
    access_log  /www/wwwlogs/blog.new-realm.cn.log;
    error_log  /www/wwwlogs/blog.new-realm.cn.error.log;
}
```
