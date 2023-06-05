# _______| |__  _ __ ___
#|_  / __| '_ \| '__/ __|
# / /\__ \ | | | | | (__
#/___|___/_| |_|_|  \___|

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.

# >>> lfetch <<<
#alias lfetch="printf '${RED}';figlet -w 200 -f standard '    NP'"

local COLOR="\e[31m" # USING ANSI COLORS
alias lfetch="printf '${COLOR}';figlet -w 200 -f standard 'C-137'"

# >>> making prompt
#PROMPT="[%F{124}%n%f] [%F{021}%~%f]
#->"

source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme
precmd() { print "" }
# <<< end of prompt scripts

#export 
export HOMEBREW_NO_AUTO_UPDATE=1
export PATH=${PATH}:/usr/local/mysql/bin/
export PATH=/usr/local/bin:$PATH

#nvmexport NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm



### my own source of script
##google search and ddg search
source ~/.scripts/searchScript.sh
##usage google query or ddg query

##adding task in tick tick to do list
source ~/.scripts/addTask.zsh

#source of plugins
source ~/.zsh_plug/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# bindkey -v # enables vim mode
# -------------------------------------------------------------------
### alias
## shortcuts
alias c="cat"
alias b="bat"
alias v='nvim'
alias cln="clear;lfetch"
alias cl="clear"
alias py="python"

# colors
alias ls='ls -G'
#alias ll="ls -l"
alias la="ls -a"
#alias lla="ll -a"
# using exa
alias ll="exa -l"
alias lla="exa -la"
# -------------------------------------------------------------------

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

## >>> fzf <<< ##
source /usr/local/opt/fzf/shell/key-bindings.zsh
source /usr/local/opt/fzf/shell/completion.zsh

bindkey '^g' fzf-cd-widget # ALT-C - cd into the selected directory

# ---> fzf plugins <---
source ~/.zsh_plug/fzf-tab/fzf-tab.plugin.zsh
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
    local cmds=$(cat ~/.scripts/cmdfzf.txt) # read the commands
    cmd-fzf-widget
    zle accept-line # prints the buffer in prompt and executes
}

zle     -N   cmd-bookmark-widget 
bindkey '^b' cmd-bookmark-widget

cmd-template-widget() {
    local cmds=$(cat ~/.scripts/cmdTemplate.txt) # read the commands
    cmd-fzf-widget
}

zle     -N   cmd-template-widget
bindkey '^y' cmd-template-widget

## <--

## >>> fzf alias <<<


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

# -------------------------------------------------------------------------------------------------

# following two are init for conda and nvm which makes zsh startup slow 
alias initconda="source ~/.scripts/slowdown/initconda.zsh"

# nvm setup
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
