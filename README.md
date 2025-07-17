# Filogenia de Genes de Rutas Biosintéticas en Orquídeas


Este proyecto explora la evolución molecular de genes implicados en rutas biosintéticas de metabolitos secundarios en orquídeas, enfocándose en tres enzimas clave: **CHS**, **TPS** y **BBS**. Se utilizan herramientas de alineamiento y análisis filogenético sobre secuencias de especies de *Dendrobium* y *Phalaenopsis*. El desarrollo se ha realizado en el clúster de cómputo **Hoffman2**, con respaldo en GitHub.

---
## Tabla de contenido
- [Introducción](#introducción)
- [Objetivo](#objetivo)
- [Estructura del Proyecto](#estructura-del-proyecto)
- [Herramientas Utilizadas](#herramientas-utilizadas)
- [Ejecución](#ejecución)
- [Ejemplo de Resultado](#ejemplo-de-resultado)
- [Instalación rápida (opcional)](#instalación-rápida-opcional)
- [Avances](#avances)
- [Recomendaciones](#recomendaciones)
- [Autora](#autora)
- [Referencias](#referencias)
- [Licencia](#licencia)
- [Cómo citar este proyecto](#cómo-citar-este-proyecto)

---

## Introducción
Las orquídeas (Orchidaceae) constituyen una de las familias más amplias y diversas del reino Plantae, con más de 25,000 especies descritas y una distribución global que abarca desde selvas tropicales hasta zonas alpinas. Su éxito adaptativo ha sido atribuido a una combinación de estrategias reproductivas complejas, interacciones altamente especializadas con polinizadores y simbiontes, y a una notable diversificación química mediada por metabolitos secundarios (Givnish et al., 2015; Cheynier et al., 2013).

Los metabolitos secundarios son compuestos bioactivos derivados de rutas metabólicas especializadas. Aunque no son esenciales para el crecimiento o desarrollo básico de la planta, desempeñan roles cruciales en la defensa contra herbívoros y patógenos, la atracción de polinizadores, la competencia interespecífica y la tolerancia a estrés abiótico (Yang et al., 2018; Wink, 2003). En orquídeas, estos compuestos incluyen flavonoides, terpenoides, estilbenos, alcaloides, lignanos y fenilpropanoides, entre otros.

Los genes responsables de la biosíntesis de estos metabolitos han sido objeto de duplicación, diversificación y, en muchos casos, de neofuncionalización, dando lugar a nuevas funciones bioquímicas a lo largo de la evolución de las angiospermas (Pichersky & Gang, 2000; Schluttenhofer & Yuan, 2015). La evolución de estas rutas no es aleatoria: está influenciada por presiones ecológicas y ambientales que moldean la expresión, regulación y especificidad de estas enzimas (Zhang et al., 2020; Moghe & Last, 2015).

En este contexto, tres enzimas se destacan por su papel en rutas biosintéticas clave:

Chalcona sintasa (CHS): cataliza el primer paso comprometido en la biosíntesis de flavonoides, pigmentos esenciales en la coloración floral y antioxidantes reconocidos.

Terpeno sintasa (TPS): clave en la producción de compuestos volátiles como monoterpenos y sesquiterpenos, fundamentales en la atracción de polinizadores y defensa química.

Bibenzil sintasa (BBS): relacionada con la producción de estilbenoides y derivados fenólicos, con funciones antimicrobianas y antioxidantes (Zhang et al., 2015).

Estudiar filogenéticamente estos genes en especies de los géneros Dendrobium y Phalaenopsis no solo permite reconstruir sus trayectorias evolutivas, sino también identificar regiones conservadas, eventos de duplicación génica, y posibles señales de selección positiva. Además, estos estudios tienen aplicaciones prácticas: pueden identificar genes candidatos para ingeniería metabólica o conservación de especies con metabolitos bioactivos de interés médico, cosmético o agrícola (Yang et al., 2018; Vogt, 2010). 

Este proyecto, por tanto, se sitúa en la intersección entre la biología evolutiva, la genómica comparada y la biotecnología vegetal, con el objetivo de comprender cómo la evolución molecular ha dado forma a la diversidad química de una de las familias vegetales más extraordinarias del planeta.


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

## Ejecución

```bash
# 1. Descargar secuencias
esearch -db nucleotide -query "chalcone synthase[Gene] AND Dendrobium[Organism]" | \
efetch -format fasta > chs_dendrobium.fasta

# 2. Alinear secuencias
./muscle3.8.31_i86linux64 -in ../Data/chs_dendrobium.fasta -out ../Results/alineamiento_chs.fasta

# 3. Inferencia filogenética
module load iqtree/2.2.2.6
iqtree -s alineamiento_chs.fasta -m MFP -nt AUTO -pre arbol_chs

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


## Ejecución



> Árbol filogenético generado con IQ-TREE a partir de secuencias de CHS en *Dendrobium*.

---

## Instalación rápida (opcional)

```bash
git clone https://github.com/IsabelSilva1591/Orchid_proyect.git
cd Orchid_proyect
```
---
Requisitos:
- Linux/macOS
- `bash`, `MUSCLE`, `IQ-TREE` instalados
- Acceso a NCBI (opcional: Entrez Direct)

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
-Givnish, T. J., et al. (2015). Orchid phylogenomics and multiple drivers of their extraordinary diversification. Proceedings of the Royal Society B, 282(1814), 20151553. https://doi.org/10.1098/rspb.2015.1553

-Cheynier, V., et al. (2013). Plant phenolics: recent advances on their biosynthesis, genetics and ecophysiology. Plant Physiology and Biochemistry, 72, 1–20.

-Yang, L., et al. (2018). Response of plant secondary metabolites to environmental factors. Molecules, 23(4), 762.

-Pichersky, E., & Gang, D. R. (2000). Genetics and biochemistry of secondary metabolites in plants: an evolutionary perspective. Trends in Plant Science, 5(10), 439–445.

-Schluttenhofer, C., & Yuan, L. (2015). Regulation of specialized metabolism by WRKY transcription factors. Plant Physiology, 167(2), 295–306.

-Wink, M. (2003). Evolution of secondary metabolites from an ecological and molecular phylogenetic perspective. Phytochemistry, 64(1), 3–19. https://doi.org/10.1016/S0031-9422(03)00300-5

-Moghe, G. D., & Last, R. L. (2015). Something old, something new: conserved enzymes and the evolution of novelty in plant specialized metabolism. Plant Physiology, 169(3), 1512–1523.
-Zhang, Y., et al. (2020). Natural flavonoids and terpenoids with potential anticancer properties: mechanisms and structure–activity relationships. Current Medicinal Chemistry, 27(26), 4357–4392.

-Vogt, T. (2010). Phenylpropanoid biosynthesis. Molecular Plant, 3(1), 2–20.


---

## Licencia

Este proyecto está bajo la [Licencia MIT](https://opensource.org/licenses/MIT).

---

## Cómo citar este proyecto

<<<<<<< HEAD
> Silva, I. (2025). *Filogenia de Genes de Rutas Biosintéticas en Orquídeas*. GitHub. https://github.com/IsabelSilva1591/Orchid_proyect
=======
> Silva, I. (2025). *Filogenia de Genes de Rutas Biosintéticas en Orquídeas*. GitHub. https://github.com/IsabelSilva1591/Orchid_proyect

>>>>>>> 401a050a41d17b046d776bdd6eaa23cf29a1585d
