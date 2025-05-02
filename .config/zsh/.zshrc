## OS specific settings before loading plugins {{
case ${OSTYPE} in
    linux*)
        # Add path for snap
        [[ -d "/snap/bin" ]] && export PATH="/snap/bin:${PATH}"
        # Disable auto compinit at /etc/zsh/zshrc on Ubuntu.
        [[ -f "/etc/zsh/zshrc" ]] && export skip_global_compinit=1
        # ls color.
        alias ls='ls -h --color=auto --time-style=long-iso'
        if [[ -s "${XDG_CONFIG_HOME}/dir_colors" ]]; then
            eval $(dircolors "${XDG_CONFIG_HOME}/dir_colors")
        else
            export LS_COLORS='di=01;34'
        fi
        ;;
esac

# Add path for local bin.
[[ -d "${HOME}/.local/bin" ]] && export PATH="${HOME}/.local/bin:${PATH}"
## }}

#
## General settings {{
#
# Set language.
export LANG='en_US.UTF-8'

# Ignore Ctrl+S.
stty stop undef
stty start undef

# Do not exit on end-of-file.
setopt ignore_eof

# Try to correct the spelling of commands.
setopt correct

# Disable beep.
setopt no_beep

# Suppress "no matches" message. 
setopt nonomatch

# Disable core dump.
limit coredumpsize 0

# Set emacs-like keybinding.
bindkey -e
## }}

#
## Color settings {{
#
# Set 24-bit color even though WSL or remote.
[[ -n ${WSLENV} || -n ${SSH_CLIENT} ]] && export COLORTERM='truecolor'
## }}

#
## Completion {{
#
# Set auto completion.
autoload -Uz compinit && compinit -d "${XDG_CACHE_HOME}/zsh/.zcompdump"

# Colorize completion items.
zstyle ':completion:*' list-colors di=34 ln=35 ex=31

# Highlight completion items.
zstyle ':completion:*:default' menu select=2

# Try to make the completion list smaller.
setopt list_packed

# Add a trailing slash to name of a directory instead of a space.
setopt auto_param_slash

# Remove trailing spaces after completion if needed.
setopt auto_param_keys

# Show the type of each file with a trailing identifying mark.
setopt list_types

# Automatically use menu completion after the second consecutive rquest.
setopt auto_menu

# Files beginning with a . be matched without explicitly specifying the dot.
setopt globdots

# The cursor stays there and completion is done from both ends.
setopt complete_in_word

# Print eight bit characters literally in completion lists.
setopt print_eight_bit

# Allow comments even in interactive shells
setopt interactive_comments

# Disable beep when complete list displayed.
setopt nolistbeep
## }}

#
## History {{
#
# Location of history file.
HISTFILE="${XDG_STATE_HOME}/zsh/history"

# Size of history file.
HISTSIZE=10000
SAVEHIST=10000

# Share command history.
setopt share_history

# Do not enter duplicated command lines into the history list.
setopt hist_ignore_dups

# Remove older duplicated command from the history list.
setopt hist_ignore_all_dups

# Remove command if first character is space lines from the history list. 
setopt hist_ignore_space

# Do not add history command to the history list.
setopt hist_no_store

# Remove superfluous blanks from each command line from the history list.
setopt hist_reduce_blanks
## }}

#
## Prompt settings {{
#
#PROMPT="%B%F{034}[%n@%m%F{004}:%~%F{034}]%#%f%b "
PROMPT="%F{004}"$'\ue0b6'"%f%B%K{004}%F{023}%n@%m%k%b%K{023}%F{004}"$'\ue0b4'"%f%k%K{023}%F{044} %~%f%k%F{023}"$'\ue0b4'"%f "
PROMPT2="%F{034}[%_]%#%k%f "
SPROMPT="%F{034}%r is correct? [n,y,a,e]:%k%f "
## }}

#
## Command specific settings {{
#
# Disable less history.
export LESSHISTFILE="-"

# Python
export PYTHON_HISTORY="${XDG_STATE_HOME}/python_history"
export PYTHONPYCACHEPREFIX="${XDG_CACHE_HOME}/python"
export PYTHONUSERBASE="${XDG_DATA_HOME}/python"

# pyenv
if (( ${+commands[pyenv]} )); then
    mkdir -p "${XDG_DATA_HOME}/pyenv"
    export PYENV_ROOT="${XDG_DATA_HOME}/pyenv"
    eval "$(pyenv init -)"
fi
# }}

#
## Aliases {{
#
if (( ${+commands[nvim]} )); then
    alias vi='nvim'
    alias vim='nvim'
    export EDITOR='nvim'
elif (( ${+commands[vim]} )); then
    alias vi='vim'
    export EDITOR='vim'
fi
if (( ${+commands[tmux]} )); then
    [[ -n ${TMUX} ]] && alias ssh='env TERM=xterm-256color ssh'
    export TMUX_TMPDIR='/tmp'
fi
if (( ${+commands[fdfind]} )); then
    alias fd='fdfind'
fi
## }}

# Remove duplicated path frim ${PATH}.
typeset -U path

# End of zprof
#(which zprof > /dev/null) && zprof | less
