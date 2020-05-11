#!/bin/bash

mkdir data

# Se ensamblan los reads forward y reverse,se eliminan los primers y secuencias cortas (menores de 200)

amptk illumina -i ../metagenomica/fastq -o data/amptk/ -f GTGARTCATCRARTYTTTG -r CCTSCSCTTANTDATATGC -l 200 --min_len 200 --full_length --cleanup

# Se hace un filtro de calidad y se agrupan las secuencias en OTUs
amptk cluster -i amptk.demux.fq.gz -o data/cluster -m 2 --uchime_ref ITS
# Index bleed = reads asignados a la muestra incorrecta durante el proceso de secuenciación de Illumina
amptk filter -i cluster.otu_table.txt -o data/filter -f cluster.cluster.otus.fa -p 0.005 --min_reads_otu 2
# AMPtk utiliza la base de datos de secuencias de [UNITE] (https://unite.ut.ee/) para asignar la taxonomía de los OTUs
amptk taxonomy -i filter.final.txt -o data/taxonomy -f filter.filtered.otus.fa -m ../metagenomica/amptk.mapping_file.txt -d ITS2 --tax_filter Fungi

