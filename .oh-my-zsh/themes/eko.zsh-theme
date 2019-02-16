# sorin.zsh-theme
# screenshot: http://i.imgur.com/aipDQ.png

MODE_INDICATOR="%{$fg_bold[yellow]%}❮%{$reset_color%}%{$fg[yellow]%}❮❮%{$reset_color%}"
local return_status="%{$fg[yellow]%}%(?..⏎)%{$reset_color%}"

PROMPT='%{$fg[cyan]%}%c$(git_prompt_info) %(!.%{$fg_bold[yellow]%}#.%{$fg_bold[blue]%}$)%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[blue]%}git%{$reset_color%}:%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""
