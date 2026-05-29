# container_registry

Creates an Azure Container Registry and grants `AcrPull` to an AKS kubelet managed identity so cluster nodes can pull images without explicit image pull secrets.

## Usage

```hcl
module "container_registry" {
  source = "./modules/container_registry"

  name                       = replace("${terraform.workspace}acr", "-", "")
  resource_group_name        = azurerm_resource_group.rg_cluster.name
  location                   = var.azure_region
  kubelet_identity_object_id = module.cluster.kubelet_identity[0].object_id
}
```

## Inputs

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `name` | `string` | — | Name of the registry. Must be alphanumeric, globally unique, 5–50 chars. |
| `resource_group_name` | `string` | — | Resource group to deploy into. |
| `location` | `string` | — | Azure region. |
| `sku` | `string` | `"Standard"` | Registry SKU: `Basic`, `Standard`, or `Premium`. |
| `kubelet_identity_object_id` | `string` | — | Object ID of the AKS kubelet managed identity. |

## Outputs

| Name | Description |
|------|-------------|
| `login_server` | Registry URL (e.g. `gvzprodnevisacr.azurecr.io`). |
