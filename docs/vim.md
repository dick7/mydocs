# vi/[vim](http://www.vim.org/)

- 1.[vimrc](https://github.com/dick7/vimrc)

- 2.[vim:cheatsheat](http://www.cheat-sheets.org/#Vim)

## 2. vim 键盘图：

- ![vim:keymap](imgs/vi-vim-cheat-sheet-sch.gif)

## 3. vi/vim 的使用

基本上 vi/vim 共分为三种模式，分别是命令模式（Command mode），输入模式（Insert mode）和底线命令模式（Last line mode）。 这三种模式的作用分别是：
命令模式：

用户刚刚启动 vi/vim，便进入了命令模式。

此状态下敲击键盘动作会被Vim识别为命令，而非输入字符。比如我们此时按下i，并不会输入一个字符，i被当作了一个命令。

以下是常用的几个命令：
```
    i 切换到输入模式，以输入字符。
    x 删除当前光标所在处的字符。
    : 切换到底线命令模式，以在最底一行输入命令。
```
若想要编辑文本：启动Vim，进入了命令模式，按下i，切换到输入模式。

命令模式只有一些最基本的命令，因此仍要依靠底线命令模式输入更多命令。
输入模式

在命令模式下按下i就进入了输入模式。

在输入模式中，可以使用以下按键：
```
    字符按键以及Shift组合，输入字符
    ENTER，回车键，换行
    BACK SPACE，退格键，删除光标前一个字符
    DEL，删除键，删除光标后一个字符
    方向键，在文本中移动光标
    HOME/END，移动光标到行首/行尾
    Page Up/Page Down，上/下翻页
    Insert，切换光标为输入/替换模式，光标将变成竖线/下划线
    ESC，退出输入模式，切换到命令模式
```
底线命令模式

在命令模式下按下:（英文冒号）就进入了底线命令模式。

底线命令模式可以输入单个或多个字符的命令，可用的命令非常多。

在底线命令模式中，基本的命令有（已经省略了冒号）：

    q 退出程序
    w 保存文件

按ESC键可随时退出底线命令模式。

简单的说，我们可以将这三个模式想成底下的图标来表示：

![vim:workmodel](imgs/vim-vi-workmodel.png)

## 4. vi/vim 使用实例

- 查找：`/`
- 查找-替换：`:%s/AAA/BBB/g`,其中 '%'表示同一文件内的所有内容，不加表示光标所在行。

    联想：与Linux的 `sed -i s/AAA/BBB/g `grep AAA -rl ./`` 命令相似。
-
