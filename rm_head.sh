#!/bin/bash

# Verificar que head.txt existe
if [ ! -f "head.txt" ]; then
    echo "Error: No se encuentra head.txt"
    exit 1
fi

# Procesar cada archivo
for archivo in *.txt; do
    if [ "$archivo" != "head.txt" ]; then
        echo "Procesando: $archivo"
        
        # Crear archivo temporal sin las líneas de head.txt
        grep -v -x -f head.txt "$archivo" > "$archivo.tmp"
        
        # Reemplazar el archivo original si el temporal no está vacío
        if [ -s "$archivo.tmp" ]; then
            mv "$archivo.tmp" "$archivo"
            echo "  ✓ Líneas eliminadas correctamente"
        else
            echo "  ⚠ El archivo resultante estaría vacío, se mantiene el original"
            rm "$archivo.tmp"
        fi
    fi
done

echo "Proceso completado"