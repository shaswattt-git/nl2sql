# Project ID
variable "project_id" {
  description = "The ID of your Google Cloud project"
  type        = string
  default     = "instant-theater-417608" # Replace with your actual project ID
}
# Zone
variable "zone" {
  type        = string
  default     = "europe-west2-a" # Replace with your actual project ID
}
# Region
variable "region" {
  type        = string
  default     = "europe-west2" # Replace with your actual project ID
}

#VPC name
variable "vpc" {
  type        = string
  default     = "default" 
}

#Subnet name
variable "subnet" {
  type        = string
  default     = "default" 
}

# Key(Json) of the service account to be used to authenticate terraform
variable "service_account_key" {
  description = "The path to the json file"
  type        = string
  default     = "./instant-theater-417608-e7f850138431.json" 
}

# Artifact Registry Repository to store Docker images
variable "artifact-reg-repo" {
  type        = string
  default     = "ig-q-repo" 
}

#Docker image name
variable "image_name" {
  type        = string
  default     = "sample-tf" 
}

#Cloud Run service name
variable "cr-service-name" {
  type        = string
  default     = "nl2sql" 
}

#Service Account to be used for Cloud Run service
variable "cr-sa" {
  type        = string
  default     = "terraform@instant-theater-417608.iam.gserviceaccount.com" 
}

