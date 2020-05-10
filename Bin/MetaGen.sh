amptk illumina -i ../metagenomica/fastq -o amptk/ -f GTGARTCATCRARTYTTTG -r CCTSCSCTTANTDATATGC -l 300 --min_len 200 --full_length --cleanup

amptk cluster -i amptk.demux.fq.gz -o cluster -m 2 --uchime_ref ITS

amptk filter -i cluster.otu_table.txt -o filter -f cluster.cluster.otus.fa -p 0.005 --min_reads_otu 2

amptk taxonomy -i filter.final.txt -o taxonomy -f filter.filtered.otus.fa -m ../metagenomica/amptk.mapping_file.txt -d ITS2 --tax_filter Fungi

