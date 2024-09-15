#!/usr/bin/env sh

# Definición de colores para Polybar
COLOR_PERSONAL="%{F#a6e3a1}"   # Verde
COLOR_WORK="%{F#fab387}"       # Azul
COLOR_NO="%{F#f38ba8}"         # Rojo
COLOR_RESET="%{F-}"            # Resetear color

CHECK_VPN="$(ifconfig | grep -c tun0)"
CHECK_WG="$(ifconfig | grep -c wg0)"

if [ "$CHECK_WG" = "1" ]; then
	echo -n "${COLOR_PERSONAL}Personal${COLOR_RESET}"
elif [ "$CHECK_VPN" = "1" ]; then
	echo -n "${COLOR_WORK}Work${COLOR_RESET}"
else
	echo -n "${COLOR_NO}No${COLOR_RESET}"
fi
