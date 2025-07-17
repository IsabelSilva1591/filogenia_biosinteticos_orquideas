# Filogenia de Genes de Rutas Biosintéticas en Orquídeas

Este proyecto tiene como objetivo estudiar la filogenia de genes relacionados con rutas biosintéticas en orquídeas, utilizando herramientas de alineamiento, inferencia filogenética y análisis evolutivo. El trabajo se ha desarrollado principalmente en el clúster de cómputo Hoffman2, complementado con organización local y respaldo en GitHub.

---

## Introducción
Las orquídeas (Orchidaceae) representan una de las familias más diversas, complejas y fascinantes del reino vegetal. Con más de 25,000 especies descritas y miles de híbridos cultivados, han colonizado prácticamente todos los ecosistemas terrestres, desde selvas tropicales hasta desiertos de alta montaña. Esta extraordinaria diversificación se ha visto impulsada, en parte, por su notable capacidad de adaptación fisiológica y metabólica. Dentro de estas adaptaciones, destaca la producción de metabolitos secundarios, un grupo amplio y variado de compuestos bioactivos que no son esenciales para la supervivencia inmediata de la planta, pero que juegan roles cruciales en su éxito ecológico.

Los metabolitos secundarios incluyen una amplia gama de compuestos como flavonoides, terpenoides, alcaloides, fenilpropanoides y estilbenos. En las orquídeas, estos compuestos tienen funciones que abarcan desde la pigmentación floral (atracción de polinizadores), defensa química contra herbívoros y patógenos, hasta la regulación de respuestas al estrés abiótico como radiación UV, sequía o salinidad. Su producción está finamente regulada a nivel genético y responde tanto a señales internas del desarrollo como a estímulos ambientales (Cheynier et al., 2013; Yang et al., 2018).

Estudios recientes han revelado que muchas de estas rutas biosintéticas presentan una evolución dinámica, incluyendo eventos de duplicación génica, neofuncionalización y pérdida de función. Por lo tanto, entender la evolución de los genes involucrados en estas rutas no solo aporta información clave sobre la biología adaptativa de las orquídeas, sino también sobre sus potenciales aplicaciones en biotecnología, medicina natural y conservación.

En este contexto, tres enzimas clave han sido seleccionadas como foco de análisis: chalcona sintasa (CHS), terpeno sintasa (TPS) y bibenzil sintasa (BBS). Estas catalizan pasos fundamentales en la síntesis de flavonoides, terpenoides y estilbenos, respectivamente. A través de estudios filogenéticos de estos genes en especies de los géneros Dendrobium y Phalaenopsis, se busca comprender sus trayectorias evolutivas, relaciones de homología y patrones de divergencia funcional.

Este proyecto se enmarca en el interés creciente por desentrañar los mecanismos moleculares que sustentan la evolución de la diversidad química vegetal, así como en el aprovechamiento racional de estos recursos para la salud humana, la industria cosmética y la protección de la biodiversidad.

---

## Objetivo

El objetivo general de este proyecto es explorar la evolución molecular de genes clave en rutas biosintéticas de metabolitos secundarios en orquídeas, mediante análisis filogenéticos comparativos de las enzimas CHS, TPS y BBS en diferentes especies de los géneros Dendrobium y Phalaenopsis.

De forma más específica, este estudio busca:

-Establecer relaciones filogenéticas entre secuencias homólogas de CHS, TPS y BBS.

-Identificar regiones conservadas y patrones de divergencia funcional.

-Evaluar la posible duplicación génica o eventos de neofuncionalización.

-Sugerir genes candidatos para bioprospección farmacológica o ingeniería genética.

-Contribuir a estrategias de conservación molecular de especies amenazadas.

Este análisis se sustenta en el creciente interés de la biotecnología vegetal y la medicina tradicional por las propiedades antioxidantes, antimicrobianas, antitumorales y neuroprotectoras de metabolitos derivados de estas rutas (Yang et al., 2018; Zhang et al., 2020).

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
```bash
module load iqtree/2.2.2.6
iqtree -s alineamiento_chs.fasta -m MFP -nt AUTO -pre arbol_chs
```

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
