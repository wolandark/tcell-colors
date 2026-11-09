# tcell-colors

Vim9script color previews for Go files. Requires Vim 9 with syntax highlighting, and a GUI
or a true color terminal with `set termguicolors`.

Highlights the complete constant, with its RGB background and contrasting
black or white text:

```go
style.Foreground(tcell.ColorRed).Background(tcell.ColorDarkSlateGrey)
style.Foreground(tcell.Color196) 							 // tcell v2 indexed colors, 16–255
style.Foreground(color.Red).Background(color.XTerm196) // tcell v3, 0–255
```

The palette follows [tcell's color definitions](https://github.com/gdamore/tcell/blob/main/color/color.go),
including the Grey aliases. Syntax highlighting updates previews as you edit,
and changing colorschemes restores the highlight groups automatically.

Scope: literal constants with the default `tcell` and `color` package names,
including occurrences in strings and comments. 

Terminal palette customization may change how tcell renders indexed colors, previews use tcell's reference RGB values.

To install, clone the repo in `~/.vim/pack/plugins/start/`.
