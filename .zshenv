#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

export EDITOR=vim

export GOPATH=$HOME/golang
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin


#export PATH=/opt/chef/bin:$PATH


alias cat=ccat

myknife() {
	knife "$@" --config ~/.chef/knife.rb
}

pass() {
	if [ -z "$1" ]; then
		gpg --quiet -d ~/Dropbox/pass.gpg 2> /dev/null
	else
		gpg --quiet -d ~/Dropbox/pass.gpg 2> /dev/null|grep -iA5 $1
	fi
	}
alias knife=myknife
