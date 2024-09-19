#/usr/bin/env sh

DISPLAY=:0 feh --bg-fill "$(find /home/yukiteru/Imágenes/WallpaperUHD/* -type f | sort --random-sort | head -n 1)"
