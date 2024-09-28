# Day 27: 3-Tier Multi-Region High Availability Infrastructure with AWS and Terraform

This project demonstrates how to deploy  an AWS infrastructure that automatically scales based on demand, following best practices for scalability and maintainability.

## Project Overview
This project demonstrates how to build a 3-tier multi-region high-availability infrastructure using AWS and Terraform. The architecture is designed to ensure high availability and fault tolerance by distributing traffic across multiple AWS regions. The project focuses on deploying:

- Web Tier: Elastic Load Balancer (ELB) in public subnets to distribute incoming web traffic.
- Application Tier: EC2 instances running your application, deployed in private subnets with Auto Scaling Groups (ASG) to handle scalability.
- Database Tier: Multi-region RDS database with read replicas for cross-region failover.
- DNS Failover: AWS Route53 to manage DNS and provide failover routing between regions.


## Key Features
* Multi-region deployment for high availability and disaster recovery.
* Elastic Load Balancer (ELB) to distribute traffic between EC2 instances.
* Auto Scaling Groups (ASG) to automatically scale the application tier.
* Multi-AZ RDS with Cross-Region Read Replicas for fault-tolerant database deployment.
* Route53 DNS Failover to ensure traffic routing between regions.
* S3 Cross-Region Replication to replicate static assets across regions.




## Usage

### 1. Clone the Repository

```bash
git clone https://github.com/malachieborohoul/Day-27-3-Tier-Multi-Region-High-Availability-Infrastructure-with-AWS-and-Terraform
cd Day-27-3-Tier-Multi-Region-High-Availability-Infrastructure-with-AWS-and-Terraform
```
### 2. Initialize Terraform
```bash

terraform init
```


### 3. Customize Variables
Modify the terraform.tfvars file in /envs/dev/ to customize the following settings :

* aws_region: The AWS region where the resources will be deployed.
* instance_type: The EC2 instance type for the Auto Scaling Group.
* max_size: The maximum number of instances allowed in the ASG.
* min_size: The minimum number of instances in the ASG.
You can also  other parameters if needed.

### 4.  Review and Apply Changes
```bash
terraform plan
terraform apply
```
Terraform will display the changes that will be made. Type yes to confirm and proceed with the deployment.



### 4.  Cleanup
Don't forget to cleanup. To remove the infrastructure, run:
```bash
terraform destroy
```

### Contribution
Feel free to contribute by opening issues or submitting pull requests to improve the project.

### License
This project is licensed under the MIT License.