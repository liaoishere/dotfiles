# Fundle init
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

# Autojump
[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish

# iterm2 shell integration
# test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

command -v vg >/dev/null 2>&1; and vg eval --shell fish | source

# alias
alias v='vim'
alias l='ls -lvh'
alias h='history'
alias tailf='tail -f'
