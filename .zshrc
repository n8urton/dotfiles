#brew https://apple.stackexchange.com/questions/148901/why-does-my-brew-installation-not-work
eval "$(/opt/homebrew/bin/brew shellenv)"

#pyenv https://www.freecodecamp.org/news/python-version-on-mac-update/
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
fi
