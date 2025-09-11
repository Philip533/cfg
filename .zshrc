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

# This copies a PDF and GLE file to the appropriate
# directories.
# It also searches the file for data statements
# and copies the appropriate files into a directory
# named the same as the PDF
function figcp(){
  
  # We take one argument, either file.pdf or 
  # file.gle. Included the extension as autocomplete
  # will do this. Either one is fine as it will be stripped
  # and replaced anyway
  
  # Filename 
  file=$1

  # Remove the extension, since it could be either,
  # and then build the two files again
  file_stem=${file:0:-4}
  gle_file="$file_stem.gle"
  pdf_file="$file_stem.pdf"


  # Define the directory that is named the same as the
  # file where everything will go
  dir=~/PhD/Figures/$file_stem

  # We check if the directory exists or not. If it 
  # doesn't, then make it
  if [ ! -d $dir ]; then
    mkdir $dir
  fi

  # Copy the PDF and GLE file
  cp -t $dir $gle_file $pdf_file

  # We want to make a README that contains the date of copy
  # and a bit of information
  echo `date` >> "$dir/README.md"
  echo $2 >> "$dir/README.md"
  echo " " >> "$dir/README.md"

  # Now we search the GLE file for any data statements,
  # and copy these files into the appropriate directory
  grep data $gle_file | while read -r line; do
    string2=$(echo $line | awk '{print $2}')
    string3=$(echo $string2 | awk '{print substr($0,2,length($0)-2)}')
    cp $string3 $dir
  done

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
