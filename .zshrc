export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="/home/philip/.oh-my-zsh"
export TERM=xterm-256color

# Loads the ZSH theme.
ZSH_THEME="af-magic"

# Package manager aliases
alias aptup='sudo apt update; sudo apt upgrade'
alias aptins='sudo apt install' 

# ls aliases
alias sls='sudo ls -ltr --color=auto'
alias lst='lsd -ltr'
alias python3='python3.11'
alias cat='bat'

# Copies both .pdf and .gle files of the same
# name. I am incredibly lazy.
function glecp(){
  file=$1
  location=$2
  substring=${file:0:-4}
  extensions="{.pdf,.gle}"
  substring+=$extensions
  files=$substring
  eval cp $files $location
}

#Dotfiles automation
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

#Git aliases
alias gita='git add'
alias gitcm='git commit -m'
alias gitl='git log --graph --oneline --abbrev-commit'
alias gits='git status'

# Sudo vim to preserve environment
alias svim='sudo -E vim'

# Alias for copying PWD to clipboard
alias pwdcp='pwd | xclip -selection clipboard'

# bravebrowser
alias bb='brave-browser'

# Plugins for syntax colouring and autocomplete.
plugins=(
    colored-man-pages # Nice man pages
    fzf # History fuzzy finder
    git # Git history
    sudo # Double tap escape to redo previous cmd with sudo
    zsh-autosuggestions # Autocomplete
    zsh-lsd # Better coloured LSD
    zsh-syntax-highlighting # Syntax highlighting
    zsh-vi-mode # CLI vim mode
)

# Bind escape to jk for vi mode
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk

# Launches oh-my-zsh.
source $ZSH/oh-my-zsh.sh
   # If not running interactively, don't do anything 
   [[ $- != *i* ]] && return 

# User configuration
export PATH=$PATH:/home/philip/.config/diff-so-fancy/
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH=$PATH:/home/philip/rmirro
# export PATH=$PATH:/home/philip/mudirac/build/bin
export PATH=$PATH:/home/philip/PhD/mudirac/build/bin
export PATH=$PATH:/home/philip/PhD/mudiracclean/mudirac/build/bin

export PATH=$PATH:/home/philip/castep/obj/linux_x86_64_gfortran10--mpi
export PATH=$PATH:/home/philip/castep/obj/linux_x86_64_gfortran10--clean
alias castepclean='~/castep/obj/linux_x86_64_gfortran10--clean/castep.mpi'
# alias otfgclean='~/castep/obj/linux_x86_64_gfortran10--clean/otfg'

unsetopt share_history
