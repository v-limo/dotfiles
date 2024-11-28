# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"

# Set Zsh theme
ZSH_THEME="robbyrussell"

# Enable command auto-correction
ENABLE_CORRECTION="true"

# Enable completion waiting dots
COMPLETION_WAITING_DOTS="true"

# Disable marking untracked files under VCS as dirty
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set command execution time stamp format in history
HIST_STAMPS="yyyy-mm-dd"

# Plugins
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  fzf
  z
  kubectl
  terraform
  nvm
)

# Source Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Set language environment
export LANG=en_US.UTF-8

# Preferred editor
export EDITOR='nvim'

# Fuzzy Finder (fzf) configuration
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Zoxide initialization
eval "$(zoxide init zsh)"

# Aliases
alias v='nvim'
# alias ls='ls --color=auto'
# alias ll='ls -la'
alias k='kubectl'
alias t='terraform'

# History settings
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS

# Key bindings
bindkey -v
bindkey '^P' up-line-or-search
bindkey '^N' down-line-or-search

# Enable syntax highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Enable autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Load NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Load FZF key bindings and completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Load Zsh Completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  autoload -Uz compinit
  compinit
fi

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"

# ----- Bat (better cat) -----
export BAT_THEME=tokyonight_night

# ---- Eza (better ls) -----
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"

# ---- Zoxide (better cd) ----
eval "$(zoxide init zsh)"
