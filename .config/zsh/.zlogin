cat .config/zsh/.zlogin
case ${OSTYPE} in
    linux*)
    ## Start ssh-agent.
        if (( $+commands[ssh-agent] )) && [ -z ${SSH_AUTH_SOCK} ]; then
            if ls ${HOME}/.ssh | grep -q 'id_*'; then
                exec ssh-agent zsh
            fi
        fi
        ;;
esac
