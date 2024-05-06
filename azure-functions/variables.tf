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

variable "app_service_plan_name" {
  description = "Nazwa planu usługi aplikacji Azure."
  type        = string
}

variable "app_service_plan_tier" {
  description = "Poziom planu usługi aplikacji Azure."
  type        = string
}

variable "app_service_plan_size" {
  description = "Rozmiar planu usługi aplikacji Azure."
  type        = string
}

variable "function_app_name" {
  description = "Nazwa aplikacji funkcji Azure."
  type        = string
}
 
