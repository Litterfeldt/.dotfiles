ulimit -n 1024

# Bash
export EDITOR='mvim -v -N'

# Setting for the new UTF-8 terminal support in Lion
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_LANG=en_US.UTF-8
export LANG=en_US.UTF-8


# Git
source /usr/local/etc/bash_completion.d/git-completion.bash
export GIT_EDITOR='vim'
export PATH=$PATH:/usr/local/git/bin

# Functions

# Serve the current directory over HTTP
function serve {
  port="${1:-9000}"
  ruby -r webrick -e "s = WEBrick::HTTPServer.new(:Port => $port,
   :DocumentRoot => Dir.pwd); trap('INT') { s.shutdown }; s.start"
}

# Control the fan speed of the Macbook Air
# NOTE: Don’t complain if you melt your computer.
function set_fan_speed {
  if [ -z "$1" ]; then min_speed=2000; else min_speed=$1; fi
  if [ -z "$2" ]; then max_speed=6500; else max_speed=$2; fi

  smc=/Applications/smcFanControl.app/Contents/Resources/smc

  min_hex=$(python -c "print hex("$min_speed" << 2)[2:]")
  max_hex=$(python -c "print hex("$max_speed" << 2)[2:]")

  ${smc} -k F0Mn -w ${min_hex}
  ${smc} -k F0Mx -w ${max_hex}
}

function parse_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    echo "("${ref#refs/heads/}") "
}

function wiki {
 dig +short txt $1.wp.dg.cx
}

function blunderbuss {
  if [ -z "$1" ]; then
    PORT=9393
  else
    PORT=$1
  fi

  IP=`ifconfig | grep -m 1 broadcast | awk '{print $2}'`
  shotgun -s thin -o $IP -p $PORT
}

function sass-watch {
  if [ -z "$3" ]; then
    SASS_IN='all.scss'
    CSS_OUT='all.css'
    SASS_WATCH_PATH='.'
  else
    SASS_IN=$1
    CSS_OUT=$2
    SASS_WATCH_PATH=$3
  fi

kicker -s -e "sass --scss --style compressed $SASS_IN $CSS_OUT" $SASS_WATCH_PATH
}

#GO
export GOPATH=/usr/local/Cellar/go/1.2/
#App_engine
export PATH=/Users/Gabril/go/go_appengine:$PATH

# NPM
export PATH=$PATH:/usr/local/share/npm/bin

# Homebrew
export PATH=/usr/local/sbin:/usr/local/bin:$PATH

# MySQL
export PATH=/usr/local/mysql/bin:$PATH

# Ruby
export GUARD_NOTIFY=false
export RUBY_HEAP_MIN_SLOTS=800000       #(10000)
export RUBY_HEAP_FREE_MIN=100000        # (4096)
export RUBY_HEAP_SLOTS_INCREMENT=300000 # (10000)
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1  # (1.8)
export RUBY_GC_MALLOC_LIMIT=36000000    # (8000000)

# Rubinius
export RBXOPT=-X19

# ZenTest
export RSPEC=true
export AUTOTEST=true
export AUTOFEATURE=true

# Colors!
export CLICOLOR=1
export LSCOLORS=HxbxfxdxCxegedafahacad


# Aliases
alias vim='mvim -n -v -N'
alias mvim='mvim -n -N -c "set noballooneval"'
alias :q='logout'
alias q='logout'
alias irb='pry || irb'
alias ls='ls -F'
alias be='bundle exec'
alias ..='cd ..'
alias l='ls -A'

## Development
alias dev='cd ~/Dev/'

## continues testing
alias respec='rerun -c -x "rspec"'


# Git related
alias g='git'
alias gst='git status'
alias gl='git pull'
alias gpr='git pull --rebase'
alias gup='git fetch && git rebase'
alias gp='git push'
alias gpos='git push origin stage'
alias gpom='git push origin master'
alias gd='git diff'
alias gdv='git diff -w "$@" | vim -R -'
alias gc='git commit -m'
alias gcount='git shortlog -sn'
alias gwc='git whatchanged -p --abbrev-commit --pretty=medium'

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
