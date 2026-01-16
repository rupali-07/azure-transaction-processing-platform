param location string = resourceGroup().location
param environment string

module cosmos './cosmosdb.bicep' = {
  name: 'cosmosModule'
  params: {
    location: location
    environment: environment
  }
}

module servicebus './servicebus.bicep' = {
  name: 'serviceBusModule'
  params: {
    location: location
    environment: environment
  }
}

module functionapp './functionapp.bicep' = {
  name: 'functionAppModule'
  params: {
    location: location
    environment: environment
    cosmosUri: cosmos.outputs.cosmosUri
    cosmosKey: cosmos.outputs.cosmosKey
  }
}

module apim './apim.bicep' = {
  name: 'apimModule'
  params: {
    location: location
    environment: environment
    functionAppName: functionapp.outputs.functionAppName
  }
}

module monitoring './monitoring.bicep' = {
  name: 'monitoringModule'
  params: {
    location: location
    environment: environment
    functionAppName: functionapp.outputs.functionAppName
  }
}
