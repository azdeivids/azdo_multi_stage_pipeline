# Automate the Automation

## Project Overview

Terraform project folder to setup automated infrastructure with Terraform itself. The project will include the following:

    - Deployment of the project.
    - Setup to accomodate for multiple environments.
    - Enabling banch protection.

This project will use the azuredevos terraform provider.

## *.debug.sh* file

The Terraform project will be built using the *.debug.sh* file which will be excluded from the repository itself using *.gitignore* file. This is because the debug.sh file containts sensitive information related the Personal Access Tokens that we have created within the Azure DevOps organization. This token will be based as an environemntal variable during the execution of the script when provisioning the Terraform project.

The *$* bash expression will allow us to pass any variable such as *plan* or *apply* during the execution of the script.

## *main.tf* file

This file containts the Azure DevOps project that will be created in the AzDO organization. Within the project a repository will be created where the pipeline files and the application source coude will be kept. The repo will be import a boilerplate pipeline that we have stored in GitHub to be publicly accessible.

## *variable-group.tf* file

Having imported the .yaml file for the pipeline, we must set the variable groups to be passed into the the .yaml file during the execution of the pipeline.

We will require the following variables to be declered:

    Azure Terraform Backend
        - Backend Resource Group name
        - Backend Storage Account name
        - Backend Container name

    This will be used to store the terraform state file in the storage account that has been deployed into Azure.

    Azure Credentials
        - Client Id
        - Client Secret
        - Tenant Id
        - Subscription Id

    This will be used to allow terraform to access and interact with the specified Azure tenant and subscritpion. To enable this, you must create app registration and pass the secret values into the variable group.

## *.debug.tfvars* file

Becaue the values used for the AzDO variable group are sensitive, we must put them in a file that will not be checked into the repository to prtect the sensitive information from leaking. For this we create the *.debug.tfvars* file which will containt the secret values for the Azure tenant and each respective subscription that will be used for the application deployment.

We will use the count index then in the *variable-group.tf* file to pass in all the values for each environment.

## *pipeline.tf* file

This fill will create the pipeline that will be executed against the respective subscription and Azure tenant specified in the variables group.

## *environments.tf* file

This file will create an environment in Azure DevOps.

## *variables.tf* file

For Azure credentials we will create a map that contains all the neccessary attributes for the azure tenant. 

Each environmane will have a corresponding backend storage accout to seperate the dev and prod environment. This will again be decleared in a map of object consisting of key value pairs to be used during the deployment.

## *build-validation.tf* file

This will trigger terrform pipeline whenever the code stored within the terraform folder has been modified.