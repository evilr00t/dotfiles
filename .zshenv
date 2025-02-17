#
# Defines environment variables.
#
# Author: Karol Czeryna <k@e-dot.uk>
#
export PROMPT_EOL_MARK='%K{red} '
export EDITOR=nvim
export GOPATH=$HOME/golang
export PATH="$HOME/.local/bin:/opt/homebrew/bin:/usr/local/bin:/opt/homebrew/opt/postgresql@17/bin:$GOPATH/bin:$HOME/.cargo/bin:$PATH"

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi


if [ -f ~/.work ]; then
  source ~/.work
fi

if [ -f ~/.home ]; then
  source ~/.home
fi

k8env() {
  local ke
  ke=$(cat ~/.work | grep -v '^#' | grep env | tr -d '() {' | awk '{print $1}' | fzf)
  $ke
}

k8sgetsec() {
  kubectl get secret $1 -o json | jq '.data'
}

k8sdecode() {
  kubectl get secret $1 -o jsonpath="{.data}" | jq '.data | map_values(@base64d)'
}

# Make a reverse proxy tunnel using:
# ssh_rev_proxy [PORT] [HOST]
# service will be available at: localhost:[PORT]
ssh_rev_proxy() {
  local port="${1}"
  local host="${2}"
  ssh -fNg -L ${port}:127.0.0.1:${port} ${host}
}

events() {
  # from:
  # curl -s https://raw.githubusercontent.com/droctothorpe/kubecolor/master/bin/events | sh /dev/stdin
  kubectl get events --all-namespaces --watch \
    -o 'go-template={{.lastTimestamp}} ^ {{.involvedObject.kind}} ^ {{.message}} ^ ({{.involvedObject.name}}){{"\n"}}' \
    | awk -F^ \
    -v black=$(tput setaf 0) \
    -v red=$(tput setaf 1) \
    -v green=$(tput setaf 2) \
    -v yellow=$(tput setaf 3) \
    -v blue=$(tput setaf 4) \
    -v magenta=$(tput setaf 5) \
    -v cyan=$(tput setaf 6) \
    -v white=$(tput setaf 7) \
    '{
        $1=blue $1
        $2=green $2
        $3=white $3
    }
    1'
}



# file open using fzf and vim!
fo() {
  local files
  IFS=$'\n'
  files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-nvim} "${files[@]}"
}

# tf_config
tf_config() {
  TF_CLI_CONFIG_FILE=$(ls -alh ~/.terraform.d/credentials-*.tfrc.json -1 2>/dev/null | fzf --exit-0) && export TF_CLI_CONFIG_FILE=$TF_CLI_CONFIG_FILE || echo "No TF credentials files found."
}

# ftm [SESSION_NAME | FUZZY PATTERN] - create new tmux session, or switch to existing one.
# Running `tm` will let you fuzzy-find a session mame
# Passing an argument to `ftm` will switch to that session if it exists or create it otherwise
ftm() {
  [[ -n "$TMUX" ]] && change="switch-client" || change="attach-session"
  if [ $1 ]; then
    tmux $change -t "$1" 2>/dev/null || (tmux new-session -d -s $1 && tmux $change -t "$1"); return
  fi
  session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --exit-0) &&  tmux $change -t "$session" || echo "No sessions found."
}

# ftmk [SESSION_NAME | FUZZY PATTERN] - delete tmux session
# Running `tm` will let you fuzzy-find a session mame to delete
# Passing an argument to `ftm` will delete that session if it exists
ftmk() {
  if [ $1 ]; then
    tmux kill-session -t "$1"; return
  fi
  session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --exit-0) &&  tmux kill-session -t "$session" || echo "No session found to delete."
}

z() {
  if [[ -z "$*" ]]; then
    cd "$(_z -l 2>&1 | fzf +s --tac | sed 's/^[0-9,.]* *//')"
  else
    _last_z_args="$@"
    _z "$@"
  fi
}

zz() {
  cd "$(_z -l 2>&1 | sed 's/^[0-9,.]* *//' | fzf -q "$_last_z_args")"
}



function kp() {
  local pid=$(ps -ef | sed 1d | eval "fzf ${FZF_DEFAULT_OPTS} -m --header='[kill:process]'" | awk '{print $2}')
  if [ "x$pid" != "x" ]
  then
    echo $pid | xargs kill -${1:-9}
    kp
  fi
}

function showcrt {
  openssl x509 -in ${1} -text -noout
}

function co_author() {
  git shortlog --summary --numbered --email --all . \
    | cut -f2- \
    | awk '$0="Co-authored-by: "$0' \
    | fgrep -v "$(git config user.email)" \
    | fzf --multi --exit-0 --no-sort \
    | pbcopy
}

# various useful aliases
alias cat='bat -pp'
alias lcat='bat --paging=always -p'
alias diff='difft'
alias lless='ll -R --color=always | less -r'
alias md='mkdir -p'
alias rd='rmdir'
alias h='history'
alias c='clear'
alias fetch='fetch -ApRr'
alias wget='wget -c -t 0'
alias wgetm='wget -c -r -l 0 -k --no-parent'
alias cp='cp -av'
alias mv='mv -v'
alias ssh='ssh -C'
alias piplist='pip3 freeze | cut -d = -f 1 | xargs -n 1 pip3 search | grep -B2 LATEST:'
alias py="source virt/bin/activate;clear"
alias grep='ggrep'
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy";
alias vi='vim'
alias vim='nvim'
alias penvi='poetry run nvim'
alias bue="brew update && brew upgrade && brew outdated --cask|cut -f 1 -d ' '|xargs brew cask reinstall"
alias local_svcs='lsof -i -n -P|grep LISTEN'
alias ls='eza -l --git -a -s name --time-style=long-iso'
alias lsd='eza --long -g -D --git -a -s modified'
alias radios='vlc -I ncurses https://gist.githubusercontent.com/evilr00t/23cd50fbceed255fb5330d484c5a8273/raw/internet_radios_playlist.m3u'
alias code='code-insiders'
alias python='python3'
alias pip='pip3'
alias tp='terraform validate && terraform plan'
alias mtr='sudo $(brew --prefix mtr)/sbin/mtr'
alias ag='rg -i'
alias kill_dns='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'
alias make='gmake'
alias k="kubecolor"
alias kubectl="kubecolor"
alias kube-bash='k run --rm -i --tty k8s-debug-pod --image=nicolaka/netshoot --restart=Never'
alias kube-dns='k run --rm -i --tty dnsutils --image=registry.k8s.io/e2e-test-images/jessie-dnsutils:1.3'

# fzf stuff
# unalias z 2> /dev/null
#
# use bat to colorize man pages
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export LESSOPEN="| ~/.lessfilter %s"

# vi:syntax=sh
