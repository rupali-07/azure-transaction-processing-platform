param location string
param environment string
param functionAppName string

resource workspace 'Microsoft.OperationalInsights/workspaces@2022-10-01' = {
  name: 'txn-logs-${environment}'
  location: location
  properties: {
    sku: {
      name: 'PerGB2018'
    }
  }
}

resource insights 'Microsoft.Insights/components@2020-02-02' = {
  name: 'txn-ai-${environment}'
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: workspace.id
  }
}
