# Welcome to mydocs

> mydocs made by python [MkDocs](http://doc.ztloadfield.com:8500/mkdocs/)

- Source: *[mydocs](https://github.com/dick7/mydocs)*
- Site: [http://doc.ztloadfield.com/](http://doc.ztloadfield.com:8500)


## Commands

* `mkdocs new [dir-name]` - Create a new project.
* `mkdocs serve` - Start the live-reloading docs server.
* `mkdocs build` - Build the documentation site.
* `mkdocs -h` - Print help message and exit.

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
    - Fields: fields.md
    - Imgs: imgs.md
    - Links: links.md
    - SSH: ssh.md
    - Git/Github: git.md
    - Vi/Vim: vim.md
    - Linux/Shell: linux-shell.md
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

## add plugins
# plugins:
#   - 

# uncomment under line to use the "readthedocs" theme
# theme: readthedocs
```

