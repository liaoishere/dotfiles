#!/usr/bin/env fish
#
set -gx LC_ALL "en_US.UTF-8"
set -gx LANG "en_US.UTF-8"
set -gx XML_CATALOG_FILES /usr/local/etc/xml/catalog

# zlib
#set -gx LDFLAGS "-L/usr/local/opt/zlib/lib"
#set -gx CPPFLAGS "-I/usr/local/opt/zlib/include"
#set -gx PKG_CONFIG_PATH "/usr/local/opt/zlib/lib/pkgconfig"

# Ansible
set -gx ANSIBLE_CONFIG $HOME/.ansible
set -gx ANSIBLE_INVENTORY $HOME/.ansible/hosts
set -gx ANSIBLE_NOCOWS 1

# Homebrew
set -gx HOMEBREW_BOTTLE_DOMAIN https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles
set -gx fish_user_paths "/usr/local/sbin" $fish_user_paths

# FZF
# default bat theme, used by fzf preview script
set -gx BAT_THEME 'Dracula'
set -gx FZF_DEFAULT_COMMAND "fd --type f --hidden -E 'bundles/' -E '.git/'"
# set -gx FZF_DEFAULT_COMMAND "fd --type f --hidden --no-ignore-vcs -I -E '.git/'"
set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
set -gx FZF_DEFAULT_OPTS "--height 50% --layout=reverse --border"

# GNU-sed
set -gx PATH /usr/local/opt/gnu-sed/libexec/gnubin $PATH

# GPG
set -gx GPG_TTY (tty)

# Go
set -gx PATH (go env GOPATH)/bin $PATH

# Pyenv
set -gx PYENV_ROOT /usr/local/var/pyenv

# Pipenv
set pipenv_fish_fancy yes
set -gx PIPENV_PYPI_MIRROR https://mirrors.ustc.edu.cn/pypi/web/simple

# Ruby
set -gx GEM_SOURCE https://ruby.taobao.org

# Rust
set -gx PATH $HOME/.cargo/bin $PATH
set -gx RUSTUP_DIST_SERVER https://mirrors.ustc.edu.cn/rust-static
set -gx RUSTUP_UPDATE_ROOT https://mirrors.ustc.edu.cn/rust-static/rustup

# NVM
set -gx NVM_DIR $HOME/.nvm
