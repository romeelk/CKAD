# CKAD
My prep for CKAD

## Setup for the exam
Important aspect of the CKAD exam is to get your terminal setup correct.
The exam is very terminal driven with lots of yaml to paste and run.

## Setup kubectl

Use the following to alias kubectl for generating dry run yaml output

```
alias k=kubectl
export do="--dry-run=client -o yaml"
export now="--force --grace-period 0"
```

## Setup VIM

One aspect of yaml is the levels of indentation should be correct. Use these in your ~/.virmc file:

```
set tabstop=2
set expandtab
set shiftwidth=2
```


