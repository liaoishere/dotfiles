# Path to Oh My Fish install.
set -gx OMF_PATH /Users/Liao/.local/share/omf
set -gx LSCOLORS Gxfxcxdxbxegedabagacad

# Customize Oh My Fish configuration path.
set -gx OMF_CONFIG /Users/Liao/.config/omf

# Automatically install fundle
if not functions -q fundle; eval (curl -sfL https://git.io/fundle-install); end
fundle plugin 'edc/bass'
fundle plugin 'danhper/fish-ssh-agent'
fundle plugin 'tuvistavie/fish-fastdir'
fundle plugin '0rax/fish-bd'
fundle plugin 'sentriz/fish-pipenv'
fundle plugin 'jethrokuan/fzf'
fundle plugin 'docker/cli' --path 'contrib/completion/fish'
fundle plugin 'docker/compose' --path 'contrib/completion/fish'
fundle plugin 'jorgebucaran/getopts.fish'
fundle init

# Custom env
source ~/.config/fish/env.fish

# Autojump
[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

# iterm2 shell integration
# test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

command -v vg >/dev/null 2>&1; and vg eval --shell fish | source

# alias
alias v='vim'
alias l='ls -lvh'
alias h='history'
alias tailf='tail -f'
