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
  Create Top Level Folders
 *****************************************/

resource "google_folder" "shared_services" {
  display_name  = "Shared Services"
  parent        = "organizations/${var.organization_id}"
}

resource "google_folder" "production" {
  display_name  = "Production"
  parent        = "organizations/${var.organization_id}"
}

resource "google_folder" "non_production" {
  display_name  = "Non Production"
  parent        = "organizations/${var.organization_id}"
}

/******************************************
  Apply IAM to Top Level Folders
 *****************************************/

module "shared_services_folder_iam" {
  source                                      = "github.com/john-hurringjr/test-modules/folder-iam/vpc-sc-two-service-accounts"
  terraform_project_creator_service_account   = var.terraform_shared_services_prj_creator_service_account
  terraform_resource_creator_service_account  = var.terraform_shared_services_resources_service_account
  folder_id                                   = google_folder.shared_services.id
}

module "prod_folder_iam" {
  source                                      = "github.com/john-hurringjr/test-modules/folder-iam/vpc-sc-two-service-accounts"
  terraform_project_creator_service_account   = var.terraform_prod_prj_creator_service_account
  terraform_resource_creator_service_account  = var.terraform_prod_resources_service_account
  folder_id                                   = google_folder.production.id
}

module "non_prod_folder_iam" {
  source                                      = "github.com/john-hurringjr/test-modules/folder-iam/vpc-sc-two-service-accounts"
  terraform_project_creator_service_account   = var.terraform_non_prod_prj_creator_service_account
  terraform_resource_creator_service_account  = var.terraform_non_prod_resources_service_account
  folder_id                                   = google_folder.non_production.id
}

/******************************************
  Create BU Folders
 *****************************************/

resource "google_folder" "non_production_bu_1" {
  display_name  = "NonP-BU1 USA Only"
  parent        = google_folder.non_production.id
}

resource "google_folder" "non_production_bu_2" {
  display_name  = "NonP-BU2"
  parent        = google_folder.non_production.id
}

resource "google_folder" "production_bu_1" {
  display_name  = "Prod-BU1 USA Only"
  parent        = google_folder.production.id
}

resource "google_folder" "production_bu_2" {
  display_name  = "Prod-BU2"
  parent        = google_folder.production.id
}
