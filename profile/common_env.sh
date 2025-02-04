if [[ -z "$DOTFILES" ]]; then
    echo "common_env.sh: could not determine DOTFILES dir"
    exit 1
fi

if [[ -z "${shell}" ]]; then
    echo "common_env.sh: 'shell' envar is not defined. it must be defined before sourcing this file."
    exit 1
fi

if test -f "$DOTFILES/config.sh"; then
    source $DOTFILES/config.sh
fi

# Add brew prefix to PATH
if [[ -z "$BREW_PREFIX" ]]; then
    if type "brew" >/dev/null 2>&1; then
        export BREW_PREFIX=$(brew --prefix)
    fi
fi

if [[ -z "$BREW_PREFIX" ]]; then
    echo "$DOTFILES/profile/common_env: could not locate brew. Do you need to export a custom BREW_PREFIX in $DOTFILES/config.sh ?"
    exit 1
else
    export PATH=$BREW_PREFIX/bin:$BREW_PREFIX/sbin:$PATH
    export MANPATH=$BREW_PREFIX/share/man:$MANPATH
fi

# Add Go-built binaries to PATH
export PATH=$HOME/go/bin:$PATH

if test -f "$DOTFILES/env.sh"; then
    source $DOTFILES/env.sh
fi
