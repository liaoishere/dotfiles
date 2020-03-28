#!/usr/bin/env fish
#
# Ansible
set -gx ANSIBLE_CONFIG $HOME/.ansible
set -gx ANSIBLE_INVENTORY $HOME/.ansible/hosts
set -gx ANSIBLE_NOCOWS 1
set -gx GEM_SOURCE https://ruby.taobao.org
set -gx LC_ALL "en_US.UTF-8"
set -gx LANG "en_US.UTF-8"
set -gx XML_CATALOG_FILES /usr/local/etc/xml/catalog

# grep
#set -gx GREP_OPTIONS '--color=auto'

# Pyenv
set -gx PYENV_ROOT /usr/local/var/pyenv

# Homebrew
set -gx HOMEBREW_BOTTLE_DOMAIN https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles

# Go
set -gx GOPATH ~/Projects/go
set -gx PATH $GOPATH/bin $PATH

# GNU-sed
set -gx PATH /usr/local/opt/gnu-sed/libexec/gnubin $PATH

# GPG
set -gx GPG_TTY (tty)

# FZF
# set -gx FZF_DEFAULT_COMMAND "fd --type f --hidden -E 'vendor/' -E 'bundles/' --no-ignore-vcs -I"
set -gx FZF_DEFAULT_COMMAND "fd --type f --hidden -E 'bundles/' -E '.git/'"
set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
set -gx FZF_DEFAULT_OPTS '--height 50% --layout=reverse --border'

# alias
alias v='vim'
alias l='ls -lvh'
alias h='history'
alias tailf='tail -f'
