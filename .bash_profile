# ls display type 
alias ls="ls -CF"

#display git branch
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [ \1 ]/'
}

#change directory an display files/folders
cdl(){
  cd $1
  ls
}

#change directory and open in editor
cdc(){
  cd $1
  code .
}

#cd => home [path]
cdh(){
    to=$1
    cd $HOME/$1
}

#cd => open in finder
cdo(){
    cd $1
    open .
}

#mkdir + cd
mcd() {
    mkdir -p $1
    cd $1
}

#open chrome with cors disabled
chrome() {
    open -a Google\ Chrome --args --disable-web-security --user-data-dir
}

# Make .gitignore files (commonly used via `gi osx`)
function gi() {
    result=$(curl "https://www.gitignore.io/api/$1" 2>/dev/null)

    if [[ $result =~ ERROR ]]; then
        echo "Query '$1' has no match. See a list of possible queries with 'gi list'"
    elif [[ $1 = list ]]; then
        echo "$result"
    else
        if [[ -f .gitignore ]]; then
            result=`echo "$result" | grep -v "# Created by http://www.gitignore.io"`
            echo ".gitignore already exists, appending"
            echo "$result" >> .gitignore
        else
            echo "Result from our curl request..."
            echo "$result"
            echo "$result" > .gitignore
        fi
    fi
}

export PS1="\[\033[1;33m\]\u \[\033[36m\]\w \[\033[31m\]\$(parse_git_branch)\[\033[00m\] $ "
