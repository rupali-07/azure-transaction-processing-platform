#!/bin/bash

RESOURCE_GROUP="rg-txn-platform"
LOCATION="eastus"

az group create \
  --name $RESOURCE_GROUP \
  --location $LOCATION

az deployment group create \
  --resource-group $RESOURCE_GROUP \
  --template-file bicep/main.bicep \
  --parameters parameters/dev.parameters.json
