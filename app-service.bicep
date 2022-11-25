param location string = resourceGroup().location
param appname string
resource app_service_plan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: 'example-asp-4357800'
  location: location
  sku: {
    tier: 'Shared'
    name: 'D1'
  }
  kind: 'linux'
}
resource appService 'Microsoft.Web/sites@2020-06-01' = {
  name: appname
  location: location
  properties: {
    serverFarmId: app_service_plan.id
    siteConfig: {
      linuxFxVersion: 'DOTNETCORE|6.0'
    }
  }
}
