# Setup

Requires the following dependencies, some of which installed below:

 * zsh
 * rubygems
 * oh-my-zsh
 * nodejs
 * npm
 * nvm
 * tmux

## Arch Linux
```bash
# pacaur -S zsh nodejs npm
$ sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
$ curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.30.2/install.sh | bash
$ gem install git-up
```

## Fedora Linux
```bash
# dnf install zsh nodejs npm
$ sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
$ curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.30.2/install.sh | bash
$ gem install git-up
```
