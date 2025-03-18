## {{
add_path(){
    if [[ -d $1 ]]; then
        export PATH=$1:${PATH}
    fi
}

case ${OSTYPE} in
    darwin*)
        # Add path for brew Apple Silicon.
        add_path "/opt/homebrew/sbin"
        add_path "/opt/homebrew/bin"
        ;;
    linux*)
        # Disable auto compinit at /etc/zsh/zshrc on Ubuntu.
        export skip_global_compinit=1
        ;;
esac

# Add path for local bin.
add_path "${HOME}/.local/bin"
# Add path for snap
add_path "/snap/bin"
# nvm
export NVM_DIR=${XDG_CONFIG_HOME}/nvm
# Remove duplicated path frim ${PATH}.
typeset -U path
## }}
