# name: RobbyRussel
#
# You can override some default options in your config.fish:
#   set -g theme_display_git_untracked no

function _is_git_dirty
  set -l show_untracked (git config --bool bash.showUntrackedFiles)
  if [ "$theme_display_git_untracked" = 'no' -o "$show_untracked" = 'false' ]
    set untracked '--untracked-files=no'
  end
  echo (command git status -s --ignore-submodules=dirty $untracked ^/dev/null)
end

function fish_prompt
  set -l last_status $status
  set -l cyan (set_color -o cyan)
  set -l yellow (set_color -o yellow)
  set -l red (set_color -o red)
  set -l blue (set_color -o blue)
  set -l green (set_color -o green)
  set -l normal (set_color normal)

  if test $last_status = 0
      set arrow "$green➜ "
  else
      set arrow "$red➜ "
  end
  set -l cwd $cyan(basename (prompt_pwd))

  if [ (__fish_git_prompt) ]
    set -l branch_info (__fish_git_prompt | tr -d '() ')
    set -l branch_info $red{$branch_info}
    set git_info "$blue git:($branch_info$blue)"

    if [ (_is_git_dirty) ]
      set -l dirty "$yellow ✗"
      set git_info "$git_info$dirty"
    else
      set -l dirty "$green ✔"
      set git_info "$git_info$dirty"
    end
  end

  echo -n -s $arrow ' ' $cwd $git_info $normal ' '

  # virtualenv
  if set -q VIRTUAL_ENV
    echo -n -s (set_color -o brgreen) "[" (basename "$VIRTUAL_ENV") "]" (set_color normal) " "
  end
end

