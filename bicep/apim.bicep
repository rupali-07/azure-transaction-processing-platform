param location string
param environment string
param functionAppName string

resource apim 'Microsoft.ApiManagement/service@2023-03-01-preview' = {
  name: 'txn-apim-${environment}'
  location: location
  sku: {
    name: 'Consumption'
    capacity: 0
  }
  properties: {
    publisherName: 'TxnPlatform'
    publisherEmail: 'admin@example.com'
  }
}
