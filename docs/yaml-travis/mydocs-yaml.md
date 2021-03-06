# mydocs yaml

```
site_name: mydocs-MkDocs

nav:
    - Home: index.md
    - MkDocs: mkdocs.md
    - Markdown: markdown.md
    - Yaml: 
      - mydocs yaml: mydocs-yaml.md
      - yaml intro: yaml.md
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
    language: 'en'
    tokenizer: '[\s\-\.]+'
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
