# .zshrc file for zsh(1)
#
# y-philly <yasuhiro.phil81.gmail.com>
#
# Thansk for Daichi GOTO's article <https://news.mynavi.jp/series/zsh>

export LANG=ja_JP.UTF-8
case ${UID} in
0)
    LANG=C
    ;;
esac
export PATH=~/bin:${PATH}
case "${OSTYPE}" in
msys)
  export XDG_CONFIG_HOME=~/.config
  ;;
esac

## Appearance
#
autoload -Uz colors && colors
case ${UID} in
0)
  PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') %B%{${fg[red]}%}%/#%{${reset_color}%}%b "
  PROMPT2="%B%{${fg[red]}%}%_#%{${reset_color}%}%b "
  SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
  ;;
*)
  PROMPT="%{${fg[cyan]}%}%n@$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') %{${fg[green]}%}%~%%%{${reset_color}%} "
  PROMPT2="%{${fg[red]}%}%_%%%{${reset_color}%} "
  SPROMPT="%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
esac
# git repository status
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
RPROMPT='${vcs_info_msg_0_}'

## Basic options
#
setopt auto_cd
setopt auto_pushd
setopt correct
setopt list_packed
setopt noautoremoveslash
setopt nolistbeep

## Keybind configuration
#
# emacs like keybind (e.x. Ctrl-a gets to line head and Ctrl-e gets
#   to end) and something additions
#
bindkey -e
bindkey "^[[1~" beginning-of-line # Home gets to line head
bindkey "^[[4~" end-of-line # End gets to line end
bindkey "^[[3~" delete-char # Del
# historical backward/forward search with linehead string binded to ^P/^N
#
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end
# reverse menu completion binded to Shift-Tab
#
bindkey "\e[Z" reverse-menu-complete

## Command history configuration
#
HISTFILE=${HOME}/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

## Completion configuration
#
fpath=(${HOME}/.zsh/functions/Completion ${fpath})
autoload -Uz compinit && compinit

## zsh editor
#
autoload zed

## Aliases
#
setopt complete_aliases

alias where="command -v"
alias j="jobs -l"

alias ls="ls --color"

alias la="ls -a"
alias lf="ls -F"
alias ll="ls -l"

alias du="du -h"
alias df="df -h"

alias su="su -l"

alias cd-git-root="cd `git rev-parse --show-toplevel`"

case "${OSTYPE}" in
msys)
  alias x="start"
  alias nvim="nvim-qt"
  ;;
esac

## ls color
#
case "${TERM}" in
xterm*)
  export LSCOLORS=exfxcxdxbxegedabagacad
  export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
  zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
  ;;
esac
