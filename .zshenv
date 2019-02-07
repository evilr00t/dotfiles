#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#
# Modified by:
#   Karol Czeryna <k@e-dot.uk>
#
# Updated: Mon 28 Jan 15:30:13 2019

# INCLUDE EXTERNAL FILES

if [ -f ~/.ec2 ]; then
  source ~/.ec2
fi

if [ -f ~/.work ]; then
  source ~/.work
fi

if [ -f ~/.home ]; then
  source ~/.home
fi

# EXPORTS

export GOPATH=$HOME/golang
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin:$HOME/.cargo/bin:$PATH

# FUNCTIONS

apb()
{
  if [ ! -z "$ANSIBLE_BECOME_PASS" ]; then
    ansible-playbook -e "ansible_become_pass=$ANSIBLE_BECOME_PASS" $@
  else
    # \xE2\x9D\x98 is a cross mark ;-)
    echo -e "[\e[1;31m\xE2\x9C\x98\e[0m] Did you forget about: "
    echo -e "\e[31mexport ANSIBLE_BECOME_PASS=XXX\e[0m"
    echo -e "[\e[1;31m\xE2\x9C\x98\e[0m] Oh, yes... you do!"

  fi
}

cht() {                                                                                                                                                                                                                                                                     ✹
    local topic="${1}" ; shift

    curl "cht.sh/${topic}/${*// }"
  }


diff()
{
  colordiff -Nuar $@ | diff-so-fancy
}


cat()
{
bat --paging=never -p --theme='TwoDark' $@
}
# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# Old function... now I'm using KeePass...
pass() {
if which gpg >/dev/null 2>&1;
then
  BIN=gpg
elif which gpg2 >/dev/null 2>&1;
then
  BIN=gpg2
else
  echo 'No gnupg installed... exiting'
  exit 1;
fi
if [ -z "$1" ]; then
  $BIN --quiet -d ~/Dropbox/pass.gpg 2> /dev/null
else
  $BIN --quiet -d ~/Dropbox/pass.gpg 2> /dev/null|grep -iA5 $1
fi
}

code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

# file open using fzf and vim!
fo() {
  local files
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

# tm [SESSION_NAME | FUZZY PATTERN] - create new tmux session, or switch to existing one.
# Running `tm` will let you fuzzy-find a session mame
# Passing an argument to `ftm` will switch to that session if it exists or create it otherwise
ftm() {
  [[ -n "$TMUX" ]] && change="switch-client" || change="attach-session"
  if [ $1 ]; then
    tmux $change -t "$1" 2>/dev/null || (tmux new-session -d -s $1 && tmux $change -t "$1"); return
  fi
  session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --exit-0) &&  tmux $change -t "$session" || echo "No sessions found."
}

# tm [SESSION_NAME | FUZZY PATTERN] - delete tmux session
# Running `tm` will let you fuzzy-find a session mame to delete
# Passing an argument to `ftm` will delete that session if it exists
ftmk() {
  if [ $1 ]; then
    tmux kill-session -t "$1"; return
  fi
  session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --exit-0) &&  tmux kill-session -t "$session" || echo "No session found to delete."
}

# various useful aliases
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
alias piplist='pip freeze | cut -d = -f 1 | xargs -n 1 pip search | grep -B2 LATEST:'
alias py="source virt/bin/activate;clear"
alias grep='ggrep'
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy";
alias vim='nvim'
alias bue="brew update && brew upgrade && brew cask outdated|cut -f 1 -d ' '|xargs brew cask reinstall"
alias local_svcs='lsof -i -n -P|grep LISTEN'
alias ls='gls -hovA --indicator-style=file-type --color=always --group-directories-first --time-style="+%b %_d %Y %H:%M:%S"'
alias la='gls -A'

# ansible - python2 fix
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
# Enabled true color support for terminals
export NVIM_TUI_ENABLE_TRUE_COLOR=1

