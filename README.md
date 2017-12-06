# Local Setup

## Install Singularity

http://singularity.lbl.gov/install-mac

Assuming you are using a Mac;

```
brew cask install virtualbox
brew cask install vagrant
brew cask install vagrant-manager
```

Vagrant had issues installing, can also use this one:

https://releases.hashicorp.com/vagrant/2.0.1/vagrant_2.0.1_x86_64.dmg

## Setup Vagrant Singularity VM

Start the Vagrant VM and `ssh` into it

```bash
mkdir singularity-vm
cd singularity-vm

vagrant init singularityware/singularity-2.4
vagrant up
vagrant ssh
```

## Creating the Container

Build the included `samtools` recipe

```bash
git clone https://github.com/stevekm/singularity-samtools-demo.git

cd singularity-samtools-demo

sudo singularity build singularity-container-samtools Singularity
```

## Running the Container Application

```bash
singularity exec singularity-container-samtools samtools view input/HapMap-B17-1267.bam
```


# Notes

```bash
sudo singularity build singularity-container-samtools Singularity.latest

# singularity exec singularity-container-bwa bwa mem -M -v 1 ./hg19_genome.fa NGS580-demo-data/fastq/HapMap-B17-1267_S8_L001_R1_001.fastq.gz NGS580-demo-data/fastq/HapMap-B17-1267_S8_L001_R2_001.fastq.gz
# singularity shell -B /data:./ singularity-container-bwa
```

# Resources

https://app.vagrantup.com/singularityware/boxes/singularity-2.4

http://singularity.lbl.gov/docs-build-container

http://singularity.lbl.gov/docs-recipes


https://github.com/qbicsoftware/qbic-singularity-samtools


some container collections here

https://singularity-hub.org/u/apeltzer

https://singularity-hub.org/collections/93
