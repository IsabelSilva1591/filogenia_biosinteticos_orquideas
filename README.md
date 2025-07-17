<<<<<<< HEAD
# Filogenia de Genes de Rutas Biosintéticas en Orquídeas

Este proyecto tiene como objetivo estudiar la filogenia de genes relacionados con rutas biosintéticas en orquídeas, utilizando herramientas de alineamiento, inferencia filogenética y análisis evolutivo. El trabajo se ha desarrollado principalmente en el clúster de cómputo Hoffman2, complementado con organización local y respaldo en GitHub.

---

## Objetivo

Analizar filogenéticamente genes biosintéticos clave en diferentes géneros de orquídeas, comenzando con un análisis 3x3 de los genes:
- **CHS** (chalcona sintasa)
- **TPS** (terpeno sintasa)
- **BBS** (bibenzil sintasa)

---

## Estructura del Proyecto

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

## Herramientas Utilizadas

- `esearch` y `efetch` (NCBI): descarga de secuencias
- `MUSCLE`: alineamiento múltiple
- `IQ-TREE`: construcción de árboles filogenéticos
- `Bash`: automatización de procesos
- `Hoffman2`: entorno de cómputo de alto rendimiento

---

## Ejecución en Hoffman2

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
=======
# Filogenia de Genes Biosintéticos en Orquídeas

## Introducción

El objetivo principal de este proyecto es realizar un análisis filogenético de genes involucrados en la biosíntesis de metabolitos secundarios en orquídeas, con énfasis en tres enzimas clave: chalcona sintasa (CHS), terpeno sintasa (TPS) y bibenzil sintasa (BBS). Estas enzimas participan en rutas biosintéticas críticas para la producción de flavonoides, terpenoides y estilbenos, compuestos que desempeñan un rol fundamental en la pigmentación, defensa contra patógenos y adaptación ambiental de las plantas.

Mediante el análisis de secuencias de genes homólogos en diferentes especies de Dendrobium y Phalaenopsis, se busca establecer relaciones evolutivas y filogenéticas, identificar regiones conservadas y explorar la divergencia funcional entre linajes. Este enfoque permite no solo entender la evolución molecular de estas vías metabólicas, sino también identificar potenciales candidatos para ingeniería genética o estudios de conservación.

Además, la información obtenida puede contribuir al entendimiento del valor farmacológico y ecológico de estos metabolitos en orquídeas, ya que muchos compuestos biosintetizados tienen propiedades antioxidantes, antimicrobianas y anticancerígenas, lo cual ha despertado un gran interés en la biotecnología vegetal y medicina natural (Yang et al., 2021).


## Objetivo

Analizar comparativamente la filogenia de tres genes clave en rutas biosintéticas: **chalcona sintasa (CHS)**, **terpeno sintasa (TPS)** y **bibenzil sintasa (BBS)** en distintas especies del género *Dendrobium* y *Phalaenopsis*.

## Metodología

### 1. Recuperación de secuencias

Las secuencias fueron obtenidas del NCBI usando la herramienta `esearch` y `efetch` (EDirect). Por ejemplo:

```bash
esearch -db nucleotide -query "chalcone synthase[Gene] AND Dendrobium[Organism]" | efetch -format fasta > chs_dendrobium.fasta
```

### 2. Alineamiento

Se utilizó **MUSCLE v3.8.31** para realizar el alineamiento múltiple de secuencias:

```bash
./muscle3.8.31_i86linux64 -in chs_varias_orquideas.fasta -out alineamiento_chs.fasta
```

### 3. Análisis filogenético

El árbol filogenético fue generado usando **IQ-TREE v2.2.2.6**, incluyendo selección automática de modelo evolutivo:

>>>>>>> eda9b4e (Agrega README con descripción del proyecto)
```bash
module load iqtree/2.2.2.6
iqtree -s alineamiento_chs.fasta -m MFP -nt AUTO -pre arbol_chs
```

<<<<<<< HEAD
---

## Avances

-  Proyecto estructurado
-  Scripts de descarga y análisis probados
-  GitHub actualizado (excepto archivos >100MB)
-  Archivo `chs_all.fasta` no subido por exceder el límite de GitHub (270 MB)

---

##  Recomendaciones

- Evitar subir archivos pesados a GitHub
- Utilizar `.gitignore` para excluir archivos >100 MB
- Documentar todos los comandos útiles en scripts y README

---

## Autora

Isabel Silva  
[GitHub: IsabelSilva1591](https://github.com/IsabelSilva1591)

## Referencias
- Edgar, R.C. (2004). MUSCLE: multiple sequence alignment with high accuracy and high throughput. *Nucleic Acids Research*, 32(5), 1792–1797.
- Minh, B.Q. et al. (2020). IQ-TREE 2: New Models and Efficient Methods for Phylogenetic Inference in the Genomic Era. *Molecular Biology and Evolution*, 37(5), 1530–1534.
- NCBI GenBank: https://www.ncbi.nlm.nih.gov/genbank/
=======
### 4. Visualización

Los archivos `.treefile` generados fueron visualizados en herramientas como iTOL para interpretar la relación evolutiva entre las secuencias.

## Resultados

- Se alinearon correctamente las secuencias de los genes CHS, TPS y BBS de al menos tres especies distintas por cada uno.
- Se construyeron árboles filogenéticos que revelan la divergencia entre especies, así como secuencias con posibles anomalías (porcentaje elevado de ambigüedad).
- Las secuencias de CHS permitieron identificar relaciones filogenéticas claras entre especies de *Dendrobium*, *Phalaenopsis* y *Vanda*.

## Conclusiones

El enfoque filogenético permite explorar la evolución molecular de enzimas biosintéticas en orquídeas. Aunque el conjunto inicial de datos fue reducido (3x3), este análisis demuestra el potencial del pipeline para estudios más amplios. Se propone extender este trabajo a más especies y genes, con miras a una futura publicación científica.

## Herramientas utilizadas

- [NCBI EDirect](https://www.ncbi.nlm.nih.gov/books/NBK179288/)
- [MUSCLE](https://www.drive5.com/muscle/)
- [IQ-TREE](http://www.iqtree.org/)
- Bash + Git + GitHub

## Referencias

-Cheynier, V., Comte, G., Davies, K. M., Lattanzio, V., & Martens, S. (2013). Plant phenolics: recent advances on their biosynthesis, genetics and ecophysiology. Plant Physiology and Biochemistry, 72, 1–20. https://doi.org/10.1016/j.plaphy.2013.05.009

- Edgar, R. C. (2004). MUSCLE: multiple sequence alignment with high accuracy and high throughput. *Nucleic Acids Research*, 32(5), 1792–1797.
- Minh, B. Q., et al. (2020). IQ-TREE 2: New Models and Efficient Methods for Phylogenetic Inference in the Genomic Era. *Molecular Biology and Evolution*, 37(5), 1530–1534.
- NCBI. (2024). *National Center for Biotechnology Information*. https://www.ncbi.nlm.nih.gov
- Yang, L., Wen, K. S., Ruan, X., Zhao, Y. X., Wei, F., & Wang, Q. (2018). Response of plant secondary metabolites to environmental factors. Molecules, 23(4), 762. https://doi.org/10.3390/molecules23040762
>>>>>>> eda9b4e (Agrega README con descripción del proyecto)
