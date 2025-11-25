#!/bin/bash

FF_WINDOW=$(xdotool search --name "Mozilla Firefox" | head -1)

xdotool windowactivate $FF_WINDOW
sleep 2

# Ir a primera pestaña
xdotool key ctrl+1
sleep 1

initial_content=""
current_tab=1
max_tabs=20

# Capturar contenido inicial
xdotool key ctrl+a ctrl+c
sleep 0.5
initial_content=$(xclip -o -selection clipboard 2>/dev/null | head -100)

while [ $current_tab -le $max_tabs ]; do
    echo "Procesando pestaña $current_tab"

    # Capturar contenido actual
    xdotool key ctrl+a ctrl+c
    sleep 0.5
    current_content=$(xclip -o -selection clipboard 2>/dev/null | head -100)

    # Verificar si volvimos al inicio (para pestañas > 1)
    if [ $current_tab -gt 1 ]; then
        if [ "$current_content" = "$initial_content" ]; then
            echo "¡Volvimos a la primera pestaña! Fin del ciclo."
            break
        fi
    fi

    # Guardar archivo completo
    xclip -o -selection clipboard > "pestaña_${current_tab}.txt" 2>/dev/null
    echo "  ✓ Guardado: pestaña_${current_tab}.txt"

    # Navegar a siguiente pestaña
    xdotool key ctrl+Tab
    sleep 1.5

    ((current_tab++))
done

echo "Procesadas $(($current_tab-1)) pestañas"
