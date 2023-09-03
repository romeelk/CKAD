#!/bin/bash

MYACR=rkacrbak

az aks create -n rkAKSCluster -g myContainerRegistryResourceGroup --generate-ssh-keys --attach-acr $MYACR
