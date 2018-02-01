# Setup

This assumes you are building a Singularity container locally on a Mac

Make sure you've already installed Vagrant, since its needed to run Singularity on a Mac
```
brew cask install virtualbox
brew cask install vagrant
brew cask install vagrant-manager
```

If you have trouble install Vagrant with homebrew, try using [this](https://releases.hashicorp.com/vagrant/2.0.1/vagrant_2.0.1_x86_64.dmg).

# Creating the Container

The workflow for creating a Singularity container on a Mac through Vagrant is saved in the included `Makefile`.

Make the container by running:

```bash
make container
```

And run a test on the created container with

```bash
make test
```

## Output

If everything worked, the following files should be created:

- `singularity-vm/image/singularity-container-samtools`: the Singularity container file for samtools

- `singularity-vm/image/samtools-version.txt`: the output from running samtools inside the container, should look like this:

```
samtools 1.6
Using htslib 1.6
Copyright (C) 2017 Genome Research Ltd.
```

# Resources

http://singularity.lbl.gov/install-mac

https://app.vagrantup.com/singularityware/boxes/singularity-2.4

https://releases.hashicorp.com/vagrant/2.0.1/vagrant_2.0.1_x86_64.dmg

http://singularity.lbl.gov/docs-build-container

http://singularity.lbl.gov/docs-recipes

https://github.com/qbicsoftware/qbic-singularity-samtools
