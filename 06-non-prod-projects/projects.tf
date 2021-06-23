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
  BU 1 - US Restricted
 *****************************************/
module "bu_1_sample_project_2_non_prod" {
  source                      = "github.com/john-hurringjr/test-modules/project-creation/vpc-sc-restricted-access/shared-vpc-service"
  project_friendly_name       = "BU1 Non-Prod - 2"
  unique_shared_id            = var.project_unique_shared_id
  environment                 = "non-prod"
  folder_id                   = data.terraform_remote_state.rs02_folder_structure_and_policies.outputs.non_prod_bu_1_folder_id
  billing_account_id          = var.billing_account_id
  unique_project_identifier   = "bu-1-prj-2"
  project_viewer_group        = var.business_unit_1_developers
  service_perimeter_name      = data.terraform_remote_state.rs01_org_node_stuff.outputs.vpc_sc_perimeter_name
  shared_vpc_host_project_id  = data.terraform_remote_state.rs03_shared_services_projects.outputs.shared_vpc_non_prod_project_id
}

/******************************************
  BU 1 - US Restricted - Test Firebase
 *****************************************/
module "bu_1_sample_project_fb_1_non_prod" {
  source                      = "github.com/john-hurringjr/test-modules//project-creation/vpc-sc-restricted-access/prj-non-service?ref=master"
  project_friendly_name       = "BU1 Non-Prod FB 3"
  unique_shared_id            = var.project_unique_shared_id
  environment                 = "non-prod"
  folder_id                   = data.terraform_remote_state.rs02_folder_structure_and_policies.outputs.non_prod_bu_1_folder_id
  billing_account_id          = var.billing_account_id
  unique_project_identifier   = "bu-1-prj-fb-3"
  project_viewer_group        = var.business_unit_1_developers
  service_perimeter_name      = data.terraform_remote_state.rs01_org_node_stuff.outputs.vpc_sc_perimeter_name
}

/******************************************
  BU 1 - US Restricted - Test Firebase
 *****************************************/
module "bu_1_sample_project_fb_2_non_prod" {
  source                      = "github.com/john-hurringjr/test-modules//project-creation/vpc-sc-restricted-access/prj-non-service?ref=master"
  project_friendly_name       = "BU1 Non-Prod FB 4"
  unique_shared_id            = var.project_unique_shared_id
  environment                 = "non-prod"
  folder_id                   = data.terraform_remote_state.rs02_folder_structure_and_policies.outputs.non_prod_bu_1_folder_id
  billing_account_id          = var.billing_account_id
  unique_project_identifier   = "bu-1-prj-fb-4"
  project_viewer_group        = var.business_unit_1_developers
  service_perimeter_name      = data.terraform_remote_state.rs01_org_node_stuff.outputs.vpc_sc_perimeter_name
}

resource "google_firebase_project" "test_fb_project_bu_fb_2" {
  provider = "google-beta"
  project = module.bu_1_sample_project_fb_2_non_prod.project_id
}


/******************************************
  BU 2
 *****************************************/
module "bu_2_sample_project_2_non_prod" {
  source                      = "github.com/john-hurringjr/test-modules/project-creation/vpc-sc-restricted-access/shared-vpc-service"
  project_friendly_name       = "BU2 Non-Prod - 2"
  unique_shared_id            = var.project_unique_shared_id
  environment                 = "non-prod"
  folder_id                   = data.terraform_remote_state.rs02_folder_structure_and_policies.outputs.non_prod_bu_2_folder_id
  billing_account_id          = var.billing_account_id
  unique_project_identifier   = "bu-2-prj-2"
  project_viewer_group        = var.business_unit_2_developers
  service_perimeter_name      = data.terraform_remote_state.rs01_org_node_stuff.outputs.vpc_sc_perimeter_name
  shared_vpc_host_project_id  = data.terraform_remote_state.rs03_shared_services_projects.outputs.shared_vpc_non_prod_project_id
}

/******************************************
  Outputs
 *****************************************/

output "bu_1_sample_project_2_non_prod_prject_id" {
  value = module.bu_1_sample_project_2_non_prod.project_id
}

output "bu_2_sample_project_2_non_prod_prject_id" {
  value = module.bu_2_sample_project_2_non_prod.project_id
}