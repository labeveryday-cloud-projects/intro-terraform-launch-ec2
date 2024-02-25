# Intro-terraform-launch-ec2

This repo deploys a web server into default VPC. 

**Prerequisites:**

- Install [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) on your machine.
- An AWS account 
- AWS CLI [installed](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
- An AWS access key and secret key.

This guide provides a detailed overview of deploying a basic AWS infrastructure using Terraform. The Terraform code snippet you've shared sets up a default VPC, a subnet, a security group for EC2, and launches an EC2 instance within AWS. 

Here's a breakdown of the code and steps to deploy and manage the infrastructure:

## Overview of Terraform Code

The code consists of several parts:

- `Backend Configuration`: Specifies that the Terraform state file will be stored in an S3 bucket. This enables team collaboration and resource state management.

- `Provider Configuration`: Defines the AWS provider and sets the region to us-east-1. This is where the resources will be created.

- `Default VPC Creation`: Ensures a default VPC exists in the AWS account. If not, it creates one.

- `Availability Zones Data Source`: Fetches a list of all availability zones in the region for subnet creation.

- `Default Subnet Creation`: Ensures a default subnet exists in one of the available availability zones.

- `Security Group Configuration`: Sets up a security group for an EC2 instance to allow HTTP (port 80) and ICMP (ping) access.

- `AMI Data Source`: Fetches the latest Amazon Linux 2 AMI for the EC2 instance.

- `EC2 Instance Creation`: Launches an EC2 instance with the specified AMI, instance type, subnet, security group, and user data script to install a web application.

## How to Deploy

Prepare the Terraform files: Save the provided Terraform code in a .tf file within a directory on your local machine.

1. Initialization: Open a terminal, navigate to your Terraform directory, and run:

```bash
terraform init
```

>NOTE: This command initializes Terraform, downloads the required provider plugins, and sets up the backend.

2. Plan Deployment: Execute the following command to see what actions Terraform will perform:

```
terraform plan
```

>NOTE: Review the output carefully to understand the changes.

3. Apply Configuration: Apply the configuration with:

```
terraform apply
```

>NOTE: You'll be prompted to confirm the action. Type yes to proceed.

4. Access the Resources: Once the deployment is successful, open a browser and navigate to the web server ip address that Terraform has provided.

>NOTE: You can also open a terminal to verify that pings to the ip address the web server are successful. 

**How to Destroy**

1. To tear down the resources and avoid incurring further costs, run:

```
terraform destroy
```

>NOTE: This command will remove all resources defined in your Terraform configuration. Confirm the action by typing yes when prompted.

## Conclusion

This Terraform guide helps you deploy a basic AWS infrastructure, demonstrating the power of Infrastructure as Code for managing cloud resources efficiently. By following the steps outlined, you can automate the provisioning of a secure and scalable environment in AWS. Remember to destroy resources when they're no longer needed to manage costs effectively.
