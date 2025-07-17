# Filogenia de Genes de Rutas Biosintéticas en Orquídeas

Este proyecto tiene como objetivo estudiar la filogenia de genes relacionados con rutas biosintéticas en orquídeas, utilizando herramientas de alineamiento, inferencia filogenética y análisis evolutivo. El trabajo se ha desarrollado principalmente en el clúster de cómputo Hoffman2, complementado con organización local y respaldo en GitHub.

---

## 🔬 Objetivo

Analizar filogenéticamente genes biosintéticos clave en diferentes géneros de orquídeas, comenzando con un análisis 3x3 de los genes:
- **CHS** (chalcona sintasa)
- **TPS** (terpeno sintasa)
- **BBS** (bibenzil sintasa)

---

## 🧬 Estructura del Proyecto

```
Orchid_proyect/
├── Data/                # Archivos FASTA y datos descargados
│   ├── chs_varias_orquideas.fasta
│   ├── chs_dendrobium.fasta
│   ├── tps_phalaenopsis.fasta
│   └── bbs_dendrobium.fasta
│
├── Scripts/             # Scripts utilizados para descarga y análisis
│   ├── Get.genes.NCBI.sh
│   ├── muscle3.8.31_i86linux64
│   └── mi_script.sh
│
├── Results/             # Archivos generados por IQ-TREE y MUSCLE
│   ├── alineamiento_chs.fasta
│   ├── arbol_chs.treefile
│   └── arbol_chs.iqtree
│
└── README.md
```

---

## 🔧 Herramientas Utilizadas

- `esearch` y `efetch` (NCBI): descarga de secuencias
- `MUSCLE`: alineamiento múltiple
- `IQ-TREE`: construcción de árboles filogenéticos
- `Bash`: automatización de procesos
- `Hoffman2`: entorno de cómputo de alto rendimiento

---

## 🧪 Ejecución en Hoffman2

1. **Descarga de secuencias:**
```bash
esearch -db nucleotide -query "chalcone synthase[Gene] AND Dendrobium[Organism]" | \
efetch -format fasta > chs_dendrobium.fasta
```

2. **Alineamiento con MUSCLE:**
```bash
./muscle3.8.31_i86linux64 -in ../Data/chs_dendrobium.fasta -out ../Results/alineamiento_chs.fasta
```

3. **Inferencia filogenética con IQ-TREE:**
```bash
module load iqtree/2.2.2.6
iqtree -s alineamiento_chs.fasta -m MFP -nt AUTO -pre arbol_chs
```

---

## 🧭 Avances

- ✅ Proyecto estructurado
- ✅ Scripts de descarga y análisis probados
- ✅ GitHub actualizado (excepto archivos >100MB)
- ⚠️ Archivo `chs_all.fasta` no subido por exceder el límite de GitHub (270 MB)

---

## 📌 Recomendaciones

- Evitar subir archivos pesados a GitHub
- Utilizar `.gitignore` para excluir archivos >100 MB
- Documentar todos los comandos útiles en scripts y README

---

## 👩‍🔬 Autora

Isabel Silva  
[GitHub: IsabelSilva1591](https://github.com/IsabelSilva1591)
