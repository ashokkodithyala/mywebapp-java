### Deploying a Java Application to AWS EKS using GitHub Actions and IAC with Terraform

### Application Setup:
- Basic java web application created.

### Terraform Infrastructure Setup:

- Follow the instructions  to provision the [AWS EKS infrastructure](infra_as_code/2.aws_eks_ias/README.md) page

### CI/CD Pipeline with GitHub Actions:
#### Automate building and deploying your Docker image to an EKS cluster using a GitHub Actions CI/CD pipeline. This guide walks you through creating workflows that handle building, testing, and deploying the image automatically.

#### Step 1: Configure GitHub Secrets
To ensure secure deployment, we'll need some secrets stored in your GitHub repository. Navigate to your repository settings and add the following secrets:
  
      - Settings 
        - Security 
          - Secrets and variables -> Actions 
  

  **Secrets:**

            - AWS_ACCESS_KEY_ID     - AWS Access key   - can be generated from AWS Accounts page              
            - AWS_SECRET_ACCESS_KEY - AWS Secret Access key - can be generated from AWS Accounts page              
            - AWS_REGION            - AWS Region 
            - DOCKERHUB_TOKEN       - Docker Hub Token - can be generated from Dockerhub account
            - DOCKERHUB_USERNAME    - Docker Hub User Name            
            - EKS_CLUSTER_NAME      - EKS Cluster name - can be obtained from step 2 output variables
            - SNYK_TOKEN            - Snyk is used to scan the security vulnerabilities. Token can be obtained from snyk.io
            - SONAR_HOST_URL        - SonarQube is used for continuous inspection of code quality - URL: https://sonarcloud.io
            - SONAR_PROJECT_KEY     - Obtain from sonar account once project setup done
            - SONAR_TOKEN           - Obtain from sonar account 


#### Step 2 - GitHub Actions for Continuous Integration and Delivery

# TO BE DONE



#### Configure GitHub Actions to automate the following processes:
- Build and push the Docker image to a container registry.
- Run any necessary tests.
- Deploy the Docker image to the EKS cluster using the latest infrastructure provisioned by Terraform.
