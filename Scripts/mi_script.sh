#!/bin/bash

# Define ruta base
PROYECTO_DIR="/u/scratch/d/dechavez/Bioinformatica-PUCE/MastBio/MISR/Orchid_proyect"

mkdir -p $PROYECTO_DIR/Results

# Ejecutar MUSCLE
$PROYECTO_DIR/Scripts/muscle3.8.31_i86linux64 \
  -in $PROYECTO_DIR/Data/genes.fasta \
  -out $PROYECTO_DIR/Results/alineamiento.fasta

# Ejecutar IQ-TREE
module load iqtree
iqtree -s $PROYECTO_DIR/Results/alineamiento.fasta -m MFP -bb 1000 -nt AUTO -pre $PROYECTO_DIR/Results/arbol

