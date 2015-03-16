# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
export GOPATH="/Users/robbecker/go"
#export DART_SDK="/Users/robbecker/dart/dart-sdk/" #1.8
export DART_SDK="/Users/robbecker/downloads/dart/dart-sdk/" # 1.9

export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export PATH="/usr/local/opt/ruby/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:/usr/local/go/bin:$GOPATH/bin:/Users/robbecker/bin:/Users/robbecker/android-sdk/platform-tools:/Users/robbecker/android-sdk/tools:$DART_SDK/bin:/Users/robbecker/google-cloud-sdk/bin:./node_modules/.bin:/Users/robbecker/.pub-cache/bin"
# Enable remote debugging in PyCharm -lrf 12/4/2014
export PYTHONPATH='/Applications/PyCharm.app/Contents/pycharm-debug.egg'

export CFLAGS="-Qunused-arguments"
export CPPFLAGS="-Qunused-arguments"

#To connect the Docker client to the Docker daemon, please set:
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/robbecker/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

###########################
# Add virtualenvwrapper
export WORKON_HOME=~/Envs

# Sources the virtualenvwrapper so all the commands are availabe in the shell
source /usr/local/bin/virtualenvwrapper.sh


export MAVEN_OPTS="-Xmx4096m -Xss1024m"

# iOS Simulator dir
export SIM_DIR=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer

# Bower & npm aliases
alias bl="bower link"
alias lsbc='ls bower_components'
alias lsnm='ls node_modules'
alias bower='noglob bower'
alias blall='blcmn && blui && blvw && blann && bl wDOM && lsbc'
alias blui='bower link wf-uicomponents'
alias blvw='bower link wf-js-viewer'
alias blann='bower link wf-js-annotations'
alias blcmn='bower link wf-common'
alias lsbowerlinks='ls -al ~/.local/share/bower/links'
alias rebower='rm -rf bower_components/ && bower install'
alias renpm='rm -rf node_modules/ && npm install'
alias rejs="renpm && rebower"

# cd to directories
alias dv='cd ~/workspace/wf-js-document-viewer'
alias wdom='cd ~/workspace/wDOM'
alias bs='cd ~/workspace/bigsky'
alias sc='cd ~/workspace/server_composition'
alias ui='cd ~/workspace/wf-uicomponents'
alias ann='cd ~/workspace/wf-js-annotations'
alias bsrv='cd ~/workspace/bigsky/apps/rv'
alias books='cd ~/workspace/wf-books'
alias boks='cd ~/workspace/bigsky/books'
alias rv='cd ~/workspace/wf-js-reference-viewer'
alias vs='cd ~/workspace/wf-viewer-services'
alias vw='cd ~/workspace/wf-js-viewer'
alias paw='cd ~/workspace/paw'
alias cmn='cd ~/workspace/wf-common'
alias wglp='cd ~/workspace/wGulp'
alias prs='cd ~/workspace/python-runtime-stack'
alias dl="cd ~/Downloads"
alias work='cd ~/workspace'
alias play='cd ~/play'
alias chromehome="cd ~/Library/Application\ Support/Google/Chrome/Default"
alias cdbowerlinks='cd ~/.local/share/bower/links'

# git aliases
alias lasttag="git describe --tags --abbrev=0"
alias gsl="git stash list"
alias gsp="git stash pop"
alias gsc="git stash clear"
alias gs="git stash"
alias gf="git fetch"
alias gmm="git merge -s recursive -X patience -X ignore-all-space origin/master"
alias gitwork="cp ~/.ssh/work.config ~/.ssh/config && cp ~/work.gitconfig ~/.gitconfig"
alias gitrob="cp ~/.ssh/rob.config ~/.ssh/config && cp ~/rob.gitconfig ~/.gitconfig"
alias cleanbranches='~/bin/cleanbranches.sh'

# Bigsky aliases
by() {
  if [[ $(ps | grep "manage.py runserver 0.0" -c) -lt 2 ]]; then
    echo Starting Bigsky
    bs
    workon sky
    if [[ $1 == "" ]]; then
      (python manage.py runserver 0.0.0.0:8001 2>&1) > /tmp/bs.log &
    else 
      python manage.py runserver 0.0.0.0:8001
    fi
  else
    echo Already running
  fi
}

alias skyup="bs && git pull && git submodule update --init && workon sky && pip install -r requirements_dev.txt"
alias nobs="killall python"
alias repip='bs && workon sky && pip install -r requirements_dev.txt'
alias revenv="deac && rm -rf /Users/robbecker/Envs/sky && bs && mkvirtualenv sky -a /Users/robbecker/workspace/bigsky"
alias bsant='\
bs && \
SUPPORTPATH=$HOME/workspace/support && \
cp build-user.properties.mac build-user.properties && \
sed -E -i .bak -e "s%SUPPORT=(.+)%SUPPORT=$SUPPORTPATH%" build-user.properties && \
cp settingslocal.py.dev settingslocal.py && \
workon sky && \
ant full'
alias bsmyaccount="echo Rob,Becker,rob,go,,Workiva,rob.becker@workiva.com,666-666-6667,555-555-5556,444-444-4445,333-333-3334,2131 North Loop Drive,,,Ames,IA,50011 > ~/workspace/bigsky/tools/bulkdata/accounts.csv"
alias bslinkdocviewerassets='bs && workon sky && ./tools/link_assets.py sky.docviewer assets'
alias piplink_dv='ws && rm ./static/sky-docviewer/* && \
{ pip uninstall -y sky-docviewer; pip install -e ../wf-js-document-viewer; } && \
ant link-libs && \
bslinkdocviewerassets'
alias piplink_sc='ws && { pip uninstall -y server_composition; pip install -e ../server_composition; }'
alias piplink_vs='ws && { pip uninstall -y wf-viewer-services; pip install -e ../wf-viewer-services; }'
alias piplink_as='ws && { pip uninstall -y wf-annotation-services; pip install -e ../wf-annotation-services; }'
alias piplink_books='ws && { pip uninstall -y wf-books; pip install -e ../wf-books; } && ant link-libs && ./tools/link_assets.py wf.apps.books assets'
alias piplink_all='piplink_vs && piplink_sc && piplink_docviewer && piplink_as'
alias bsdocviewerinstall='bslinkdocviewerassets && bsdocviewerpip'
alias resetdata='bsmyaccount && bs && workon sky && rm -rf datastore && mkdir datastore && python tools/erase_reset_data.py --admin="rob" --password="go" --enabled_settings=enable_presentations,enable_doc_viewer,enable_two_column'
alias bslog="tail -f /tmp/bs.log"
alias dsback="bs && rm -rf ~/ds/datastore && cp -R datastore ~/ds"
alias dsrest="bs && cp -R ~/ds/datastore"
bsfonts() {
  bs
  workon sky
  echo fakepassword | python tools/remote_api/upload_font.py ../font/fonts/general --wf-enable --email=junk --passin
  echo fakepassword | python tools/remote_api/upload_font.py ../font/fonts/embedded_in_editor --wf-enable --email=junk --passin
  echo fakepassword | python tools/remote_api/upload_font.py ../font/fonts/restricted --wf-enable --email=junk --passin
}
rebs() {
  nobs
  bs
  gcm -f
  git clean -fxd
  revenv
  bsmyaccount
  bs
  skyup
  bsant
  resetdata
  by
  sleep 5
  bsfonts
  say Done with all the bullshit
}

# Alias all the things
alias ws='bs && workon sky'
alias pfz='bs && workon sky && pip freeze'
alias deac='[[ -n $VIRTUAL_ENV ]] && deactivate'
alias mvext="for i in *.ts ; do mv $i ${i:r}.dart ; done"
alias ln='ln -s'
alias ls='ls -alG'
alias st='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias subl='st'
alias reload='. ~/.zshrc'
alias zshrc='subl ~/.zshrc'
alias mate='st'
alias loc='find . -name $1 2>/dev/null'
alias glp='gulp'
alias showlinks='ls -lR . | grep ^l'
alias findlinks='find -L . -type l'
alias b2d='boot2docker'
alias dockup="boot2docker stop && boot2docker download && boot2docker up"
alias jsinit="git clean -fxd && npm install && bower install"
[ -s "/Users/robbecker/.scm_breeze/scm_breeze.sh" ] && source "/Users/robbecker/.scm_breeze/scm_breeze.sh"

# ADB
alias adbrecord="adb shell screenrecord /sdcard/recording.mp4"
alias adbpullrecording="adb pull /sdcard/recording.mp4"
alias adbwear="adb -d forward tcp:5601 tcp:5601"
alias adbbtwear="adb forward tcp:4444 localabstract:/adb-hub; adb connect localhost:4444"

# Appspot stuff
alias bsdeploy="ws && rm -rf external_libs/functional_tests && bsdeploy.sh"

# convert a mov to animated gif
alias mov2gif="ffmpeg -i in.mov -s 640x480 -pix_fmt rgb24 -r 10 -f gif - | gifsicle --optimize=3 --delay=3 > out.gif"

alias passit="runscope-passageway --bucket=17oi37jseh6z --fixed 8001"
alias nopass="killall runscope-passageway"

## functions
nvsup() {

  local workerTag="latest"
  local managerTag="latest"

  if [[ $1 != "" ]]; then
    workerTag="$1"
    managerTag="$1"
  fi

  if [[ $2 != "" ]]; then
    managerTag="$2"
  fi

  b2d up

  # # Run the NVS Task Manager
  docker stop nvs-task-manager
  docker stop nvs-worker

  docker rm nvs-task-manager
  docker rm nvs-worker

  docker pull docker.webfilings.org/hydra/nvs-task-manager:"$managerTag"
  docker pull docker.webfilings.org/hydra/nvs-worker:"$workerTag"

  docker run -t -d -p 49444:49444 --name nvs-task-manager -e "DEMETER_CONF=-l DEBUG" docker.webfilings.org/hydra/nvs-task-manager:"$managerTag"
  docker run -d --name nvs-worker --link nvs-task-manager:nvs-task-manager -e "DEMETER_CONF=-l DEBUG" docker.webfilings.org/hydra/nvs-worker:"$workerTag"

  docker start nvs-task-manager
  docker start nvs-worker  
  docker ps
}