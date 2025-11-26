#!/bin/bash

# Versión interactiva simple - pregunta por cada archivo una vez
output="archivo_unido.txt"

# Verificar si el archivo de salida existe y preguntar
if [ -f "$output" ]; then
    read -p "El archivo '$output' ya existe. ¿Deseas sobrescribirlo? (s/n): " resp
    if [[ ! $resp =~ ^[Ss]$ ]]; then
        echo "Operación cancelada."
        exit 1
    fi
fi

# Crear/limpiar el archivo de salida
> "$output"

# Contador de archivos
i=1

echo "Procesando archivos en el directorio actual..."

# Procesar cada archivo .txt
for file in *.txt; do
    # Saltar el archivo de salida y verificar que es un archivo regular
    if [ "$file" != "$output" ] && [ -f "$file" ]; then

        # Preguntar al usuario sobre este archivo
        read -p "¿Deseas añadir el archivo '$file'? (s/n): " respuesta

        if [[ $respuesta =~ ^[Ss]$ ]]; then
            # Añadir el archivo
            printf "=== Archivo %03d: %s ===\n\n" $i "$file" >> "$output"
            cat "$file" >> "$output"
            echo -e "\n---\n" >> "$output"
            echo "✓ Añadido: $file"
            ((i++))
        else
            echo "✗ Saltado: $file"
        fi
    fi
done

echo ""
echo "¡Proceso completado!"
if [ $i -gt 1 ]; then
    echo "Archivo generado: $output"
    echo "Total de archivos añadidos: $((i-1))"
else
    echo "No se añadió ningún archivo."
    rm "$output"  # Eliminar el archivo vacío
fi
