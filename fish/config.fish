# Path to Oh My Fish install.
set -gx OMF_PATH /Users/Liao/.local/share/omf
set -gx LSCOLORS Gxfxcxdxbxegedabagacad
set fish_greeting ""

# Customize Oh My Fish configuration path.
set -gx OMF_CONFIG /Users/Liao/.config/omf

# Custom env
source ~/.config/fish/env.fish

# Autojump
[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

# pipenv
set -gx pipenv_fish_fancy yes
eval (pipenv --completion)
set -gx PIPENV_PYPI_MIRROR https://mirrors.ustc.edu.cn/pypi/web/simple

# iterm2 shell integration
# test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

command -v vg >/dev/null 2>&1; and vg eval --shell fish | source
