#
# .profile - Bourne Shell startup script for login shells
#
# see also sh(1), environ(7).
#

# These are normally set through /etc/login.conf.  You may override them here
# if wanted.
PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin:$HOME/bin:$HOME/.golang/bin:$HOME/.cargo/bin:$HOME/.local/bin:$HOME/.config/emacs/bin; export PATH

# Personal configs

EDITOR='vim';							export EDITOR
PAGER='less';                                       		export PAGER

# Personal exports
QT_QPA_PLATFORMTHEME='qt5ct';                       		export QT_QPA_PLATFORMTHEME
XDG_RUNTIME_DIR='$HOME/.local/run/yukiteru';			export XDG_RUNTIME_DIR
GOPATH='/home/yukiteru/.golang';				export GOPATH
RUST_SRC_PATH='/usr/local/lib/rustlib/src/rust/library';	export RUST_SRC_PATH
PIPENV_VENV_IN_PROJECT=1; 					export PIPENV_VENV_IN_PROJECT
MOZ_ACCELERATED=1;						export MOZ_ACCELERATED
MOZ_WEBRENDER=1;						export MOZ_WEBRENDER

# Language setting for user
LANG='es_ES.UTF-8';						export LANG
CHARSET='UTF-8';						export CHARSET

# set ENV to a file invoked each time sh is started for interactive use.
ENV=$HOME/.shrc; export ENV

# Let sh(1) know it's at home, despite /home being a symlink.
if [ "$PWD" != "$HOME" ] && [ "$PWD" -ef "$HOME" ] ; then cd ; fi

# Query terminal size; useful for serial lines.
if [ -x /usr/bin/resizewin ] ; then /usr/bin/resizewin -z ; fi

# Display a random cookie on each login.
if [ -x /usr/bin/fortune ] ; then /usr/bin/fortune freebsd-tips ; fi
