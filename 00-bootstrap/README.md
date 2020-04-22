# VPC Service Controls Org
PreReq:
- Follow the steps in the 00-bootstrap first (this folder), before moving through the rest of the deployment.
- You'll need your own Org Node that you are the Org Admin
- You'll need your own Billing Account that you are the Billing Admin
- You'll need your own GitHub account to set up your own repos (which you'll connect to Cloud Build)
- You'll want to have your own IDE to edit and update code and push to your repos

After deploying via this bootstrap your project should have the following APIs enabled:
- Cloud Build
- Service Usage
- Service Management
- Billing (And budget)
- Access Context Manager
- IAM
- Resource Manager
- To be updated as i find more fails due to lack of api enabled

STEPS:
1. Open Cloud Shell and copy this repo to it's own folder (git clone https://github.com/john-hurringjr/vpc-sc-org.git)
2. Connect to the 00-boostrap folder (cd vpc-sc-org/00-bootstrap/)
3. Use your favorite editor (or cloudshell editor) to enter your variables into the variable.auto.tfvars file
4. Run (terraform init)
5. Run (terraform plan)
6. Validate no errors with the plan (make necessary changes if there are)
7. Run (terraform apply) type "yes" when prompted
8. Navigate to the project in the Console and connect Cloud Build to your GitHub Repo (https://cloud.google.com/cloud-build/docs/automating-builds/create-github-app-triggers)
9. Edit the 02-gcs-and-cloud-build.tf file to uncomment the resources there (right now just GCS)
10. Run Terraform again (steps 4-7)

For quick reference on your GCS buckets:
The GCS structure should look at follows:

bucket1 (This will host the files to import)
bucket1/orgnodestuff/
bucket1/folderstructure/
bucket1/sharedservicesprojects/
bucket1/sharedservicesresources/
bucket1/prodprojects/
bucket1/nonprodprojects/
bucket1/prodresources/
bucket1/nonprodresources/
bucket1/policies/

bucket2 (this will host your actual backend state file)
bucket2/orgnodestuff/
bucket2/folderstructure/
bucket2/sharedservicesprojects/
bucket2/sharedservicesresources/
bucket2/prodprojects/
bucket2/nonprodprojects/
bucket2/prodresources/
bucket2/nonprodresources/