#display git branch
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

#change directory and display files/folders
cdl(){
  to=$1
  cd ${to}
  ls
}

#change directory and open in editor
cdc(){
  to=$1
  cd ${to}
  code .
}

export PS1="\u@\h \[\033[32m\]\w - \$(parse_git_branch)\[\033[00m\] $ "

