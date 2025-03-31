# .bash_profile
# Offloading to zsh if exists.
if [[ -x /bin/zsh ]]; then
    exec /bin/zsh -l
fi

#
## XDG base directories {{
#
# Prepare and export XDG base directories.
[[ ! -d ${HOME}/.config ]] && mkdir ${HOME}/.config
[[ -d ${HOME}/.config ]] && export XDG_CONFIG_HOME=${HOME}/.config

[[ ! -d ${HOME}/.local/share ]] && mkdir -p ${HOME}/.local/share
[[ -d ${HOME}/.local/share ]] && export XDG_DATA_HOME=${HOME}/.local/share

[[ ! -d ${HOME}/.local/state ]] && mkdir -p ${HOME}/.local/state
[[ -d ${HOME}/.local/state ]] && export XDG_STATE_HOME=${HOME}/.local/state

[[ ! -d ${HOME}/.cache/ ]] && mkdir ${HOME}/.cache
[[ -d ${HOME}/.cache/ ]] && export XDG_CACHE_HOME=${HOME}/.cache
## }}

#
## Set command path {{
#
case ${OSTYPE} in
    linux*)
        [[ -d /usr/local/sbin ]] && export PATH=/usr/local/sbin:${PATH}
        [[ -d ${HOME}/.local/bin ]] && export PATH=${HOME}/.local/bin:${PATH}
        ;;
esac
## }}

#
## Load .bashrc {{
#
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi
## }}
