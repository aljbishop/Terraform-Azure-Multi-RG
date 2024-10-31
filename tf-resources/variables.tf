variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
  default = "UK South"
}

variable "app_service_plan_name" {
  type = string
}

variable "web_app_name" {
  type = string
}

variable "sql_server_name" {
  type = string
}

variable "create_sql_database" {
  type = bool
  default = true
}

variable "sql_database_name" {
  type = string
}

variable "adminuser" {
  type = string
  sensitive   = true
}

variable "adminpassword" {
  type = string
  sensitive   = true
}

variable "storage_account_name" {
  type = string
}

variable "app_service_sku" {
  type = string
  default = "B1"
}

variable "app_service_os" {
  type = string
  default = "Windows"
}

variable "sql_server_version" {
  type = string
  default = "12.0"
}

variable "sql_db_sku" {
  type = string
  default = "S0"
}

variable "storage_account_tier" {
  type = string
  default = "Standard"
}

variable "storage_account_replication_type" {
  type = string
  default = "RAGRS"
}

variable "storage_account_kind" {
  type = string
  default = "StorageV2"
}

variable "storage_account_min_tls_version" {
  type = string
  default = "TLS1_2"
}


variable "tags" {
  type = map(string)
  default = {
    for tag_key, tag_value in {
      "purpose" = "G17 POC"
      "env"     = "SANDBOX"
    } : tag_key => tag_value
  }
}