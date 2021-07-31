# export PS1="\W \$"
export CLICOLOR=1


# Common folders
alias docu='cd ~/Documents'
alias desk='cd ~/Desktop'
alias down='cd ~/Downloads'

alias repo='docu;cd REPOS'

# Modify bash profile
alias sour='source ~/.bash_profile'
alias bashe='vim ~/.bash_profile'

# Git
alias gst='git status'
alias glo='git log'
alias gbr='git branch'
alias gdi='git diff'
alias gdic='git diff --cached'


function gche(){
  # Checkout a branch
  # $1: Branch to checkout
  git checkout $1
}
# npm
alias nrun='npm start'
alias ninst='npm install'

# Python activate virtualenvironment
alias acti='source venv/bin/activate'

function mkvenv() {
    # Creates a new venv folder with a virtual env. 
    # $1: Python version (should be installed)
    # $2: Path to folder where to create the new venv folder
    # Requirements: Python and virtualenv installed
  current_path=$PWD
  echo "S:Current path: '$current_path'"
  cd $2
  mkdir venv
  cd venv
  virtualenv . -p python$1
  cd ..
  source venv/bin/activate
  echo WHICH PYTHON:
  which python
  echo PYTHON VERSION:
  python --version
  cd $current_path
  echo "E:Current path: '$PWD'"
}

# fix locale issue
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Create a folder in repos and open with vscode
function user-ctemp(){
    # Create a folder inside repos folder and open
    # in vscode
    # $1: name of new folder
    # $2...: al the files to create inside new folder
    repo
    cd temp
    mkdir $1
    cd $1
    for file in "$@"
    do
	    if [ $file != $1 ]; then
		    touch $file
	    fi 
    done 
    touch README.md
    echo "This is the intitial content for \`$1\`"> README.md
    code .
}
