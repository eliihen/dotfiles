# vimrc

This is my vimrc. Clone it and symlink the `.vimrc` file in this folder to your
home folder for unmitigated awesomeness

This file requires Vundle to work

```bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
```

## Oxeded theme
To install it, simply place it in the correct folder

```bash
mkdir -p ~/.vim/colors/
wget https://raw.githubusercontent.com/queyenth/oxeded.vim/master/colors/oxeded.vim
```

## YouCompleteMe

YouCompleteMe has a compiled componend and this needs some setup. Ensure
python2, node and npm are installed and presebd in PATH, then

```bash
cd ~/.vim/bundle/YouCompleteMe
python2 install.py --clang-completer --tern-completer
```

If you open a javascript-file, YCM will show an error message if there is no
`.tern-project` file in the root of the project. This is because it uses the
tern completer to do its javascript magic and uses this file to tailor the
suggestions depending on what type of libraries are used, etc. An example
file looks like this

```javascript
{
  "libs": [
    "browser",
    "ecma6",
    "underscore",
  ],
  "loadEagerly": [
    "importantfile.js",
    "app/components/**/*.js"
  ],
  "plugins": {
    "es_modules": {}
  }
}
```

See the [defs folder](https://github.com/ternjs/tern/tree/master/defs) in the
project for what libs are supported.

Files listed in the `loadEagerly` section will

See the [plugin folder](https://github.com/ternjs/tern/tree/master/plugin) in
the project for what plugins are supported. The plugins object helps tern figure
out what other objects/files/modules are loaded on keywords like `import`.

## UltiSnips

Remember to install some languages for UltiSnips by running the following in vim
```
:UltiSnipsAddFiletypes javascript
:UltiSnipsAddFiletypes html
:UltiSnipsAddFiletypes java
:UltiSnipsAddFiletypes markdown
```

Also add more than the presets by typing `:UltiSnipsEdit` and entering a snippet
like this

    snippet `
    \`\`\`
    ${1:code}
    \`\`\`
    endsnippet

# FZF

Fuzzy search with `<Ctrl-P>`. Fast and nice.

```bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

# Resources

Check out these great resources for using vim more better-like!

* [A vim tutorial and
  primer](https://danielmiessler.com/study/vim/?fb_ref=118ef0e03ab54c0d8197214328648a68-Hackernews)
* [How I boosted my Vim](http://nvie.com/posts/how-i-boosted-my-vim/)
* [You don't need more than one cursor in vim](https://medium.com/@schtoeffel/you-don-t-need-more-than-one-cursor-in-vim-2c44117d51db)
* [Coming home to
  vim](http://stevelosh.com/blog/2010/09/coming-home-to-vim/#making-vim-more-useful)
* [How to boost your vim
  productivity](https://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/)

