### Deploying a Java Application to AWS EKS using GitHub Actions and IAC with Terraform

### Application Setup:
- Basic java web application created.

### Terraform Infrastructure Setup:

- Follow the instructions  to provision the [AWS EKS infrastructure](infra_as_code/2.aws_eks_ias/README.md) page

 - Automate building and deploying your Docker image to an EKS cluster using a GitHub Actions CI/CD pipeline. This guide walks you through creating workflows that handle building, testing, and deploying the image automatically.

### Step 1: Configure GitHub Secrets
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


### Step 2 - GitHub Actions for Continuous Integration and Delivery

#### Automated Pipeline Stages:

1. **Quality & Security Checks**
    * **Unit Testing:** Verify individual code units function correctly. *Note: Covered only very basic test for POC*
    * **Code Coverage:** Measure how much code is tested by unit tests. 
    * **Dependency Scanning:** Identify and address potential vulnerabilities in external dependencies.
    * **Security Scanning:** Analyze the code for security weaknesses.  

2. **Build and Package** (**This stage follows successful completion of Stage 1**)
    * Build the application.
    * Generate a JAR file as the output.
    * Publish Build Artifacts to GitHub Actions Artifacts 

3. **Containerize** (**This stage follows successful completion of Stage 2**)
    * Build a Docker image from the JAR file.
    * Run tests on the image to ensure functionality.
    * Push the image to a container registry for accessibility only if the image test is successful.

4. **Deployment** (**Conditional based on branch**)
    * **Development:**
    * **(Conditional):** This step only executes if the branch is `feature/development`.
        * Configure AWS credentials for deployment access.
        * Create or update a kubeconfig file for the development cluster defined in GitHub Actions secrets.
        * Deploy the manifest files to the development environment.
    * **Production:**
    * **(Conditional):** This step only executes if the branch is `main/master`.
        * Configure AWS credentials for deployment access.
        * Create or update a kubeconfig file for the production cluster defined in GitHub Actions secrets.
        * Deploy the manifest files to the production environment (assuming `main/master` is production).

***Execution:***
***The pipeline automatically triggers on code changes to the main/master or development/feature branches, ensuring continuous integration and deployment.***

> **Note:**
> Currently generated reports can be viewed from their respective sites or the GitHub Actions artifacts section after the pipeline completes. 


### Technology Stack
- AWS
- Amazon Elastic Kubernetes Service
- GitHub Actions
- Docker
- Kubernetes
- Terraform
- Snyk - Scan the security vulnerabilities
- SonarCloud - SonarQube is used for continuous inspection of code quality