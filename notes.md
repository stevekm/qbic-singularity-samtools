# Notes

Need to figure out how to deal with binding paths...

```bash
singularity exec singularity-container-bwa bwa mem -M -v 1 ./hg19_genome.fa NGS580-demo-data/fastq/HapMap-B17-1267_S8_L001_R1_001.fastq.gz NGS580-demo-data/fastq/HapMap-B17-1267_S8_L001_R2_001.fastq.gz
 singularity shell -B /data:./ singularity-container-bwa
```


## Running the Container Application

```bash
singularity exec singularity-container-samtools samtools --version
# samtools 1.6
# Using htslib 1.6
# Copyright (C) 2017 Genome Research Ltd.

singularity exec singularity-container-samtools samtools view input/HapMap-B17-1267.bam
```
