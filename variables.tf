variable "name" {
  type        = string
  description = "Name of the container registry (alphanumeric only, globally unique, 5-50 chars)"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group to deploy into"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "sku" {
  type        = string
  description = "SKU of the container registry. Possible values: Basic, Standard, Premium"
  default     = "Standard"
}

variable "kubelet_identity_object_id" {
  type        = string
  description = "Object ID of the AKS kubelet managed identity, used to grant AcrPull access"
}
