#!/bin/bash
set -e

CUR_DIR=$(realpath $(dirname "$BASH_SOURCE"))

function err() {
    echo $* >&2
    exit
}

function linkfile() {
    if [[ $# -ne 2 ]]; then
        err "Arg number must eq 2"
    fi

    src=$1
    dest=$2
    if [[ -L $dest ]]; then
        rm -f $dest
        echo "Link file $dest exists, remove it first"
    fi

    ln -s $src $dest
    echo "Link $src to $dest"
}

declare -a LINK_PAIRS

# Use array instead of map cause bash < 4 do not supprot
# associated array
FISH_CONFIG_DIR="~/.config/fish"
LINK_PAIRS=(
    "$CUR_DIR/vim/vimrc | ~/.vimrc"
    "$CUR_DIR/vim/coc-settings.json | ~/.vim/coc-settings.json"
    "$CUR_DIR/fish/config.fish | $FISH_CONFIG_DIR/config.fish"
    "$CUR_DIR/fish/env.fish | $FISH_CONFIG_DIR/conf.d/env.fish"
    "$CUR_DIR/git/gitconfig | ~/.gitconfig"
    "$CUR_DIR/git/gitignore_global | ~/.gitignore_global"
    "$CUR_DIR/tmux/tmux.conf | ~/.tmux.conf"
    "$CUR_DIR/karabiner/karabiner.json | ~/.config/karabiner/karabiner.json"
)

for pair in "${LINK_PAIRS[@]}"; do
    src=$(echo $pair | awk -F'\|' '{print $1}' | awk '{$1=$1};1')
    dest=$(echo $pair | awk -F'\|' '{print $2}' | awk '{$1=$1};1')
    # expand tilde
    eval src=$src
    eval dest=$dest
    linkfile $src $dest
done
