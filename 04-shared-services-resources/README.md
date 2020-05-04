# 04 Shared Services Resources

This will help you set up many of the Shared Services resources you'll need for your org, such as:
1. Shared VPCs (Subnets, Routes, DNS, Firewall Rules)
2. The possibility for VPN to an "on prem" VPC
3. ?

For the "on prem" VPC, I used a project hosted in another Org. Note, you will need to make sure to give 
the Terraform service account deploying the vpn.tf the necessary permissions to your "on prem" GCP project. 
I recommend setting up your on prem network with another TF state somewhere else rather than deploying it all 
from this repo. But you may add the necessary resources (VPC, subnets, etc) in this repo, just adjust permissions
as needed. 