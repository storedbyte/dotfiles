# plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fpath=(/usr/share/zsh-completions $fpath)

# completions
autoload -Uz compinit && compinit

# starship
eval "$(starship init zsh)"

# history
HISTFILE=~/.config/zsh/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# aliases - navigation
alias ..='cd ..'
alias ...='cd ../..'
alias dotfiles='cd ~/dotfiles'

# aliases - better defaults
alias catt='cat'
alias cat='bat'
alias ls='eza --icons'
alias ll='eza -la --icons'
alias tree='eza --tree --icons'

# aliases - git
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias glog='git log --oneline --graph'
alias gcl='git clone'

# aliases - arch/yay
alias update='yay -Syu'
alias install='yay -S'
alias remove='sudo pacman -R'
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'

# aliases - misc
alias vim='nvim'
alias reload='source ~/.config/zsh/.zshrc'
alias stowit='stow -d ~/dotfiles -t ~'

# aliases - theme switcher
alias hazuki="~/.config/themes/hazuki/scripts/switch.sh"
