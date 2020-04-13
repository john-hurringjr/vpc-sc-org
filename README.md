# test-env-take-2
PreReq:
Org Node that you have Org Admin on
Billing Account
An initial project to deploy from (having bootstrap for this is on my todo list)
Initial project should have the following APIs enabled:
- Cloud Build
- Service Usage
- Service Management
- Billing (And budget)
- Access Context Manager
- IAM
- Resource Manager
- To be updated as i find more fails due to lack of api enabled

You'll also need your own github repo to setup and copy from this repo. You'll then need to connect that github repo to the project referenced above.

IN order for the various yaml files to work correctly you'll need to set up 2 GCS buckets to load all the necessary files (backend and variables). While those files could be directly in your repo, as this is all public, maybe not the best idea. I will try to make sure all the folders have a variable.txt for easy reference. Technically you can setup gcs however you want, but i did it with 2. 

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

I recommend multi region and version control for these.

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

You will need a deployment project to set this up. I have as part of "todo" to get a nice bootstrap for this project, but until then...

You'll need to take the cloudbuild service account from this first project and give it the follow permissions so you can run everything correctly:
Org Node IAM:
- Org Admin
- Folder Admin
- Access Context Manager Admin
- Org Policy Admin

Billing Account IAM
- Billing Account Admin

