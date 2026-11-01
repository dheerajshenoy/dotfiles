# Make a directory and cd into it
mkcd() { mkdir -p -- "$1" && cd -- "$1" }

_set_title() { print -Pn "\e]0;%~\a" }


# History
HISTSIZE=10000
SAVEHIST=20000
HISTFILE=~/.zsh_history

setopt APPEND_HISTORY
setopt AUTO_CD
setopt AUTO_PUSHD
setopt EXTENDED_GLOB
setopt GLOB_DOTS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_REDUCE_BLANKS
setopt PROMPT_SUBST
setopt PUSHD_IGNORE_DUPS
setopt SHARE_HISTORY

# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Set terminal title to the current directory
autoload -Uz add-zsh-hook vcs_info colors && colors

add-zsh-hook precmd _set_title
add-zsh-hook precmd vcs_info


autoload -Uz compinit
compinit

# Better completion menu
zstyle ':completion:*' menu select

# Group completions
zstyle ':completion:*' group-name ''

# Colorized completion (important)
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

bindkey -e  # Emacs-style (default, safe)

# History search with arrows
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# Better word movement
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

# Configure what to show
zstyle ':vcs_info:git:*' formats ' (%b)'           # clean: (main)
zstyle ':vcs_info:git:*' actionformats ' (%b|%a)'  # mid-action: (main|REBASE)
zstyle ':vcs_info:*' enable git

PROMPT='%F{cyan}%(4~|…/%3~|%~)%f%F{yellow}${vcs_info_msg_0_}%f $ '

# ALIASES

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias tconf='$EDITOR ~/.tmux.conf'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias dot='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
# alias ls='ls -p --color=auto'
alias ls='eza'
# alias grep='grep --color=auto'
alias grep='rg'
alias zrc='$EDITOR ~/.zshrc'
alias sozrc='source ~/.zshrc'
alias lg='lazygit'
alias oe='nvim $(fzf)'
alias tree='tree -a'

# PACMAN ALIASES
## Load only if `pacman` is installed
if command -v pacman &> /dev/null; then
    alias pacs='sudo pacman -S'
    alias pacss='pacman -Ss'
    alias pacu='sudo pacman -Syyu'
    alias pacr='sudo pacman -Rns'
fi

# GIT ALIASES
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gl='git log --oneline'

# fzf stuff
export FZF_CTRL_R_OPTS="
  --height 40%
  --layout reverse
  --preview 'echo {}'
  --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'"
source <(fzf --zsh)

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
eval "$(zoxide init zsh)"
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh   # keep last
