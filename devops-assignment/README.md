# DevOps FinOps Assignment

## Overview
This project demonstrates a mini real-world DevOps + FinOps workflow using Terraform, LocalStack, Docker, Python, and GitHub.

## Infrastructure
Terraform provisions:
- VPC
- 2 EC2 Instances
- Security Group
- S3 Bucket
- Unattached EBS Volume

## Cost Janitor
Python script detects:
- Unattached EBS volumes
- Stopped EC2 instances
- Missing tags
- Unused resources

Generates:
- report.json
- Markdown summary

## Tools Used
- Terraform
- Docker
- LocalStack
- Python
- GitHub

## Commands

### Terraform
terraform init
terraform apply

### Run Janitor
python janitor.py

## Repository Structure

terraform/
janitor/
README.md
DESIGN.md
SUBMISSION.md

## Author
Mukul Kumar