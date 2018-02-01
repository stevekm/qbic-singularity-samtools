SHELL:=/bin/bash

# no default action to take
none:
	echo "This Makefile does not do anything its just a an example template"

check-mac:
	[ "$$(uname)" != "Darwin" ] && echo "this is only for Macs" && exit 1 || :


# ~~~~~ VAGRANT SETUP ~~~~~ #
# Need to have vagrant installed for this to work on a Mac
# might need to use this: https://releases.hashicorp.com/vagrant/2.0.1/vagrant_2.0.1_x86_64.dmg
install-vagrant: check-mac
	brew cask install virtualbox && brew cask install vagrant && brew cask install vagrant-manager

vagrant-installed:
	type vagrant >/dev/null 2>&1 || { echo >&2 "I require vagrant but it's not installed.  Aborting."; exit 1; }

singularity-vm/Vagrantfile:
	mkdir -p singularity-vm && \
	cd singularity-vm && \
	vagrant init singularityware/singularity-2.4 && \
	sed -i '' 's|  # config.vm.synced_folder "../data", "/vagrant_data"|  config.vm.synced_folder "image", "/image"|' Vagrantfile

singularity-vm/image: singularity-vm/Vagrantfile
	mkdir -p singularity-vm/image

singularity-vm/image/build.sh:
	mkdir -p singularity-vm/image && \
	/bin/cp -v build.sh singularity-vm/image/build.sh

singularity-vm/image/Singularity:
	mkdir -p singularity-vm/image && \
	/bin/cp -v Singularity singularity-vm/image/Singularity

singularity-vm: singularity-vm/image singularity-vm/image/build.sh singularity-vm/image/Singularity


# ~~~~~ SINGULARITY SETUP ~~~~~ #
# make the Singularity container inside the Vagrant VM, save the image to the host's 'image' dir
singularity-vm/image/singularity-container-samtools: vagrant-installed singularity-vm
	cd singularity-vm && \
	vagrant up && \
	vagrant ssh -c 'cd /image && sudo singularity build singularity-container-samtools Singularity'
	# vagrant ssh -c 'singularity exec /image/stevekm_fastqc-*.img fastqc --version'

singularity-vm/image/samtools-version.txt: singularity-vm/image/singularity-container-samtools
	cd singularity-vm && \
	vagrant up && \
	vagrant ssh -c 'cd /image && singularity exec singularity-container-samtools samtools --version' > image/samtools-version.txt

test: singularity-vm/image/samtools-version.txt







clean:
	rm -rf singularity-vm
