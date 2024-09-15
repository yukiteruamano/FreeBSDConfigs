#!/usr/bin/env sh

# Definición de colores para Polybar
GREEN="%{F#a6e3a1}"	# Verde
RED="%{F#f38ba8}"	# Rojo

CHECK_NET=$(ifconfig re0 | grep 'status: active')

if [ -n "$CHECK_NET" ]; then
	echo -n "${GREEN}YES${GREEN}"
else
        echo -n "${RED}NO${RED}"
fi