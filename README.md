# secure-s3-deployment

###### Cloud - :cloud:
![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)

###### IaaC
![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)


# Infra diagram 
![Diagram]()


# Purpose

Shows how to use AWS with Terraform to accomplish the following tasks:

* How to securely deploy an AWS-S3 bucket with Terraform
 

# Prerequisites

* You must have Terraform installed [How to install terraform guide](https://learn.hashicorp.com/tutorials/terraform/install-cli)

# Providers version
```
Terraform v1.0.1

```

# Test

* This code can be deploy in any AWS Region.


# How to run this code

- [secure-s3-deployment](#secure-s3-deployment)
          - [Cloud - :cloud:](#cloud---cloud)
          - [IaaC](#iaac)
- [Infra diagram](#infra-diagram)
- [Purpose](#purpose)
- [Prerequisites](#prerequisites)
- [Providers version](#providers-version)
- [Test](#test)
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
