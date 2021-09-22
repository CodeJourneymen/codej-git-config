#source ~/.profile
#composer path for drush
#COMPOSER_BIN='/Users/lsw/.composer/vendor/bin'
#DRUSH9_BIN='/Users/lsw/drush/drush9/vendor/bin'
#export PATH=~/bin:/usr/local/bin:$COMPOSER_BIN:$DRUSH9_BIN:$PATH:~/bin:/Users/lsw/bin/vendor/bin
export PATH=~/bin:/usr/local/bin:$PATH:~/bin:/Users/lsw/bin/vendor/bin

set -o vi
alias ls='ls -F'
alias la='ls -aF'
alias drush8='/Users/lsw/drush/drush8/vendor/bin/drush'

export CLICOLOR=true
# default = export LSCOLORS=ExFxCxDxBxegedabagacad
export LSCOLORS=GxFxCxDxBxegedabagacad

export PS1='Mac [\!]$ '
alias ll='ls -lah'

cd() { command cd "$@" ; echo "" ; pwd ; echo "" ; ls ; echo "" ; }
grep() { command grep "$@" 2>/dev/null ; }
alias top='top -o cpu'
alias more='less'
gocurie() { (cd "/Applications/mappstack-7.1.19-1/" ; ./use_mappstack_curie ; ) }
gobiokdf() { (cd "/Applications/mappstack-7.4.7-0/" ; ./use_mappstack_biokdf ;) }
golandscan() { (cd "/Applications/mappstack-7.1.19-1/" ; ./use_mappstack_landscan ;) }
golaravel() { (cd "/Applications/mappstack-7.4.7-0/" ; ./use_mappstack_laravel ;) }
gomamp() { (cd "/Applications/mampstack-7.4.22-0/" ; ./use_mampstack_mamp ;) }

# MAMP STUFF - This is also for drush
#MAMPBIN='/Applications/MAMP/Library/bin'
#PHP7BIN='/Applications/MAMP/bin/php/php7.2.1/bin'
#export PATH=$MAMPBIN:$PHP7BIN:$PATH
# MAMP
#alias mysql='mysql -u root -proot'

### Replaced MAMP PHP version with bitnami version 7.4.7
#source /Applications/mappstack-7.4.7-0/.bitnamirc


# Show git branches
alias gitb='git log --graph --oneline --all --abbrev-commit --decorate'

# fix my common git typos 
# and add git alias for the extra 't' in front of commands
alias gi='git'


function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working tree clean" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}
#export PS1='\u@\h \[\033[1;33m\]\w\[\033[0m\]$(parse_git_branch)$ '
export PS1='Mac $(parse_git_branch) [\!]$ '
#export PATH="/usr/local/opt/node@8/bin:$PATH"
#export PATH="/usr/local/opt/node@10/bin:$PATH"
export PATH="/usr/local/opt/node@12/bin:$PATH"

alias tree='tree -C'

function blt() {
  if [[ ! -z ${AH_SITE_ENVIRONMENT} ]]; then
    PROJECT_ROOT="/var/www/html/${AH_SITE_GROUP}.${AH_SITE_ENVIRONMENT}"
  elif [ "`git rev-parse --show-cdup 2> /dev/null`" != "" ]; then
    PROJECT_ROOT=$(git rev-parse --show-cdup)
  else
    PROJECT_ROOT="."
  fi

  if [ -f "$PROJECT_ROOT/vendor/bin/blt" ]; then
    $PROJECT_ROOT/vendor/bin/blt "$@"

  # Check for local BLT.
  elif [ -f "./vendor/bin/blt" ]; then
    ./vendor/bin/blt "$@"

  else
    echo "You must run this command from within a BLT-generated project."
    return 1
  fi
}


export PATH="$PATH:/Applications/DevDesktop/tools"

# BEGIN SNIPPET: Platform.sh CLI configuration
HOME=${HOME:-'/Users/lsw'}
export PATH="$HOME/"'.platformsh/bin':"$PATH"
if [ -f "$HOME/"'.platformsh/shell-config.rc' ]; then . "$HOME/"'.platformsh/shell-config.rc'; fi # END SNIPPET

# nvm - node version manager - installed via homebrew - manually added from instructions of brew
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
