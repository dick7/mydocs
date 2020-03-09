# Welcome to mydocs

> mydocs made by python [MkDocs](http://doc.ztloadfield.com:8500/mkdocs/)

- Source: *[mydocs](https://github.com/dick7/mydocs)*
- Site: [http://doc.ztloadfield.com/](http://doc.ztloadfield.com:8500)


## Commands

* `mkdocs new [dir-name]` - Create a new project.
* `mkdocs serve` - Start the live-reloading docs server.
* `mkdocs build` - Build the documentation site.
* `mkdocs -h` - Print help message and exit.
* `mkdocs gh-deploy` - [Deploy on github address](https://dick7.github.io/mydocs/).

## Project layout

    mkdocs.yml    # The configuration file.
    docs/
        index.md  # The documentation homepage.
        ...       # Other markdown pages, images and other files.

## Now layout Tree

By run bash:

`cat mkdocs.yml >> docs/index.md`

```
site_name: mydocs-MkDocs

nav:
    - Home: index.md
    - MkDocs: mkdocs.md
    - Markdown: markdown.md
    - Yaml: yaml.md
    - Travis CI: 
      - Intro: travis.md 
      - Use: travis-1.md
    - Fields: fields.md
    - Imgs: imgs.md
    - Links: links.md
    - SSH: ssh.md
    - Git/Github: git.md
    - Vi/Vim: vim.md
    - Apt/pip/yum: apt.md
    - Linux/Shell: 
      - linux commands: linux-cmds.md
      - linux shell: linux-shell.md
    - Nginx: nginx.md
    - Databases:
        - MySQL: dbs/mysql.md
        - Mongo: dbs/mongo.md
    - Python: python.md
    - Django: django.md
    - Flask: flask.md
    - Cheat-Sheets: cheat-sheets.md
    - Diary-2020-3: 
        - Test: diaries/0.md
        - First day: diaries/20200303.md
        - Second day: diaries/4.md

markdown_extensions:
  - pymdownx.arithmatex
  - pymdownx.betterem:
      smart_enable: all
  - pymdownx.caret
  - pymdownx.critic
  - pymdownx.details
  - pymdownx.emoji:
      emoji_generator: !!python/name:pymdownx.emoji.to_svg
  - pymdownx.inlinehilite
  - pymdownx.magiclink
  - pymdownx.mark
  - pymdownx.smartsymbols
  - pymdownx.superfences
  - pymdownx.tasklist:
      custom_checkbox: true
  - pymdownx.tilde
  - footnotes
  - meta
  - admonition
  - codehilite
  - toc:
      permalink: true

# add plugins
plugins:
  - search
  - minify:
      minify_html: true
  - search
  - git-revision-date-localized:
      type: iso_datetime

# uncomment under line to use the "readthedocs" theme
# theme: readthedocs
# Need to install `pip install mkdocs-material`
theme: 
  name: 'material'
# custom_dir: 'mkdocs-material/material'
  palette:
    primary: 'green'
    accent: 'green'
  font:
    text: 'Ubuntu'
    #    code: 'Ubuntu Mono'
    code: 'Consolas'
  logo: 'imgs/ico-head.jpg'
# language: 'zh'
  language: 'en'

extra:
  search:
    language: 'en,zh'
  social:
    - type: 'github'
      link: 'https://github.com/dick7'
    - type: 'wechat'
      link: 'https://weixin.com/dick7_love'
    - type: 'linkedin'
      link: 'https://www.linkedin.com/in/dick7_love'
  manifest: 'manifest.webmanifest'

# google_analytics:
#  - 'UA-XXXXXXXX-X'
#  - 'auto'

repo_name: 'dick7/mydocs'
repo_url: 'https://github.com/dick7/mydocs'

copyright: 'Copyright &copy; 2020 - 2021 Dick Sven'

```

## README

***`README.md`***

> mydocs made by python [MkDocs](http://doc.ztloadfield.com:8500/)
> Themed by [mkdocs-material](https://github.com/squidfunk/mkdocs-material)

- Source: [*mydocs*](https://github.com/dick7/mydocs)
- Deploy site on: 
  - [**github**](https://dick7.github.io/mydocs/)
  - [**aliyun**](http://doc.ztloadfield.com:8500)



