
#export SBT_OPTS="-Xmn128m -Xss2m -XX:PermSize=128m -XX:MaxPermSize=128m -XX:+UseParallelGC -Xms1024m -Xmx1024m"
export SBT_OPTS="-XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=512m"
export SCALA_HOME="/usr/local/Cellar/scala/2.9.1"

# for docbook
# export XML_CATALOG_FILES="/usr/local/etc/xml/catalog"
# vim build stuffs
# export PKG_CONFIG_PATH=/usr/local/Cellar/libffi/3.0.11/lib/pkgconfig:/opt/X11/lib/pkgconfig/:$PKG_CONFIG_PATH
export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH
export MYSQL='/usr/local/mysql/bin'
export PLAY='/Users/jwatson/src/play-2.1.0/'

## NEW STUFF
# aliases
alias flushdns='sudo killall -HUP mDNSResponder'
alias dcron="drush core-cron"
alias hostconfig="sudo vim /etc/hosts"
alias phpconfig="sudo vim /etc/php.ini"
alias ctags_brew='/usr/local/bin/ctags'
alias profedit='vim ~/.profile'
alias profsrc='source ~/.profile' 
alias ..='cd ..'
alias ginfo='ssh gitolite@janis info'
alias ll="ls -altr"
alias githome='cd ~/gitolite-admin'
alias ctags="/usr/local/bin/ctags"
#apache shortcuts
alias webstop='sudo apachectl stop'
alias webstart='sudo apachectl start'
alias webrestart='sudo apachectl restart'
alias webconfig='sudo vim /etc/apache2/httpd.conf'
alias webroot='cd /Library/WebServer/Documents'
# vim shortcuts
alias vimconfig='vim ~/.vimrc'
alias vimrig='vim ~/.vimdbext'
#ctags shortcuts
alias dtags='ctags --langmap=php:.engine.inc.module.theme.install.php --php-kinds=cdfi --languages=php --recurse -f php.tags'
# SVN shortcuts
alias ssu='svn stat -u'
alias ssd='svn diff -r HEAD \!*'
alias svu='svn update'

# GIT shortcuts
alias gstat='git status'

#drush shortcuts
alias dcc='drush cc all'
alias dsql='drush sql-cli'

#web directory exports
#exports and path mods
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
HOMEBIN='/Users/jwatson/bin'
MYSQL='/usr/local/mysql/bin'
PATH=$HOMEBIN:$MYSQL:$PATH;

#bash autocomplete git stuff
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

function parse_git_branch {
    git rev-parse --git-dir > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        git_status="$(git status 2> /dev/null)"
        branch_pattern="^# On branch ([^${IFS}]*)"
        detached_branch_pattern="# Not currently on any branch"
        remote_pattern="# Your branch is (.*) of"
        diverge_pattern="# Your branch and (.*) have diverged"
        untracked_pattern="# Untracked files:"
        new_pattern="new file:"
        not_staged_pattern="Changes not staged for commit"

        #files not staged for commit
        if [[ ${git_status}} =~ ${not_staged_pattern} ]]; then
            state="✔"
        fi
        # add an else if or two here if you want to get more specific
        # show if we're ahead or behind HEAD
        if [[ ${git_status} =~ ${remote_pattern} ]]; then
            if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
                remote="↑"
            else
                remote="↓"
            fi
        fi
        #new files
        if [[ ${git_status} =~ ${new_pattern} ]]; then
            remote="+"
        fi
        #untracked files
        if [[ ${git_status} =~ ${untracked_pattern} ]]; then
            remote="✖"
        fi
        #diverged branch
        if [[ ${git_status} =~ ${diverge_pattern} ]]; then
            remote="↕"
        fi
        #branch name
        if [[ ${git_status} =~ ${branch_pattern} ]]; then
            branch=${BASH_REMATCH[1]}
        #detached branch
        elif [[ ${git_status} =~ ${detached_branch_pattern} ]]; then
            branch="NO BRANCH"
        fi

        echo " ( ${branch} ${state}${remote})"
    fi
    return
}

export PS1="\u@\h : \w \$(parse_git_branch) $ "

