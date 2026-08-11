ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share/zinit/zinit.git}"
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

#Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

#Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

#Load completions
autoload -U compinit && compinit

#History
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

#Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

#Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':copmletion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

#Aliases
alias ls='ls --color'

#Load local zshrc
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# bun completions
[ -s "/home/elouchez/.bun/_bun" ] && source "/home/elouchez/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# opencode
export PATH=/home/elouchez/.opencode/bin:$PATH
export PATH="$PATH:$HOME/Android/Sdk/cmdline-tools/latest/bin:$HOME/Android/Sdk/platform-tools"
