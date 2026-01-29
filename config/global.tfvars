# Global Terraform Variables
# Use with: terraform plan -var-file="~/.terraform.d/global.tfvars"

# Common tags for all resources
default_tags = {
  Environment   = "dev"
  Owner        = "travis"
  Project      = "dotfiles"
  ManagedBy    = "terraform"
  CreatedDate  = "2025-10-05"
}

# Azure-specific defaults
azure_location = "West Central US"
azure_location_short = "wcus2"

# Naming conventions
naming_prefix = "tf"
environment   = "dev"

# Common resource sizing
vm_size = "Standard_B2s"