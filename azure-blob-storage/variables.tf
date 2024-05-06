 variable "resource_group_name" {
  description = "Nazwa grupy zasobów Azure."
  type        = string
}

variable "resource_group_location" {
  description = "Lokalizacja dla grupy zasobów Azure."
  type        = string
}

variable "storage_account_name" {
  description = "Nazwa konta magazynu Azure."
  type        = string
}

variable "storage_account_tier" {
  description = "Typ poziomu konta magazynu Azure."
  type        = string
}

variable "storage_account_replication_type" {
  description = "Typ replikacji konta magazynu Azure."
  type        = string
}

variable "storage_container_name" {
  description = "Nazwa kontenera magazynu Azure."
  type        = string
}

variable "storage_container_access_type" {
  description = "Typ dostępu do kontenera magazynu Azure."
  type        = string
}