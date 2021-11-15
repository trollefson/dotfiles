# Source configs
source ~/alias

# Export
export EDITOR=vim
export GIT_EDITOR=vim
export HISTFILESIZE=20000
export HISTSIZE=10000
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
