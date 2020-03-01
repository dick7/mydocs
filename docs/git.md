# Git/Github

## 1.git push without password

ssh-keygen 公钥生成
git config --global user.email "xxx@xxmail.com"
git config --global user.name "xxx"
git config --global user.password "xxx"
git config --global credential.helper store # git push的时候记住用户名和密码
git config --global push.default simple
