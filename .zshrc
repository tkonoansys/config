## Auto completion settings.
# Set auto completion.
autoload -U compinit
compinit
# Show dense list. 
setopt list_packed

# Correct command.
setopt correct

## Language setting.
export LANG=en_US.UTF-8

## Keybindings.
# Set emacs-like keybinding.
bindkey -e

## Prompt settings.
case ${UID} in
0)
    PROMPT="%B%{ESC[34m%}[${USER}@${HOST%%.*}:%/]#%{ESCm%}%b "
    PROMPT2="%B%{ESC[34m%}[%_]#%{ESCm%}%b "
    SPROMPT="%B%{ESC[34m%}%r is correct? [n,y,a,e]:%{ESCm%}%b "
    ;;
*)
    PROMPT="%{ESC[34m%}[${USER}@${HOST%%.*}:%/]$%{ESCm%} "
    PROMPT2="%{ESC[34m%}[%_]$%{ESCm%} "
    SPROMPT="%{ESC[34m%}%r is correct? [n,y,a,e]:%{ESCm%} "
    ;;
esac

## History settings.
# Location of history file.
HISTFILE=~/.zsh_history
# Size of history file.
HISTSIZE=10000
SAVEHIST=10000
# Ignore duplication from command history.
setopt hist_ignore_dups
# Share command history.
setopt share_history

## Various settings.
# Disable beep.
setopt nolistbeep
