**Executing Terraform Configuration:**

**Clone the Repository:**
Start by cloning the GitHub repository containing the Terraform code to your local development environment.

**Set Up AWS Credentials:**
Ensure that you have the AWS CLI installed on your local machine. If not, you can download it from AWS CLI.
Configure your AWS credentials by running the following command and providing your AWS Access Key ID and Secret Access Key:

aws configure

**Initialize Terraform:**

1. Initialize Terraform in your working directory to download the necessary providers and modules:
terraform init

2. Execute Terraform Plan, Before making any changes, review the expected changes and resources to be created or modified with a Terraform plan:
terraform plan

3. Apply Terraform Changes, If the plan looks correct and aligns with your expectations, apply the Terraform configuration to create or update the infrastructure. Use the -auto-approve flag to skip the confirmation prompt:
terraform apply -auto-approve

4. Destroy Infrastructure (Optional):
If you need to tear down the infrastructure, you can use the terraform destroy -auto-approve command. Make sure to back up any data before running this command, as it will remove resources.

**Setting Up GitHub Actions Workflow:**
Fork the repository and in your forked GitHub repository, go to "Settings" > "Secrets." and create the following secrets:
1. AWS_ACCESS_KEY_ID: Set this to your AWS Access Key ID.
2. AWS_SECRET_ACCESS_KEY: Set this to your AWS Secret Access Key.

**Push Changes:**
GitHub Actions Execution:
As you make changes to your repository and push them to the 'main' branch, the GitHub Actions workflow will automatically trigger and apply the Terraform configuration.
