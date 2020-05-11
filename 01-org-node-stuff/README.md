# 01 Org Node Stuff

Be sure to have run through the 00-bootstrap steps first

Sections of the 01 Org Node Stuff will need to be uncommented later after the resources are created, take note. 

Also, it is necessary to enable Cloud Security Command Center (CSCC) prior to running this repo. Enabling the CSCC is manual.
Follow these steps: https://cloud.google.com/security-command-center/docs/quickstart-scc-setup

This is the first repo to apply, and it will create many of the resources that impact your org (and billing account)
Note, you will need to uncomment the log-sinks-and-billing-charges-export.tf and apply it after you have applied the 03 
repo (creating the projects). Also, at this time, I was unable to add a service account to the BigQuery dataset after creating it
so I added the sink writer to the project IAM.

For VPC SC, I created an Access Level for your identity (variable: my_id_just_in_case) as I often found troubleshooting
easier if I could grant myself access to the perimeter. However, don't forget you have this turned of (if you leave it in)
when testing out VPC SC functionality. I recommend logging into one of the identities you created for your domain to 
test out how things function for a specific user/group.

