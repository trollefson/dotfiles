# Source configs
source ~/alias

# Export
export EDITOR=vim
export GIT_EDITOR=vim
export HISTFILESIZE=20000
export HISTSIZE=10000
export HISTFILE=~/.zsh_history
export HISTCONTROL=ignoredups:erasedups

# Configure zsh prompt git integration
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%b'

# Define prompt format
export PROMPT='[%F{cyan}%n %F{magenta}%~%f ${vcs_info_msg_0_}]: '

# Setting minimum Mac OS Version for clang builds
export MACOSX_DEPLOYMENT_TARGET=10.14

# Reverse search settings
bindkey -v
bindkey '^R' history-incremental-search-backward

# Node Version Manager settings
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
