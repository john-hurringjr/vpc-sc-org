# VPC Service Controls Org
PreReq:
- Follow the steps in the 00-bootstrap first, before moving through the rest of the deployment.
- You'll need your own Org Node that you are the Org Admin
- You'll need your own Billing Account that you are the Billing Admin
- You'll need your own GitHub account to set up your own repos (which you'll connect to Cloud Build)
- You'll want to have your own IDE to edit and update code and push to your repos


I decided to create a repo per branch so I could set a trigger to execute the right folder when i push to a branch and pull request to that branch.

It is recommended to execute the deployment in the following order:
1. Org Node Stuff
2. Folder Structure & Policies
3. Shared Services Projects
4. Shared Services Resources
5. Prod Projects
6. NonProd Projects
7. Prod Resources
8. NonProd Resources

It is highly recommended to use Cloud Shell to load your variables files. If you have a private repo, then you can remove the loading of backend.tf and variables.auto.tfvars files, and just keep them in your repo. If you have a public repo it is recommended to load them to the GCS bucket provisioned in bootstrap. 

Setting up Cloud Shell for variables upload. 
- Make sure to have your .gitignore file set up and set all yoru backends, and auto.tfvars files to be ignored so they are not uploaded to your repo. 
- Create a folder in your Cloud Shell (e.g. mkdir org-variables)
- Create a folder for each environment (e.g. mkdir 01-org-node-stuff)
- Load your backend.tf and auto.tfvars files into each (you could keep them all in one flat folder too, personal pref)
- Create your own README so you can do a quick copy/paste for running the upload to GCS (e.g. cp 01-org-node-stuff.auto.tfvars gs://MYBUCKET/01-org-node-stuff/)
- Update and upload all fles
- Going forward you can just copy any updates to the variables files and send them to the GCS bucket (You'll only need to upload your backend TF twice, once for init first time and then a second time after all other backends have gone through terraform init)

