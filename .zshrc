# _______| |__  _ __ ___
#|_  / __| '_ \| '__/ __|
# / /\__ \ | | | | | (__
#/___|___/_| |_|_|  \___|

# no beep
setopt nobeep 

##google search and ddg search
##usage google query or ddg query
function ddg {
    word="${@}"
    query="https://duckduckgo.com/?q=$word"
    open "$query"
}

function google {
    word="${@}"
    query="https://www.google.com/search?q=$word"
    open "$query"
}

#bindkey -v # enables vim mode
# -------------------------------------------------------------------
# [alias]
## shortcuts
alias c="cat"
alias b="bat"
alias v='nvim'
alias cln="clear;lfetch"
alias cl="clear"
alias py="python"


# colors
alias ls='ls -G'
alias ll="ls -l"
alias la="ls -a"
alias lla="ll -a"
# using exa
alias ll="exa -l"
alias lla="exa -la"

alias tmux="tmux -u"

# -------------------------------------------------------------------


# >>> my functions <<<

mkcd() { # creates the directory and cd into it
  mkdir -p "$1" && cd "$1"
}

# -------------------------------------------------------------------
# man page coloring
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
# -------------------------------------------------------------------

#source of plugins
source ~/.zsh_plug/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh # for syntax highlighting


## >>> fzf <<< ##

# fzf setups

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix"

# OSX
    [ -f /usr/local/opt/fzf/shell/key-bindings.zsh ] && source /usr/local/opt/fzf/shell/key-bindings.zsh
    [ -f /usr/local/opt/fzf/shell/completion.zsh ] && source /usr/local/opt/fzf/shell/completion.zsh

autoload -U compinit; compinit
source ~/.zsh_plug/fzf-tab/fzf-tab.plugin.zsh # autocomplete with fzf plugin

bindkey '^g' fzf-cd-widget # ALT-C - cd into the selected directory
   
## --> commands used occasionally
# used by next two
cmd-fzf-widget() { 
    local cmds="$cmds"
    selectedCmd=$(echo "$cmds" | fzf --reverse --height 40%) # select the command
    BUFFER="$selectedCmd"
    local ret=$?
    zle reset-prompt
    return ret
}

cmd-bookmark-widget() {
    local cmds=$(cat ~/.local/scripts/cmdfzf.txt) # read the commands
    cmd-fzf-widget
    zle accept-line # prints the buffer in prompt and executes
}

zle     -N   cmd-bookmark-widget 
bindkey '^b' cmd-bookmark-widget

cmd-template-widget() {
    local cmds=$(cat ~/.local/scripts/cmdTemplate.txt) # read the commands
    cmd-fzf-widget
}

zle     -N   cmd-template-widget
bindkey '^y' cmd-template-widget

## <--

## >>> fzf alias <<<

## >>> other scritps <<<
## --> lsp and lst commands
function lsp { # lists all files and shows a preview
    ls -p | grep -v / | fzf --reverse --preview 'bat --style=numbers --color=always {}' --bind shift-up:preview-page-up,shift-down:preview-page-down
}

function lap { # lists all files and shows a preview
    la -p | grep -v / | fzf --reverse --preview 'bat --style=numbers --color=always {}' --bind shift-up:preview-page-up,shift-down:preview-page-down
}

function lst { # lists all dir and shows it's tree preview
    ls -d */ | fzf --reverse --preview 'tree -C {}' --bind shift-up:preview-page-up,shift-down:preview-page-down
}

[ -f ~/.zshrc.local ] && source ~/.zshrc.local

