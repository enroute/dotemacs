dotemacs
========

.emacs, including necessary packages

========
# How to use?
```
$ cd ~
$ git clone git@github.com:enroute/dotemacs.git
$ ln -s dotemacs/.emacs.d .emacs.d
$ ln -s dotemacs/.emacs.d/.emacs .emacs
```
========
# Packages which may be required
```
apt-get install w3m-el cscope-el yasnippet
```

For emacs with version less than 24, emacs-goodies-el might also be necessary:
```
apt-get install emacs-goodies-el
```


========
# Useful commands
## Mode independent commands

```
M-!          shell-command
M-|          shell-command-on-region
M-x          execute-extended-command
C-x z        repeat
C-x ESC ESC  repeat-complex-command
C-/          undo

             describe-char
C-h k        describe-key
C-h f        describe-function
C-h m        describe-mode
C-h i        info
C-h a        apropos-command
C-h C-f      view-emacs-FAQ
C-h b        describe-bindings

C-x b        switch-to-buffer/ido-switch-buffer
C-x C-q      toggle-read-only (set `view-read-only' to enter view-mode automatically)
C-x RET r    revert-buffer-with-coding-system

             recover-session
             recover-file

C-g          keyboard-quit

M-u          upcase-word
M-l          downcase-word
M-c          capitalize-word
C-x C-u      upcase-region
C-x C-l      downcase-region

M-h          mark-paragraph
C-x h        mark-whole-buffer
M-@          mark-word

C-x C-o      delete-blank-lines
M-SPC        just-one-space
M-\          delete-horizontal-space
             flush-lines
```

## Mode dependent commands

```
C-c C-s      c-show-syntactic-information
C-c <left>   winner-undo
```

## Misc
The following key bindings may not work in all buffers, (e.g. *Help*).
```
C-c C-h      list key bindings starting with C-c
C-x C-h      list key bindings starting with C-x
C-x 8 C-h    list key bindings starting with C-x 8
C-x 4 C-h    list key bindings starting with C-x 4
C-x r C-h    list key bindings starting with C-x r
```

## Align
When `align' has no effect, `table-capture' and `table-release' can be used to line up text.
