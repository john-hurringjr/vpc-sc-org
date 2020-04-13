/**
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
/******************************************
  Folders
 *****************************************/

resource "google_folder" "shared_services" {
  display_name  = "Shared Services"
  parent        = "organizations/${var.organization_id}"
}

/******************************************
  Define Shared Services IAM Policy
 *****************************************/

data "google_iam_policy" "shared_services_folder_policy_data" {

  binding {
    members = [
      "serviceAccount:${var.terraform_shared_services_prj_creator_service_account}" ,
    ]
    role    = "roles/compute.xpnAdmin"
  }

  binding {
    members = [
      "serviceAccount:${var.terraform_shared_services_prj_creator_service_account}" ,
    ]
    role    = "roles/compute.xpnAdmin"
  }

  binding {
    role = "roles/resourcemanager.projectCreator"
    members = [
      "serviceAccount:${var.terraform_shared_services_prj_creator_service_account}" ,
    ]
  }

  binding {
    role = "roles/resourcemanager.projectDeleter"
    members = [
      "serviceAccount:${var.terraform_shared_services_prj_creator_service_account}" ,
    ]
  }

  binding {
    role = "roles/resourcemanager.projectIamAdmin"
    members = [
      "serviceAccount:${var.terraform_shared_services_prj_creator_service_account}" ,
    ]
  }

  binding {
    role = "roles/billing.projectManager"
    members = [
      "serviceAccount:${var.terraform_shared_services_prj_creator_service_account}" ,
    ]
  }

  binding {
    role = "roles/resourcemanager.projectMover"
    members = [
      "serviceAccount:${var.terraform_shared_services_prj_creator_service_account}" ,
    ]
  }

  binding {
    role = "roles/serviceusage.serviceUsageAdmin"
    members = [
      "serviceAccount:${var.terraform_shared_services_prj_creator_service_account}" ,
    ]
  }





}





/******************************************
  Apply Shared Services IAM Policy
 *****************************************/

resource "google_folder_iam_policy" "shared_service_folder" {
  folder      = google_folder.shared_services.id
  policy_data = data.google_iam_policy.shared_services_folder_policy_data.policy_data
}