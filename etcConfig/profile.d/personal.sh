EDITOR=vim;							export EDITOR
PAGER=less;							export PAGER

# Actual user
ACTUAL_USER=$(id -u -n)

QT_QPA_PLATFORMTHEME="qt6ct";                       		export QT_QPA_PLATFORMTHEME
QT_QPA_PLATFORM="wayland";					export QT_QPA_PLATFORM

XDG_RUNTIME_DIR=/var/run/xdg/$ACTUAL_USER;			export XDG_RUNTIME_DIR
XDG_SESSION_TYPE="wayland";					export XDG_SESSION_TYPE
XDG_SESSION_DESKTOP="sway";					export XDG_SESSION_DESKTOP
XDG_CURRENT_DESKTOP="sway";					export XDG_CURRENT_DESKTOP

SDL_VIDEODRIVER="wayland";					export SDL_VIDEODRIVER

GOPATH=$HOME/.golang;						export GOPATH
RUST_SRC_PATH="/usr/local/lib/rustlib/src/rust/library";	export RUST_SRC_PATH

MOZ_ACCELERATED=1;						export MOZ_ACCELERATED
MOZ_WEBRENDER=1;						export MOZ_WEBRENDER
MOZ_ENABLE_WAYLAND=1;						export MOZ_ENABLE_WAYLAND

XCURSOR_SIZE=24;						export XCURSOR_SIZE
XCURSOR_THEME="Catppuccin-Macchiato-Dark";			export XCURSOR_THEME
XKB_DEFAULT_LAYOUT="us";					export XKB_DEFAULT_LAYOUT
XKB_DEFAULT_VARIANT="intl";					export XKB_DEFAULT_VARIANT

# Font rendering
FREETYPE_PROPERTIES="cff:no-stem-darkening=0.0 autofitter:no-stem-darkening=0.0";	export FREETYPE_PROPERTIES

