## Follow the instructions below to deploy the application.

 ### Step 1: Make sure to set up a [Remote Backend](/infra_as_code/1.aws_ias_rb-s3-db/README.md) before you proceed.

 ### Step 2: Make sure [Provision the AWS EKS infrastructure](infra_as_code/2.aws_eks_ias/README.md) before you proceed.   

 ### Step 3: 
 Update the following secrets in the GitHub repository
  
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

## Technology Stack
- AWS
- Amazon Elastic Kubernetes Service
- GitHub Actions
- Docker
- Kubernetes
- Terraform
- Snyk - Scan the security vulnerabilities
- SonarCloud - SonarQube is used for continuous inspection of code quality
 

