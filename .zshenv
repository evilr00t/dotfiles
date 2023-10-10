#
# Defines environment variables.
#
# Author: Karol Czeryna <k@e-dot.uk>
#
# INCLUDE EXTERNAL FILES
export PROMPT_EOL_MARK='%K{red} '
export EDITOR=nvim

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
# GOLANG
export GOPATH=$HOME/golang
export GOROOT=/usr/local/opt/go/libexec
export PATH="$HOME/.local/bin:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/bin:/opt/homebrew/opt/postgresql@15/bin:$GOROOT/bin:$GOPATH/bin:$HOME/.cargo/bin:$PATH"

# FUNCTIONS

#apb()
#{
  #if [ ! -z "$ANSIBLE_BECOME_PASS" ]; then
    #ansible-playbook -e "ansible_become_pass=$ANSIBLE_BECOME_PASS" $@
  #else
    ## \xE2\x9D\x98 is a cross mark
    #echo -e "[\e[1;31m\xE2\x9C\x98\e[0m] Did you forget about: "
    #echo -e "\e[31mexport ANSIBLE_BECOME_PASS=XXX\e[0m"
    #echo -e "[\e[1;31m\xE2\x9C\x98\e[0m] Oh, yes... you do!"

  #fi
#}

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

tldr() {
  local topic="${1}" ; shift
  curl -s "cht.sh/${topic}/${*// }"
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
  curl -s https://raw.githubusercontent.com/droctothorpe/kubecolor/master/bin/events | sh /dev/stdin
}


diff()
{
  colordiff -Nuar $@ | delta --color-only
}


cat()
{
  bat -pp --theme='Sublime Snazzy' $@
}

lcat()
{
  bat --paging=always -p --theme='Sublime Snazzy' $@
}

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# Old function... now I'm using KeePass...
#pass() {
#if which gpg >/dev/null 2>&1;
#then
  #BIN=gpg
#elif which gpg2 >/dev/null 2>&1;
#then
  #BIN=gpg2
#else
  #echo 'No gnupg installed... exiting'
  #exit 1;
#fi
#if [ -z "$1" ]; then
  #$BIN --quiet -d ~/Dropbox/pass.gpg 2> /dev/null
#else
  #$BIN --quiet -d ~/Dropbox/pass.gpg 2> /dev/null|grep -iA5 $1
#fi
#}


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

# various useful aliases
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
alias vim='nvim'
alias penvi='poetry run nvim'
alias bue="brew update && brew upgrade && brew outdated --cask|cut -f 1 -d ' '|xargs brew cask reinstall"
alias local_svcs='lsof -i -n -P|grep LISTEN'
alias lsd='eza --long -g -D --git -a -s modified'
# k8s related
alias k="kubecolor"
alias kubectl="kubecolor"
alias kube-bash='k run --rm -i --tty $(whoami)-shell --image=evilroot/k8s-debug-pod --restart=Never'
alias kube-dns='k run dnsutils --image=gcr.io/kubernetes-e2e-test-images/dnsutils:latest -- sleep 3600'
alias radios='vlc -I ncurses https://gist.githubusercontent.com/evilr00t/23cd50fbceed255fb5330d484c5a8273/raw/internet_radios_playlist.m3u'
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias idea="open -a 'IntelliJ IDEA'"
alias code='code-insiders'
alias mate='/Applications/TextMate.app/Contents/Resources/mate'
alias python=python3
alias pip=pip3
alias tp='terraform validate && terraform plan'
alias mtr='sudo $(brew --prefix mtr)/sbin/mtr'

# ansible - python2 fix
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# Enabled true color support for terminals
export NVIM_TUI_ENABLE_TRUE_COLOR=1

# fzf stuff
unalias z 2> /dev/null

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

unalias ls 2>/dev/null
alias ls='eza -l --git -a -s name --time-style=long-iso'

function kp() {
  local pid=$(ps -ef | sed 1d | eval "fzf ${FZF_DEFAULT_OPTS} -m --header='[kill:process]'" | awk '{print $2}')
  if [ "x$pid" != "x" ]
  then
    echo $pid | xargs kill -${1:-9}
    kp
  fi
}

# Helper for temp files
function td {
  cd $(mktemp -d /tmp/${1}.XXXX)
}

function t {
  cd $(mktemp /tmp/${1}.XXXX)
}

function showcrt {
  openssl x509 -in ${1} -text -noout
}

function vg() {
  # from https://github.com/vrothberg/vgrep
  INITIAL_QUERY="$1"
  VGREP_PREFIX="$(brew --prefix vgrep)/bin/vgrep --no-header "
  FZF_DEFAULT_COMMAND="$VGREP_PREFIX '$INITIAL_QUERY'" \
  fzf --bind "change:reload:$VGREP_PREFIX {q} || true" --ansi --phony --tac --query "$INITIAL_QUERY" \
  | gawk '{print $1}' | xargs -I{} -o vgrep --show {}
}

# use bat to colorize man pages
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export LESSOPEN="| ~/.lessfilter %s"
