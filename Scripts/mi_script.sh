#!/bin/bash

# ---------------------------------------------------------
# Script para alineamiento y análisis filogenético de genes
# Autor: Isabel Silva
# Fecha: julio 2025
# ---------------------------------------------------------


# Define ruta base
PROYECTO_DIR="/u/scratch/d/dechavez/Bioinformatica-PUCE/MastBio/MISR/Orchid_proyect"

# Crear carpeta de resultados si no existe
mkdir -p $PROYECTO_DIR/Results

# Verificar existencia de entrada
if [ ! -f "$PROYECTO_DIR/Data/genes.fasta" ]; then
  echo "ERROR: No se encuentra el archivo genes.fasta en la carpeta Data."
  exit 1
fi

# Ejecutar MUSCLE
$PROYECTO_DIR/Scripts/muscle3.8.31_i86linux64 \
  -in $PROYECTO_DIR/Data/genes.fasta \
  -out $PROYECTO_DIR/Results/alineamiento.fasta

# Verificar si se creó el alineamiento
if [ ! -f "$PROYECTO_DIR/Results/alineamiento.fasta" ]; then
  echo "ERROR: El archivo de alineamiento no fue creado."
  exit 1
fi

# Ejecutar análisis filogenético con IQ-TREE
echo "Ejecutando IQ-TREE..."
module load iqtree/2.2.2.6
iqtree -s "$PROYECTO_DIR/Results/alineamiento.fasta" \
       -m MFP -bb 1000 -nt AUTO \
       -pre "$PROYECTO_DIR/Results/arbol"

echo "Análisis completado. Revisa la carpeta Results."
