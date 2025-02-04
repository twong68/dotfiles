if ! type "starship" > /dev/null; then
  # starship not installed. exit silently
  return
fi

# Point STARSHIP_CONFIG to our dotfiles
export STARSHIP_CONFIG="$DOTFILES/starship/config.toml"

# Start prompt
eval "$(starship init $shell)"
