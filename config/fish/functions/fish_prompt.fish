# git prompt
# options
set __fish_git_prompt_show_informative_status 1
set __fish_git_prompt_showupstream "informative"
set __fish_git_prompt_showdirtystate "yes"

# colours
set __fish_git_prompt_color_branch brmagenta
set __fish_git_prompt_color_invalidstate red
set __fish_git_prompt_color_merging yellow
set __fish_git_prompt_color_stagedstate yellow
set __fish_git_prompt_color_cleanstate brgreen
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

# icons
set __fish_git_prompt_char_cleanstate "✓"
set __fish_git_prompt_char_invalidstate "✗"

# fish prompt
function fish_prompt
  set -l last_status $status

  set_color $fish_color_host
  printf '%s%s ' "$USER"@(prompt_hostname)

  set_color $fish_color_cwd
  printf '%s' (prompt_pwd)

  set_color normal
  printf '%s' (__fish_git_prompt)

  set_color yellow
  echo -n ' $ '

  set_color normal
end
