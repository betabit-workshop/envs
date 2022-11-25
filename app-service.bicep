param location string = resourceGroup().location
param appname string

resource app_service_plan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: 'example-asp'
  location: location
  sku: {
    tier: 'Shared'
    name: 'D1'
  }
}

resource app_service 'Microsoft.Web/sites@2022-03-01' = {
  name: appname
  location: location
  properties: {
    serverFarmId: app_service_plan.id
    siteConfig: {
      netFrameworkVersion: 'v7.0'
    }
  }
}
