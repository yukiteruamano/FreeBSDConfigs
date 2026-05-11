#!/usr/bin/env bash

# Nombre del proceso a buscar
PROCESS="waybar"

# Usamos pgrep para detectar si el proceso existe
# pgrep es mucho más eficiente que pipear ps | grep | wc
if pgrep -x "$PROCESS" > /dev/null; then
    echo "Waybar detectado. Reiniciando..."
    pkill -x "$PROCESS"
    # Esperar un segundo para asegurar que el proceso se cerró
    sleep 1
else
    echo "Waybar no está en ejecución."
fi

# Configuración de rutas
SDIR="$HOME/.config/waybar"

# Lanzar waybar en segundo plano redireccionando salida para evitar ruidos en terminal
waybar -c "$SDIR"/config -s "$SDIR"/style.css > /dev/null 2>&1 &