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

