# Variables
RESOURCE_GROUP_NAME=myResourceGroup
STORAGE_ACCOUNT_NAME=mystorageaccount
CONTAINER_NAME=mycontainer

# Create a resource group
az group create --name $RESOURCE_GROUP_NAME --location australiaeast

# Create a storage account
az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STORAGE_ACCOUNT_NAME --sku Standard_LRS --encryption-services blob

# Get the storage account key
ACCOUNT_KEY=$(az storage account keys list --resource-group $RESOURCE_GROUP_NAME --account-name $STORAGE_ACCOUNT_NAME --query '[0].value' --output tsv)

# Create a blob container
az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME --account-key $ACCOUNT_KEY
