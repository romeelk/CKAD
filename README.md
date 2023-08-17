# CKAD
My prep for CKAD

## Setup for the exam
Important aspect of the CKAD exam is to get your terminal setup correct.
The exam is very terminal driven with lots of yaml to paste and run.

## Setup kubectl

Use the following to alias kubectl for generating dry run yaml output

```
alias k=kubectl
export do="--dry-run=client -oyaml"
export now="--force --grace-period 0"
```

## Setup VIM

One aspect of yaml is the levels of indentation should be correct. Use these in your ~/.virmc file:

```
set tabstop=2
set expandtab
set shiftwidth=2
```

## Docker and PODMAN setup

For the exam you will need to understand how to build docker images using the docker commands.
One alternative to docker is podman if you don't have a license:

### Install Podman

If you have a Mac install Podman via brew:
Note if you have M1 archiecture make sure you intall the correct version.

```
    arch -arm64 brew install podman
```
    

