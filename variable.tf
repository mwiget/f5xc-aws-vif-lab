variable "project_prefix" {
  type        = string
  description = "prefix string put in front of string"
  default     = "mw"
}

variable "project_suffix" {
  type        = string
  description = "prefix string put at the end of string"
  default     = "0"
}

variable "f5xc_api_p12_file" {
  type = string
  default = "cert/playground.staging.api-creds.p12"
}

variable "f5xc_api_url" {
  type = string
  default = "https://playground.staging.volterra.us/api"
}

variable "f5xc_api_ca_cert" {
  type = string
  default = "cert/public_server_ca.crt"
}

variable "f5xc_api_token" {
  type = string
}

variable "f5xc_tenant" {
  type = string
  default = "playground-wtppvaog"
}
