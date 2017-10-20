# The Samtools application as a Singularity container
A singularity container for the [Samtools](http://www.htslib.org/) tool to be used in several analysis pipelines at QBIC. We use specific tags for releasing updated containers, so stay tuned :-) 

## Creating the container

To create the container from scratch, run for example:

```bash
git clone https://github.com/qbicsoftware/qbic-containers
cd qbic-containers/samtools
sudo singularity build singularity-container-samtools Singularity
```

## Running the containers applications

```bash
singularity exec singularity-container-samtools samtools
```
Check out our nextflow workflow scripts to see how we utilize the container directly on our infrastructure. 

If you have further questions, ask here via GitHub or alexander.peltzer@qbic.uni-tuebingen.de
