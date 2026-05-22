# DESIGN DOCUMENT

## Multi-Cloud Support
The architecture can be extended for:
- AWS
- Azure
- GCP

Using Terraform modules and provider abstraction.

## IAM Permissions
Least privilege access should be used:
- EC2 Read
- S3 Read/Write
- EBS Describe
- CloudWatch access

## Safety Checks
- Dry-run mode before deletion
- Tag validation
- Resource filtering

## Monitoring Metrics
- Unused resources
- Monthly estimated cost
- Resource utilization
- Orphan resources

## Future Improvements
- Slack notifications
- Email alerts
- Auto-remediation
- Kubernetes support
- Multi-account scanning