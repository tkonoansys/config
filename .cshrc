alias ll        ls -lAF
alias hist      history

# A righteous umask
umask 022

set ignoreeof
set autolist

#set path = (/sbin /bin /usr/sbin /usr/bin /usr/games /usr/local/sbin /usr/local/bin)

setenv  EDITOR  vim
setenv  PAGER   less
setenv  BLOCKSIZE       K

if ($?prompt) then
    # An interactive shell -- set some stuff up
    # Set up prompt
    set promptchars = "%#"
    if ("$version" =~ tcsh*) then
        set prompt = "[%m:%c3] %n%# "
    else
        if ($uid) then
            set prompt = "[$host] $user% "
        else
            set prompt = "[$host] $user# "
    endif
    set filec
    set history = 100
    set savehist = 100
    set mail = (/var/mail/$USER)
    if ( $?tcsh ) then
        bindkey "^W" backward-delete-word
        bindkey -k up history-search-backward
        bindkey -k down history-search-forward
    endif
endif

## AnsysEM18.2 ##
setenv NO_DEP_CHECK 1
