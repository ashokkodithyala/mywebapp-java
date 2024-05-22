### Application Setup:

- Use start.spring.io to create a basic Java web application.
- Ensure the application is containerized using Docker.

### Terraform Infrastructure Setup:

- Write Terraform scripts to provision the required AWS infrastructure, including EKS, VPC, and any necessary networking resources.
- Ensure the infrastructure code follows best practices for security and scalability.

### CI/CD Pipeline with GitHub Actions:

#### Configure GitHub Actions to automate the following processes:
- Build and push the Docker image to a container registry.
- Run any necessary tests.
- Deploy the Docker image to the EKS cluster using the latest infrastructure provisioned by Terraform.
