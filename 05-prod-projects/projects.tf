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
  BU 1
 *****************************************/
//module "bu_1_sample_project_1_prod" {
//  source                      = "github.com/john-hurringjr/test-modules/project-creation/vpc-sc-restricted-access/shared-vpc-service"
//  project_friendly_name       = "BU1 Prod - 1"
//  unique_shared_id            = var.project_unique_shared_id
//  environment                 = "prod"
//  folder_id                   = data.terraform_remote_state.rs02_folder_structure_and_policies.outputs.prod_bu_1_folder_id
//  billing_account_id          = var.billing_account_id
//  label_business_unit         = "bu-1"
//  label_restrictions          = "none"
//  unique_project_identifier   = "bu-1-prj-1"
//  project_viewer_group        = var.business_unit_1_developers
//  service_perimeter_name      = data.terraform_remote_state.rs01_org_node_stuff.outputs.vpc_sc_perimeter_name
//  shared_vpc_host_project_id  = data.terraform_remote_state.rs03_shared_services_projects.outputs.shared_vpc_prod_project_id
//  subnet_1_region             = data.terraform_remote_state.rs04_shared_services_resources.outputs.prod_vpc_subnet_1_region
//  subnet_1_name               = data.terraform_remote_state.rs04_shared_services_resources.outputs.prod_vpc_subnet_1_name
//  subnet_2_region             = data.terraform_remote_state.rs04_shared_services_resources.outputs.prod_vpc_subnet_2_region
//  subnet_2_name               = data.terraform_remote_state.rs04_shared_services_resources.outputs.prod_vpc_subnet_2_name
//}
//
///******************************************
//  BU 2
// *****************************************/
//module "bu_2_sample_project_1_prod" {
//  source                      = "github.com/john-hurringjr/test-modules/project-creation/vpc-sc-restricted-access/shared-vpc-service"
//  project_friendly_name       = "BU2 Prod - 1"
//  unique_shared_id            = var.project_unique_shared_id
//  environment                 = "prod"
//  folder_id                   = data.terraform_remote_state.rs02_folder_structure_and_policies.outputs.prod_bu_2_folder_id
//  billing_account_id          = var.billing_account_id
//  label_business_unit         = "bu-2"
//  label_restrictions          = "none"
//  unique_project_identifier   = "bu-2-prj-1"
//  project_viewer_group        = var.business_unit_2_developers
//  service_perimeter_name      = data.terraform_remote_state.rs01_org_node_stuff.outputs.vpc_sc_perimeter_name
//  shared_vpc_host_project_id  = data.terraform_remote_state.rs03_shared_services_projects.outputs.shared_vpc_prod_project_id
//  subnet_1_region             = data.terraform_remote_state.rs04_shared_services_resources.outputs.prod_vpc_subnet_1_region
//  subnet_1_name               = data.terraform_remote_state.rs04_shared_services_resources.outputs.prod_vpc_subnet_1_name
//  subnet_2_region             = data.terraform_remote_state.rs04_shared_services_resources.outputs.prod_vpc_subnet_2_region
//  subnet_2_name               = data.terraform_remote_state.rs04_shared_services_resources.outputs.prod_vpc_subnet_2_name
//}