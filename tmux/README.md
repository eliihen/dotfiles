# .tmux.conf
My tmux dotfile - place in, or symlink to home folder.

Inspired by http://tangosource.com/blog/a-tmux-crash-course-tips-and-tweaks/

### Tmux Plugin Manager
Thid dotfile requires [tpm](https://github.com/tmux-plugins/tpm).

```
$ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### .bashrc
I use the following sniplet in my .bashrc file to automatically start tmux for every new terminal window.
```
if [[ ! "$TMUX" ]]
then
  tmux
fi
```

