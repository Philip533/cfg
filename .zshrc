# export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="/home/philip/.oh-my-zsh"
export TERM=xterm-256color
# Loads the ZSH theme.
ZSH_THEME="af-magic"
# Package manager aliases.
alias pacup='sudo pacman -Syu '
alias pacs='pacman -Ss'
alias pacins='sudo pacman -S'
alias pacr='sudo pacman -Rs'
alias pacq='pacman -Q'
alias pacu='sudo pacman -U'

#Dotfiles automation
alias dotfiles='/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=${HOME}'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

#Git aliases
alias gita='git add'
alias gitcm='git commit -m'
alias gitl='git log --graph --oneline --abbrev-commit'
alias gits='git status'

#Sudo vim
alias svim='sudo -E vim'

bindkey '^R' history-beginning-search-backward
# Plugins for syntax colouring and autocomplete.
plugins=(
    fzf
    git
    colored-man-pages
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-z
    zsh-lsd
)

# Launches oh-my-zsh.
source $ZSH/oh-my-zsh.sh
   # If not running interactively, don't do anything 
   [[ $- != *i* ]] && return 

# User configuration
export MANPATH="/usr/local/man:$MANPATH"
export PATH=$PATH:/home/philip/Documents/GPU_CASTEP/Utilities/scripts
export PATH=$PATH:/home/philip/Documents/GPU_CASTEP/Utilities/optados/src
export PATH=$PATH:/usr/local/diff-so-fancy
function rebootwindows {
    WINDOWS_TITLE=`grep -i "^menuentry 'Windows" /boot/grub/grub.cfg|head -n 1|cut -d"'" -f2`
    sudo grub-set-default "$WINDOWS_TITLE"
    sudo reboot
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
