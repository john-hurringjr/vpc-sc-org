# 02 Folder Structure & Policies

The folder structure is as follows:\
Org node
* Shared Services
* Production\
** Production BU 1\
** Production BU 2
* Non Production\
** Non Production BU 1\
** Non Production BU 2

While Shared Services could have a folder under Prod/Non-Prod, I decided to keep it as it's own folder. 

Permissions for creating resources in production and non-prod are given to on service account per environment. This is not how we'd deploy normally, but for a test environment it helps show that there can be clear separation (least priv) while still allowing for easier use for testing purposes. 

While the Org has several policies in place, we are also adding additional org policies for specific folders. See the folders-org-polices.tf for details. 

In order to make connecting to your test VMs easier, I recommend creating two Service Accounts in your "on prem" org. Then you may grant these the permissions necessary to access your test VMs (via gcloud compute ssh). 