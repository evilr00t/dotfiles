#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#source ~/Documents/tab-color.sh
if [ -f ~/.ec2 ]; then
	source ~/.ec2
fi

export GOPATH=$HOME/golang
export GOROOT=/usr/local/Cellar/go/1.6.2/libexec/
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

alias knife=myknife

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

pass() {
        if [ -z "$1" ]; then
                gpg --quiet -d ~/Dropbox/pass.gpg 2> /dev/null
        else
                gpg --quiet -d ~/Dropbox/pass.gpg 2> /dev/null|grep -iA5 $1
        fi
        }


code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

# various useful aliases
alias ls='ls -hovA --indicator-style=file-type --color=always --group-directories-first --time-style="+%b %_d %Y %H:%M:%S"'
alias ll='ls -ahl --color | more; echo "\e[1;32m --[\e[1;34m Dirs:\e[1;36m `ls -al | egrep \"^drw\" | wc -l` \e[1;32m|\e[1;35m Files: \e[1;31m`ls -al | egrep -v \"^drw\" | grep -v total | wc -l` \e[1;32m]--"'
alias la='ls -A'
alias lless='ll -R --color=always | less -r'
alias md='mkdir -p'
alias rd='rmdir'
alias h='history'
alias c='clear'
alias vim='vim -i NONE'
alias fetch='fetch -ApRr'
alias wget='wget -c -t 0'
alias wgetm='wget -c -r -l 0 -k --no-parent'
alias cp='cp -av'
alias mv='mv -v'
alias ssh='ssh -C'
alias lsnew="ls -rl *(D.om[1,10])"     # display the newest files
alias lsold="ls -rtlh *(D.om[1,10])"   # display the oldest files
alias lssmall="ls -Srl *(.oL[1,10])"   # display the smallest files
alias diff='diff -Nuar'
alias piplist='pip freeze | cut -d = -f 1 | xargs -n 1 pip search | grep -B2 LATEST:'
alias py="source virt/bin/activate;clear"
