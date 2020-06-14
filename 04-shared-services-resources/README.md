# 04 Shared Services Resources

This will help you set up many of the Shared Services resources you'll need for your org, such as:
1. Shared VPCs (Subnets, Routes, DNS, Firewall Rules)
2. The possibility for VPN to an "on prem" VPC
3. The deployment of a gke cluster 

For the "on prem" VPC, I used a project hosted in another Org. Note, you will need to make sure to give 
the Terraform service account deploying the vpn.tf the necessary permissions to your "on prem" GCP project. 

I have also altered the cloud build trigger for this repo to use "cloud-build-secret.yaml"
so that you can see how to use a secret manager for the variables. I did this as this repo has a variable for the vpn tunnel secret.