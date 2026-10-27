# Linux Homebrew
[[ -x /home/linuxbrew/.linuxbrew/bin/brew ]] && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Colors (dircolors first, then the WSL mount override)
eval "$(dircolors -b)"
export LS_COLORS="$LS_COLORS:ow=01;34:tw=01;34"
alias ls='ls --color=auto'

# WSL helpers
alias open='explorer.exe'
alias pbcopy='clip.exe'
alias pbpaste='powershell.exe -noprofile -command Get-Clipboard'
export BROWSER=wsl-open
