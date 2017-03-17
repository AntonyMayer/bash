#display git branch
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [ \1 ]/'
}

#change directory an display files/folders
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

#cd => home [path]
cdh(){
    to=$HOME/$1
    cd ${to}
}

#mkdir + cd
mcd() {
    mkdir -p $1
    cd $1
}

export PS1="\[\033[1;33m\]\u \[\033[32m\]\w \[\033[31m\]\$(parse_git_branch)\[\033[00m\] $ "