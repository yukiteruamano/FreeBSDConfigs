# ENV for the X11 session
export LANG="es_ES.UTF-8"
export CHARSET="UTF-8"
export EDITOR="vim"
export PAGER="less"
export QT_QPA_PLATFORMTHEME="qt5ct"
export XDG_RUNTIME_DIR="/var/run/user/$(id -u)"
export GOPATH="${HOME}/.golang"
export RUST_SRC_PATH="/usr/local/lib/rustlib/src/rust/library"
export MOZ_ACCELERATED=1
export MOZ_WEBRENDER=1

# Dbus session
if [ -x /usr/local/bin/dbus-launch -a -z "${DBUS_SESSION_BUS_ADDRESS}" ]; then
        eval `dbus-launch --sh-syntax --exit-with-x11`
fi

# Init i3 session
exec /usr/local/bin/ck-launch-session /usr/local/bin/i3
