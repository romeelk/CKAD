#!/bin/bash
MYACR=rkacrbak
az group create -n myContainerRegistryResourceGroup -l uksouth
az acr create -n $MYACR -g myContainerRegistryResourceGroup --sku basic
