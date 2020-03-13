# Jupyter-Book Writing Books With Jupyter-Notebook

Start.

## 1.Install

```
pip install jupyter-book
```

## 2.Create
```
jupyter-book create myJupyter-book --demo
```
`tree myJupyter-book -L 2`
```
myJupyter-book/
├── Gemfile
├── Gemfile.lock
├── Guardfile
├── Makefile
├── _bibliography
│   └── references.bib
├── _config.yml
├── _data
│   └── toc.yml
├── _includes
│   ├── buttons
│   ├── buttons.html
│   ├── css_entry.scss
│   ├── fb_tags.html
│   ├── footer.html
│   ├── google_analytics.html
│   ├── head.html
│   ├── js
│   ├── mathjax.html
│   ├── metadata.json
│   ├── page-nav.html
│   ├── search
│   ├── sidebar.html
│   └── topbar.html
├── _layouts
│   └── default.html
├── _sass
│   ├── components
│   ├── hamburgers
│   ├── main.scss
│   ├── objects
│   └── page
├── assets
│   ├── css
│   ├── custom
│   ├── html
│   ├── images
│   └── js
├── content
│   ├── 01
│   ├── 02
│   ├── 03
│   ├── 04
│   ├── LICENSE.md
│   ├── advanced
│   ├── beta
│   ├── contributing.md
│   ├── features
│   ├── guide
│   ├── images
│   ├── intro.ipynb
│   └── test_pages
├── requirements.txt
├── runtime.txt
└── scripts
    ├── __pycache__
    └── clean.py

31 directories, 26 files
```
All your writes is in `/content`: `features.md` and `notebooks.ipynb`.

## 3.Theme

Notice: `css` and `js`.

The `yml` markup structure of the book.

## 4.Build

```
jupyter-book build mybookname
```
To generate `Markdown` files being used by `Jekyll`.

Then:

`tree myJupyter-book -L 2`
```
myJupyter-book/
├── Gemfile
├── Gemfile.lock
├── Guardfile
├── Makefile
├── _bibliography
│   └── references.bib
├── _build
│   ├── 01
│   ├── 02
│   ├── 03
│   ├── 04
│   ├── advanced
│   ├── contributing.html
│   ├── features
│   ├── guide
│   ├── images
│   ├── intro.html
│   └── test_pages
├── _config.yml
├── _data
│   └── toc.yml
├── _includes
│   ├── buttons
│   ├── buttons.html
│   ├── css_entry.scss
│   ├── fb_tags.html
│   ├── footer.html
│   ├── google_analytics.html
│   ├── head.html
│   ├── js
│   ├── mathjax.html
│   ├── metadata.json
│   ├── page-nav.html
│   ├── search
│   ├── sidebar.html
│   └── topbar.html
├── _layouts
│   └── default.html
├── _sass
│   ├── components
│   ├── hamburgers
│   ├── main.scss
│   ├── objects
│   └── page
├── assets
│   ├── css
│   ├── custom
│   ├── html
│   ├── images
│   └── js
├── content
│   ├── 01
│   ├── 02
│   ├── 03
│   ├── 04
│   ├── LICENSE.md
│   ├── advanced
│   ├── beta
│   ├── contributing.md
│   ├── features
│   ├── guide
│   ├── images
│   ├── intro.ipynb
│   └── test_pages
├── requirements.txt
├── runtime.txt
└── scripts
    ├── __pycache__
    └── clean.py

41 directories, 28 files
```
