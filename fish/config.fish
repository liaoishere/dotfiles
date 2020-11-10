# alias
alias v='vim'
alias l='ls -lvh'
alias h='history'
alias tailf='tail -f'

# Fundle init
if not functions -q fundle; eval (curl -sfL https://git.io/fundle-install); end
fundle plugin 'dracula/fish'
fundle plugin 'oh-my-fish/plugin-osx'
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

# virtual go
command -v vg >/dev/null 2>&1; and vg eval --shell fish | source

# load functions
set -l functions_dir (dirname (readlink -n (status --current-filename)))/functions
if test -d $functions_dir
    for f in $functions_dir/*.fish
        source $f
    end
end

# iterm2 shell integration
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
