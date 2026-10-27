#!/usr/bin/env bash
# Bootstrap a machine: install packages, create runtime dirs, symlink with stow.
# Safe to re-run.
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Stow packages: common to every machine, plus per-OS extras
packages=(zsh)

case "$(uname -s)" in
  Darwin) os=darwin ;;
  Linux)  grep -qi microsoft /proc/version 2>/dev/null && os=wsl || os=linux ;;
  *)      echo "Unsupported OS: $(uname -s)" >&2; exit 1 ;;
esac
echo "==> Detected OS: $os"

[[ $os == wsl ]] && packages+=(wsl)

# Homebrew (macOS and Linuxbrew on WSL)
find_brew() {
  command -v brew 2>/dev/null && return
  for b in /opt/homebrew/bin/brew /home/linuxbrew/.linuxbrew/bin/brew; do
    [[ -x $b ]] && echo "$b" && return
  done
  return 1
}

if ! brew_bin="$(find_brew)"; then
  echo "==> Installing Homebrew"
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew_bin="$(find_brew)"
fi
eval "$("$brew_bin" shellenv)"

echo "==> Installing packages"
brew bundle --file="$DOTFILES/packages/Brewfile"

# Directories that zsh and friends expect but won't create themselves
echo "==> Creating XDG runtime directories"
mkdir -p \
  "$HOME/.local/state/zsh" \
  "$HOME/.local/state/less" \
  "$HOME/.cache/zsh" \
  "$HOME/.local/share/gnupg"
chmod 700 "$HOME/.local/share/gnupg"

# Symlink
echo "==> Linking: ${packages[*]}"
stow --no-folding -d "$DOTFILES" -t "$HOME" "${packages[@]}"

# Machine-specific stubs (untracked)
[[ -e $HOME/.zshrc.local ]] || echo '# machine-specific zsh settings' > "$HOME/.zshrc.local"
[[ -e $HOME/.zshenv.local ]] || echo '# machine-specific environment variables' > "$HOME/.zshenv.local"

echo "==> Done. Open a new shell."
