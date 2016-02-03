### .zshrc files for ktnyt
## Paths
# export PATH=$PATH:$HOME/opt/bin
# export LD_LIBRARY_PATH=$PATH:$HOME/opt/lib
# export PKG_CONFIG_PATH=$PATH:$HOME/opt/lib/pkgconfig

## Aliases
alias ls="ls -G"
alias rm="rm -i"
alias q="exit"

## Git aliases
alias gst="git status -s -b"
alias gush="git push"
alias gull="git pull"
alias gecko="git checkout"
alias gerge="git merge"
alias granch="git branch"

## Completion
zstyle ':completion:*' completer _expand _complete _ignored _correct
zstyle ':completion:*' file-sort name
zstyle ':completion:*' ignore-parents parent pwd .. directory
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list '' 'r:|[._-]=** r:|=**' 'm:{[:lower:]}={[:upper:]}' 'l:|=* r:|=*'
zstyle ':completion:*' menu select=2
zstyle ':completion:*' original true
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/home/kotone/.zshrc'

# Load completion
autoload -Uz compinit
compinit
setopt auto_list
setopt list_types
setopt auto_menu
setopt auto_param_keys
setopt auto_param_slash
setopt magic_equal_subst

## zmv
autoload -Uz zmv
alias zmv='noglob zmv -W'
LISTMAX=0

## History
HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000

## Colors
autoload colors
colors

## Prompts
setopt prompt_subst

## Show branch name in Zsh's prompt
autoload -Uz VCS_INFO_get_data_git; VCS_INFO_get_data_git 2> /dev/null

function git-current-branch {
        local name st color gitdir action
        if [[ "$PWD" =~ '/¥.git(/.*)?$' ]]; then
                return
        fi
        name=`git rev-parse --abbrev-ref=loose HEAD 2> /dev/null`
        if [[ -z $name ]]; then
                return
        fi

        gitdir=`git rev-parse --git-dir 2> /dev/null`
        action=`VCS_INFO_git_getaction "$gitdir"` && action="($action)"

        st=`git status 2> /dev/null`
        if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
                color=%F{green}
        elif [[ -n `echo "$st" | grep "^nothing added"` ]]; then
                color=%F{yellow}
        elif [[ -n `echo "$st" | grep "^# Untracked"` ]]; then
                color=%B%F{red}
        else
                 color=%F{red}
         fi

        echo "$color$name$action%f%b "
}

PROMPT='[`git-current-branch`${PWD}]
%U@%m >>%u '

## Miscellaneous settings
setopt correct
setopt autocd notify
unsetopt beep
bindkey -e
