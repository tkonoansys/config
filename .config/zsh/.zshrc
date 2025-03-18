#
## General settings {{
#
# Set language.
export LANG=en_US.UTF-8

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

# Set emacs-like keybinding.
bindkey -e
## }}

#
## Color settings {{
#
# Set 24-bit color.
if [[ -n ${WSLENV} ]] || [[ -n ${SSH_CLIENT} ]]; then
    export COLORTERM='truecolor'
fi
## }}

#
## Completion {{
#
# Set auto completion.
autoload -Uz compinit && compinit -d ${XDG_CACHE_HOME}/zsh/zcompdump

# Set location of zcompcache directory.
zstyle ':completion:*' cache-path ${XDG_CACHE_HOME}/zsh/zcompcache

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

# Automatically use menu completion after the cecond consecutive rquest.
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
HISTFILE=${XDG_STATE_HOME}/zsh/history

# Size of history file.
HISTSIZE=10000
SAVEHIST=10000

# Share command history.
setopt share_history

# Do not enter command lines into the history list
# if they are duplicates of the previous event.
setopt hist_ignore_dups

# If a new command line being added to the history list
# duplicates an older one, the older command is removed.
setopt hist_ignore_all_dups

# Remove command lines from the history list
# when the first charactoer on the line is a space.
setopt hist_ignore_space

# Remove superfluous blanks from each command line
# being added to the history list.
setopt hist_reduce_blanks
## }}

#
## Prompt settings {{
#
PROMPT="%B%F{034}[%n@%m%F{004}:%~%F{034}]%#%f%b "
PROMPT2="%F{034}[%_]%#%k%f "
SPROMPT="%F{034}%r is correct? [n,y,a,e]:%k%f "
## }}

#
## Command specific settings {{
#
# Disable less history.
export LESSHISTFILE=-

# ls color.
case ${OSTYPE} in
    linux*)
        alias ls='ls --color=auto'
        if [[ -f ${XDG_CONFIG_HOME}/dir_colors ]]; then
            eval $(dircolors ${XDG_CONFIG_HOME}/dir_colors)
        else
            export LS_COLORS='di=01;94'
        fi
        ;;
esac

# Don't print any hits of Homebrew.
if (( ${+commands[brew]} )); then
    export HOMEBREW_NO_ENV_HINTS=1
fi

# Python
export PYTHON_HISTORY=${XDG_STATE_HOME}/python_history
export PYTHONPYCACHEPREFIX=${XDG_CACHE_HOME}/python
export PYTHONUSERBASE=${XDG_DATA_HOME}/python

# pyenv
if (( ${+commands[pyenv]} )); then
    [[ ! -d ${XDG_DATA_HOME}/pyenv ]] && mkdir ${XDG_DATA_HOME}/pyenv
    export PYENV_ROOT="${XDG_DATA_HOME}/pyenv"
    eval "$(pyenv init -)"
fi

# npm
if [ -e ${^fpath}/zsh-nvm.zsh(N) ]; then
    [[ ! -d ${XDG_CONFIG_HOME}/npm ]] && mkdir ${XDG_CONFIG_HOME}/npm
    export NPM_CONFIG_USERCONFIG=${XDG_CONFIG_HOME}/npm/npmrc
fi
# }}

#
## Aliases {{
#
alias ll='ls -lAF'
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
    export TMUX_TMPDIR=/tmp
fi
## }}

# End of zprof
#if (which zprof > /dev/null) ;then
#  zprof | less
#fi
