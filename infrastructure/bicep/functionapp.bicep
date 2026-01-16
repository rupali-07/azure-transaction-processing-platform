param location string
param environment string
param cosmosUri string
param cosmosKey string

var storageName = 'txnstorage${uniqueString(resourceGroup().id)}'
var functionName = 'txn-api-${environment}'

resource storage 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: storageName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}

resource plan 'Microsoft.Web/serverfarms@2022-09-01' = {
  name: 'txn-plan'
  location: location
  sku: {
    name: 'Y1'
    tier: 'Dynamic'
  }
}

resource functionApp 'Microsoft.Web/sites@2022-09-01' = {
  name: functionName
  location: location
  kind: 'functionapp'
  properties: {
    serverFarmId: plan.id
    siteConfig: {
      appSettings: [
        { name: 'AzureWebJobsStorage'; value: storage.properties.primaryEndpoints.blob }
        { name: 'FUNCTIONS_WORKER_RUNTIME'; value: 'python' }
        { name: 'COSMOS_URI'; value: cosmosUri }
        { name: 'COSMOS_KEY'; value: cosmosKey }
      ]
    }
  }
}

output functionAppName string = functionApp.name
