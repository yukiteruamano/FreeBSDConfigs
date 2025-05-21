#
# .login - csh login script, read by login shell, after `.cshrc' at login.
#
# See also csh(1), environ(7).
#

# Query terminal size; useful for serial lines.
if ( -x /usr/bin/resizewin ) /usr/bin/resizewin -z

# Display a random cookie on each login.
if ( -x /usr/bin/fortune ) /usr/bin/fortune freebsd-tips

# Personal configs
setenv EDITOR   'vim'
setenv PAGER    'less'

# Personal exports
setenv QT_QPA_PLATFORMTHEME 'qt5ct'
setenv XDG_RUNTIME_DIR '/home/yukiteru/.local/run/yukiteru'
setenv GOPATH '/home/yukiteru/.golang'
setenv RUST_SRC_PATH '/usr/local/lib/rustlib/src/rust/library'
setenv MOZ_ACCELERATED 1
setenv MOZ_WEBRENDER 1

# Language setting for user
setenv LANG 'es_ES.UTF-8'
setenv CHARSET 'UTF-8'
