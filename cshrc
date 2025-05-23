#
# .cshrc - csh resource script, read at beginning of execution by each shell
#
# see also csh(1), environ(7).
# more examples available at /usr/share/examples/csh/
#

alias h		history 25
alias j		jobs -l
alias la	ls -aF
alias lf	ls -FA
alias ll	ls -lAF

# These are normally set through /etc/login.conf.  You may override them here
# if wanted.
# set path = (/sbin /bin /usr/sbin /usr/bin /usr/local/sbin /usr/local/bin $HOME/bin)
# A righteous umask
# umask 22

setenv	EDITOR	vim
setenv	PAGER	less

if ($?prompt) then
	# An interactive shell -- set some stuff up
	set prompt = "%N@%m:%~ %# "
	set promptchars = "%#"

	set filec
	set history = 1000
	set savehist = (1000 merge)
	set autolist = ambiguous
	# Use history to aid expansion
	set autoexpand
	set autorehash
	set mail = (/var/mail/$USER)
	if ( $?tcsh ) then
		bindkey "^W" backward-delete-word
		bindkey -k up history-search-backward
		bindkey -k down history-search-forward
	endif

endif

# Actual user
set ACTUAL_USER=`id -u`

# Personal exports
setenv QT_QPA_PLATFORMTHEME "qt5ct"
setenv XDG_RUNTIME_DIR "/var/run/user/$ACTUAL_USER"
setenv GOPATH "$HOME/.golang"
setenv RUST_SRC_PATH "/usr/local/lib/rustlib/src/rust/library"
setenv MOZ_ACCELERATED 1
setenv MOZ_WEBRENDER 1

# Language setting for user
setenv LANG "es_ES.UTF-8"
setenv CHARSET "UTF-8"
