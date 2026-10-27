# dotfiles

Personal configuration for macOS and WSL (Ubuntu), managed with [GNU Stow](https://www.gnu.org/software/stow/) and laid out per the [XDG Base Directory spec](https://specifications.freedesktop.org/basedir-spec/latest/).

## Quick start

```sh
git clone <repo-url> ~/dotfiles
cd ~/dotfiles
./install.sh
```

Then open a new shell. `install.sh` is safe to re-run.

On a fresh WSL install, Homebrew needs `curl`, `git`, and `build-essential` from apt first.

## How it works

Each top-level directory is a Stow package. Inside a package, paths mirror `$HOME`:

```
zsh/.config/zsh/.zshrc   ->  ~/.config/zsh/.zshrc
git/.config/git/config   ->  ~/.config/git/config
```

`install.sh` does the following:

1. Detects the OS (`darwin`, `wsl`, or `linux`).
2. Installs Homebrew if missing, then runs `brew bundle` on `packages/Brewfile`.
3. Creates XDG runtime directories that zsh and other tools expect.
4. Symlinks the packages with `stow --no-folding`.
5. Creates empty `~/.zshrc.local` and `~/.zshenv.local` if they don't exist.

`--no-folding` makes Stow link individual files and create real directories, so apps don't write caches and state into this repo.

## Layout

```
dotfiles/
├── install.sh          # bootstrap
├── packages/           # Brewfile(s): software to install (not Stow packages)
├── zsh/                # .zshenv and ~/.config/zsh (with os/ for per-OS files)
├── git/                # ~/.config/git
└── wsl/                # WSL-only helpers (e.g. wsl-open), linked only on WSL
```

## Common tasks

```sh
# Link a package manually
stow --no-folding -t ~ <package>

# Preview what Stow would do
stow -n -v --no-folding -t ~ <package>

# Unlink a package
stow -D -t ~ <package>

# Relink after adding or removing files in a package
stow -R --no-folding -t ~ <package>
```

To add a new tool, create `<tool>/` mirroring `$HOME` (for example `tmux/.config/tmux/tmux.conf`) and add it to the `packages` array in `install.sh`.

## OS-specific config

Shared zsh config lives in `.zshrc`. It detects the OS and sources `zsh/.config/zsh/os/<os>.zsh` for things that differ: Homebrew location, `ls` flavor, and WSL helpers. `BROWSER` on WSL points to `wsl-open`, which opens URLs in the Windows default browser.

## Machine-specific config

These files are untracked and live in `$HOME`:

| File | Purpose |
| --- | --- |
| `~/.zshenv.local` | Environment variables, sourced at the end of `.zshenv` |
| `~/.zshrc.local` | Aliases, PATH, and anything else, sourced near the end of `.zshrc` |

`*.local` is listed in `.gitignore`. Keep secrets in these files or a password manager, never in tracked files.

## Notes

- Keep the repo inside the WSL filesystem (`~/dotfiles`), not under `/mnt/c`.
- If Stow reports a conflict, an existing real file is in the way. Move it aside and re-run.
- Some tools ignore XDG by default; their environment variables are set in `zsh/.zshenv`.
