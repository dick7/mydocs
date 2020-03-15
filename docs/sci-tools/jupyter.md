# Jupyter-Anaconda

## 1.Jupyter notebook/lab

> For server using [ref](https://blog.csdn.net/ds19991999/article/details/83663349?tdsourcetag=s_pctim_aiomsg).

- 1.1. **Installation**

`pip install jupyterlab`,it contains `jupyter-notebook`.

Or using:

`conda install jupyterlab`,when `Anaconda` is installed.

- 1.2. **Dependencies**

> 1.[yarn](https://yarn.bootcss.com/)

>> a.Already installed node.js
```
curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
```
>> b.No node.js, need repository
```
curl --silent --location https://rpm.nodesource.com/setup_12.x | sudo bash -
```
>> c.Then,install yarn
```
apt/yum install -y yarn-1.13.0
```

> 2.[node.js](https://nodejs.org/en/),as the repo added above

```
apt/yum install nodejs
```
Not recommended methods below:
~~using package getting from [nodejs.org](https://nodejs.org/en/)~~
```
# apt/yum install nodejs
wget https://npm.taobao.org/mirrors/node/v12.16.1/node-v12.16.1-linux-x64.tar.xz
tar -xzvf node-v12.16.1-linux-x64.tar.xz
ln -s ~/node-v12.16.1-linux-x64/bin/node /bin/node
```
and below:
~~using [nvm](https://github.com/nvm-sh/nvm#install--update-script) to install node.js~~
```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install 12.16.1
```

> 3.Pip install necessaries,if without ***Anaconda***

```
pip3 install ipython,matplotlib,scipy,pandas,numpy
```

- 1.3. **Configurations**

> 1.Set ***password***

`jupyter-notebook password`
`< *your-password*`

> 2.Generate hash password

```
ipython
from notebook.auth import passwd
passwd()
# 输入刚才设置登录JupyterLab界面的密码:*your-password*
< *your-password*
# 然后就会生产下面这样的 hash password
'sha1:bb4caf78bfd5:cffcff947961bb4978c388689c77fe6cc838f4f4'
```
> 3.Generate jupyter-lab config file and edit it as below,using the hash password above.

`jupyter lab --generate-config`
`vi ~/.jupyter/jupyter_notebook_config.py`
```
c.NotebookApp.allow_root = True
c.NotebookApp.ip = '0.0.0.0'
c.NotebookApp.notebook_dir = u'/root/JupyterLab'
c.NotebookApp.open_browser = False
c.NotebookApp.password = u'sha1:bb4caf78bfd5:cffcff947961bb4978c388689c77fe6cc838f4f4'
c.NotebookApp.port = 8080
```
> 4.For details, ig. github,latex,ssl...

`vi ~/.jupyter/jupyter_notebook_config.py`
(Too many output,neglect)

> 5.Change the json password

`cat ~/.jupyter/jupyter_notebook_config.json`
```
{
  "NotebookApp": {
    "nbserver_extensions": {
      "jupyterlab": true,
      "jupyterlab_git": true,
      "jupyter_nbextensions_configurator": true,
      "widgetsnbextension": true
    },
    "password": "sha1:bb4caf78bfd5:cffcff947961bb4978c388689c77fe6cc838f4f4"
  }
}
```

> 6.Build

```
jupyter-lab --version
1.2.6
jupyter lab build
```

> 7.Start up

```
nohup jupyter lab &
```
>> Note:http://ip:port/

> 8.Add `JupyterLab` extensions

`jupyter labextension list`
```
jupyter labextension install @jupyterlab/github
pip install jupyterlab_github
```
Config github token:
```
c.GitHubConfig.access_token = 'e450d6e1376c13d820fcdfe4da98ebce5797ffa4'
```

> 9.Add kernels

```
sudo pip2 install ipykernel
sudo pip3 install ipykernel
jupyter kernelspec list
```

## 2.Anaconda

- Install

`wget -c https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh`
`chmod +x ./*`
`./Anaconda3-2020.02-Linux-x86_64.sh`
`< yes`

`conda config --set auto_activate_base false`

- Config

**Default configurations**

`conda config --show`
```
add_anaconda_token: True
add_pip_as_python_dependency: True
aggressive_update_packages:
  - ca-certificates
  - certifi
  - openssl
allow_conda_downgrades: False
allow_cycles: True
allow_non_channel_urls: False
allow_softlinks: False
always_copy: False
always_softlink: False
always_yes: None
anaconda_upload: None
auto_activate_base: True
auto_stack: 0
auto_update_conda: True
bld_path:
changeps1: True
channel_alias: https://conda.anaconda.org
channel_priority: flexible
channels:
  - defaults
client_ssl_cert: None
client_ssl_cert_key: None
clobber: False
conda_build: {}
create_default_packages: []
croot: /root/anaconda3/conda-bld
custom_channels:
  pkgs/main: https://repo.anaconda.com
  pkgs/r: https://repo.anaconda.com
  pkgs/pro: https://repo.anaconda.com
custom_multichannels:
  defaults:
    - https://repo.anaconda.com/pkgs/main
    - https://repo.anaconda.com/pkgs/r
  local:
debug: False
default_channels:
  - https://repo.anaconda.com/pkgs/main
  - https://repo.anaconda.com/pkgs/r
default_python: 3.7
default_threads: None
deps_modifier: not_set
dev: False
disallowed_packages: []
download_only: False
dry_run: False
enable_private_envs: False
env_prompt: ({default_env})
envs_dirs:
  - /root/anaconda3/envs
  - /root/.conda/envs
error_upload_url: https://conda.io/conda-post/unexpected-error
execute_threads: 1
extra_safety_checks: False
force: False
force_32bit: False
force_reinstall: False
force_remove: False
ignore_pinned: False
json: False
local_repodata_ttl: 1
migrated_channel_aliases: []
migrated_custom_channels: {}
non_admin_enabled: True
notify_outdated_conda: True
offline: False
override_channels_enabled: True
path_conflict: clobber
pinned_packages: []
pip_interop_enabled: False
pkgs_dirs:
  - /root/anaconda3/pkgs
  - /root/.conda/pkgs
proxy_servers: {}
quiet: False
remote_backoff_factor: 1
remote_connect_timeout_secs: 9.15
remote_max_retries: 3
remote_read_timeout_secs: 60.0
repodata_fns:
  - current_repodata.json
  - repodata.json
repodata_threads: None
report_errors: None
restore_free_channel: False
rollback_enabled: True
root_prefix: /root/anaconda3
safety_checks: warn
sat_solver: pycosat
separate_format_cache: False
shortcuts: True
show_channel_urls: True
solver_ignore_timestamps: False
ssl_verify: True
subdir: linux-64
subdirs:
  - linux-64
  - noarch
target_prefix_override:
track_features: []
unsatisfiable_hints: True
unsatisfiable_hints_check_depth: 2
update_modifier: update_specs
use_index_cache: False
use_local: False
use_only_tar_bz2: False
verbosity: 0
verify_threads: 1
whitelist_channels: []
```

- Mirror Source config

```
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/bioconda
conda config --add channels https://mirrors.ustc.edu.cn/anaconda/pkgs/free/
# conda config --remove channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
conda config --set show_channel_urls yes
```

- Env config

```
conda info --envs # 查看环境
conda create -n myenv  # 创建一个环境

source activate myenv  # 激活进入 myenv环境

conda deactivate # 退出当前环境
conda env remove --name myenv # 移除环境
```

- Start up

> On desktop,`GUI,jupyter-lab/notebook,spyder...` all are available.

`conda activate`
```
# 1.Start GUI
anaconda-navigator
# 2.Start jupyter lab/notebook
jupyter lab
jupyter notebook
```

> On cloud,such as `baidu-yun`,`aliyun`,ONLY `jupyter-lab/notebook` is available.

```
# 2.Start jupyter lab/notebook
jupyter lab
jupyter notebook
```

- Conda install extensions

    **Like `pip`**

`conda list`
```
conda install r-base
conda install -c conda-forge jupyter_nbextensions_configurator
conda install numpy
conda install scipy
conda install pytorch
# conda install tensorflow
conda install matplotlib
conda install Django
conda install flask
```

