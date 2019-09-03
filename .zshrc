#!/usr/bin/env zsh


#######################  zplug ###############################
source "${HOME}/.zplug/init.zsh"

zplug "sorin-ionescu/prezto"
zplug "b4b4r07/enhancd", use:init.sh

zplug load 
# zplug load --verbose


####################### prezto ###############################
#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Enable: zsh-completions
if [[ -e "/usr/local/share/zsh-completions" ]]; then
    fpath=(/usr/local/share/zsh-completions $fpath)
fi
if [[ -e "$HOME/.zsh/completions" ]]; then
	fpath=($HOME/.zsh/completions $fpath)
fi
if [[ -e "/home/linuxbrew/.linuxbrew/share/zsh-completions" ]]; then
	fpath=(/home/linuxbrew/.linuxbrew/share/zsh-completions $fpath)
fi

autoload -U compinit
compinit

# Enable: History of Directory
setopt auto_pushd
# Enable: Command Auto-Fixing
setopt correct
# Disable: 'no matches found'
setopt nonomatch
# Enable: Completion dotfiles
setopt globdots

# Customize: zsh-autosuggestion
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=240"


# Enable Vi-Edit Mode in ZLE(zsh-line-edit)
# REF: https://qiita.com/b4b4r07/items/8db0257d2e6f6b19ecb9
bindkey -v

# vi-cmd-mode を抜けるキーバインドを Ctrl-Q に変更
# REF: https://superuser.com/questions/351499/how-to-switch-comfortably-to-vi-command-mode-on-the-zsh-command-line
bindkey -M viins '^Q' vi-cmd-mode
bindkey -M viins '^A' beginning-of-line
bindkey -M viins '^K' kill-line
bindkey -M viins '^L' clear-screen
bindkey -M viins '^U' kill-whole-line

# Prezto のテーマ 'paradox' 使用時に上に1行
# 空白が発生するのを防ぐため、PROMPT 環境変数
# を上書きする
PROMPT='${(e)$(prompt_paradox_build_prompt)}
 ${editor_info[keymap]} '


# history | fzf
function select-history() {
	if type "fzf" > /dev/null 2>&1; then
		BUFFER=$(history -n -r 1 | fzf --no-sort +m --query "$LBUFFER" --prompt="[History] > ")
		CURSOR=$#BUFFER
	else
    echo -n "'fzf' is not found. Do you install 'fzf' from Homebrew [y/n] ?: "
		read  answer < /dev/tty
		while [[ "$answer" != "y" && "$answer" != "n" ]]; do
      echo -n "'Please input 'y' or 'n': "
			read  answer < /dev/tty
		done
		if [[ "$answer" == "y" ]]; then
			brew install fzf
      exit
		fi
	fi
}
zle -N select-history
bindkey -M viins '^r' select-history

# ALIAS: ls
alias lla='ls -al'

# ALIAS: ghq
if type "ghq" > /dev/null 2>&1; then
	alias gg='ghq get'
	if type "fzf" > /dev/null 2>&1; then
		alias gcd='cd $(ghq root)/$(ghq list | fzf)'
		alias gls='ghq list | fzf'
	fi
fi

source ~/.zplug/repos/b4b4r07/enhancd/init.sh
