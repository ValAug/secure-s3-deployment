# secure-s3-deployment

###### Cloud - :cloud:
![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)

###### IaaC
![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)

###### Serverless
[![serverless](http://public.serverless.com/badges/v3.svg)](http://www.serverless.com)
# Infra diagram 
![Diagram](https://github.com/H-H-Angus-Associates-Ltd/arms-frontend-cicd-pipeline/blob/main/policies/cicd-pipeline-diagram.png)


# Purpose

Shows how to use AWS with Terraform to accomplish the following tasks:

* How to build a AWS-Codepipeline for the FrontEnd deployment
 

# Prerequisites

* You must have Terraform installed [How to install terraform guide](https://learn.hashicorp.com/tutorials/terraform/install-cli)

# Providers version
```
Terraform v1.0.1

+ provider registry.terraform.io/hashicorp/aws v3.74.0
+ provider registry.terraform.io/hashicorp/random v3.1.0
+ provider registry.terraform.io/mongodb/mongodbatlas v0.9.1

```

# Test

* This code should be deploy in ca-central-1 AWS Regions only.


# How to run this code

- [How to run this code](#how-to-run-this-code)
  - [Quick Start](#quick-start)
  - [Quick Destroy](#quick-destroy)
  - [Notes](#notes)

## Quick Start

It will deploy to the account setup for the aws cli called 'default' or 'profile' set it

```bash
clone this repo
cd secure-s3-deployment
terraform init
terraform validate
terraform plan
terraform apply --auto-approve
```

## Quick Destroy

```bash
terraform destroy --auto-approve
```

## Notes

- clone this repo
- cd to the the directory secure-s3-deployment
- use terraform __init__ command prepare your working directory for other commands
- terraform __validate__ command check whether the configuration is valid
- terraform __plan__ command show changes required by the current configuration
- terraform __apply__ create or update infrastructure
- Alternate command : terraform apply -auto-approve
- terraform __destroy__ destroy previously-created infrastructure
- Alternate command : terraform destroy -auto-approve
- terraform __fmt__ reformat your configuration in the standard style

- Update the unique bucket name in the __variable.tf__ file

```

bucket_name = "unique-backet-name"
target_bucket = "unique-backet-name"

```
