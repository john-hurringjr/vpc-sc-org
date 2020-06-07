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
  Shared VPC Host Projects - Restricted
 *****************************************/

module "shared_vpc_host_project_prod" {
  source                    = "github.com/john-hurringjr/test-modules/project-creation/vpc-sc-restricted-access/shared-vpc-host"
  project_friendly_name     = "Shared VPC Host - Prod"
  unique_shared_id          = var.project_unique_shared_id
  environment               = "prod"
  folder_id                 = data.terraform_remote_state.rs02_folder_structure_and_policies.outputs.shared_services_folder_id
  billing_account_id        = var.billing_account_id
  label_business_unit       = "shared-services"
  label_restrictions        = "highlyconfidential"
  network_viewer_group_id   = var.network_viewers
  service_perimeter_name    = data.terraform_remote_state.rs01_org_node_stuff.outputs.vpc_sc_perimeter_name
}

module "shared_vpc_host_project_non_prod" {
  source                    = "github.com/john-hurringjr/test-modules/project-creation/vpc-sc-restricted-access/shared-vpc-host"
  project_friendly_name     = "Shared VPC Host Non-Prod"
  unique_shared_id          = var.project_unique_shared_id
  environment               = "non-prod"
  folder_id                 = data.terraform_remote_state.rs02_folder_structure_and_policies.outputs.shared_services_folder_id
  billing_account_id        = var.billing_account_id
  label_business_unit       = "shared-services"
  label_restrictions        = "highlyconfidential"
  network_viewer_group_id   = var.network_viewers
  service_perimeter_name    = data.terraform_remote_state.rs01_org_node_stuff.outputs.vpc_sc_perimeter_name
}

/******************************************
  Billing Charges Export Project
 *****************************************/

module "billing_charges_export_project" {
  source                      = "github.com/john-hurringjr/test-modules/project-creation/vpc-sc-restricted-access/billing"
  project_friendly_name       = "Billing Charges Export"
  unique_shared_id            = var.project_unique_shared_id
  environment                 = "prod"
  unique_project_identifier   = "billing2"
  folder_id                   = data.terraform_remote_state.rs02_folder_structure_and_policies.outputs.shared_services_folder_id
  billing_account_id          = var.billing_account_id
  label_business_unit         = ""
  label_restrictions          = ""
  project_viewer_group        = var.billing_admins_group
  service_perimeter_name      = data.terraform_remote_state.rs01_org_node_stuff.outputs.vpc_sc_perimeter_name
}

/******************************************
  Org Log Sink Project
 *****************************************/
module "org_log_sink_project_prod" {
  source                      = "github.com/john-hurringjr/test-modules/project-creation/vpc-sc-restricted-access/log-sink"
  project_friendly_name       = "Org Log Sink Project"
  unique_shared_id            = var.project_unique_shared_id
  environment                 = "prod"
  unique_project_identifier   = "orgsink"
  folder_id                   = data.terraform_remote_state.rs02_folder_structure_and_policies.outputs.shared_services_folder_id
  billing_account_id          = var.billing_account_id
  label_business_unit         = ""
  label_restrictions          = ""
  project_viewer_group        = var.security_viewers
  service_perimeter_name      = data.terraform_remote_state.rs01_org_node_stuff.outputs.vpc_sc_perimeter_name
}

/******************************************
  Monitoring Project
 *****************************************/
# Monitors all Shared Service Projects & Prod Projects
module "monitoring_project_prod" {
  source                      = "github.com/john-hurringjr/test-modules/project-creation/vpc-sc-restricted-access/monitoring"
  project_friendly_name       = "Prod Monitoring Project"
  unique_shared_id            = var.project_unique_shared_id
  environment                 = "prod"
  unique_project_identifier   = "monitoring"
  folder_id                   = data.terraform_remote_state.rs02_folder_structure_and_policies.outputs.shared_services_folder_id
  billing_account_id          = var.billing_account_id
  label_business_unit         = ""
  label_restrictions          = ""
  project_viewer_group        = var.security_viewers
  service_perimeter_name      = data.terraform_remote_state.rs01_org_node_stuff.outputs.vpc_sc_perimeter_name
}

# Monitors all Non-Prod Project
module "monitoring_project_non_prod" {
  source                      = "github.com/john-hurringjr/test-modules/project-creation/vpc-sc-restricted-access/monitoring"
  project_friendly_name       = "Non-Prod Monitoring Project"
  unique_shared_id            = var.project_unique_shared_id
  environment                 = "non-prod"
  unique_project_identifier   = "monitoring"
  folder_id                   = data.terraform_remote_state.rs02_folder_structure_and_policies.outputs.shared_services_folder_id
  billing_account_id          = var.billing_account_id
  label_business_unit         = ""
  label_restrictions          = ""
  project_viewer_group        = var.security_viewers
  service_perimeter_name      = data.terraform_remote_state.rs01_org_node_stuff.outputs.vpc_sc_perimeter_name
}


/******************************************
  Uncomment below after Host Projects
  & Host VPCs are set up (04 VPCs)
 *****************************************/

/******************************************
  OS Images Projects - Private
 *****************************************/

# Non-Prod
module "os_images_project_non_prod_private" {
  source                      = "github.com/john-hurringjr/test-modules/project-creation/vpc-sc-restricted-access/shared-vpc-service"
  project_friendly_name       = "OS Images - Private"
  unique_shared_id            = var.project_unique_shared_id
  environment                 = "non-prod"
  unique_project_identifier   = "osimage-private"
  folder_id                   = data.terraform_remote_state.rs02_folder_structure_and_policies.outputs.shared_services_folder_id
  billing_account_id          = var.billing_account_id
  label_business_unit         = ""
  label_restrictions          = ""
  project_viewer_group        = var.operations_viewers
  shared_vpc_host_project_id  = module.shared_vpc_host_project_non_prod.project_id
  service_perimeter_name      = data.terraform_remote_state.rs01_org_node_stuff.outputs.vpc_sc_perimeter_name
  subnet_1_region             = data.terraform_remote_state.rs04_shared_services_resources.outputs.private_non_prod_vpc_subnet_1_region
  subnet_1_name               = data.terraform_remote_state.rs04_shared_services_resources.outputs.private_non_prod_vpc_subnet_1_name
  subnet_2_region             = data.terraform_remote_state.rs04_shared_services_resources.outputs.private_non_prod_vpc_subnet_2_region
  subnet_2_name               = data.terraform_remote_state.rs04_shared_services_resources.outputs.private_non_prod_vpc_subnet_2_name
}

# Prod
module "os_images_project_prod_private" {
  source                      = "github.com/john-hurringjr/test-modules/project-creation/vpc-sc-restricted-access/shared-vpc-service"
  project_friendly_name       = "OS Images - Private"
  unique_shared_id            = var.project_unique_shared_id
  environment                 = "prod"
  unique_project_identifier   = "osimage-private"
  folder_id                   = data.terraform_remote_state.rs02_folder_structure_and_policies.outputs.shared_services_folder_id
  billing_account_id          = var.billing_account_id
  label_business_unit         = ""
  label_restrictions          = ""
  project_viewer_group        = var.operations_viewers
  shared_vpc_host_project_id  = module.shared_vpc_host_project_prod.project_id
  service_perimeter_name      = data.terraform_remote_state.rs01_org_node_stuff.outputs.vpc_sc_perimeter_name
  subnet_1_region             = data.terraform_remote_state.rs04_shared_services_resources.outputs.private_prod_vpc_subnet_1_region
  subnet_1_name               = data.terraform_remote_state.rs04_shared_services_resources.outputs.private_prod_vpc_subnet_1_name
  subnet_2_region             = data.terraform_remote_state.rs04_shared_services_resources.outputs.private_prod_vpc_subnet_2_region
  subnet_2_name               = data.terraform_remote_state.rs04_shared_services_resources.outputs.private_prod_vpc_subnet_2_name
}

/******************************************
  OS Images Projects - Restricted
 *****************************************/

# Non-Prod
module "os_images_project_non_prod_restricted" {
  source                      = "github.com/john-hurringjr/test-modules/project-creation/vpc-sc-restricted-access/shared-vpc-service"
  project_friendly_name       = "OS Images - Restricted"
  unique_shared_id            = var.project_unique_shared_id
  environment                 = "non-prod"
  unique_project_identifier   = "osimage-restr"
  folder_id                   = data.terraform_remote_state.rs02_folder_structure_and_policies.outputs.shared_services_folder_id
  billing_account_id          = var.billing_account_id
  label_business_unit         = ""
  label_restrictions          = ""
  project_viewer_group        = var.operations_viewers
  shared_vpc_host_project_id  = module.shared_vpc_host_project_non_prod.project_id
  service_perimeter_name      = data.terraform_remote_state.rs01_org_node_stuff.outputs.vpc_sc_perimeter_name
  subnet_1_region             = data.terraform_remote_state.rs04_shared_services_resources.outputs.restricted_non_prod_vpc_subnet_1_region
  subnet_1_name               = data.terraform_remote_state.rs04_shared_services_resources.outputs.restricted_non_prod_vpc_subnet_1_name
  subnet_2_region             = data.terraform_remote_state.rs04_shared_services_resources.outputs.restricted_non_prod_vpc_subnet_2_region
  subnet_2_name               = data.terraform_remote_state.rs04_shared_services_resources.outputs.restricted_non_prod_vpc_subnet_2_name
}

# Prod
module "os_images_project_prod_restricted" {
  source                      = "github.com/john-hurringjr/test-modules/project-creation/vpc-sc-restricted-access/shared-vpc-service"
  project_friendly_name       = "OS Images - Restricted"
  unique_shared_id            = var.project_unique_shared_id
  environment                 = "prod"
  unique_project_identifier   = "osimage-restricted"
  folder_id                   = data.terraform_remote_state.rs02_folder_structure_and_policies.outputs.shared_services_folder_id
  billing_account_id          = var.billing_account_id
  label_business_unit         = ""
  label_restrictions          = ""
  project_viewer_group        = var.operations_viewers
  shared_vpc_host_project_id  = module.shared_vpc_host_project_prod.project_id
  service_perimeter_name      = data.terraform_remote_state.rs01_org_node_stuff.outputs.vpc_sc_perimeter_name
  subnet_1_region             = data.terraform_remote_state.rs04_shared_services_resources.outputs.restricted_prod_vpc_subnet_1_region
  subnet_1_name               = data.terraform_remote_state.rs04_shared_services_resources.outputs.restricted_prod_vpc_subnet_1_name
  subnet_2_region             = data.terraform_remote_state.rs04_shared_services_resources.outputs.restricted_prod_vpc_subnet_2_region
  subnet_2_name               = data.terraform_remote_state.rs04_shared_services_resources.outputs.restricted_prod_vpc_subnet_2_name
}

///******************************************
//  GKE Clusters - Private
// *****************************************/
//
//# Non-Prod
//module "gke_cluster_project_non_prod_private" {
//  source                      = "github.com/john-hurringjr/test-modules/project-creation/vpc-sc-restricted-access/shared-vpc-service"
//  project_friendly_name       = "GKE - Private"
//  unique_shared_id            = var.project_unique_shared_id
//  environment                 = "non-prod"
//  unique_project_identifier   = "gke-private"
//  folder_id                   = data.terraform_remote_state.rs02_folder_structure_and_policies.outputs.shared_services_folder_id
//  billing_account_id          = var.billing_account_id
//  label_business_unit         = ""
//  label_restrictions          = ""
//  project_viewer_group        = var.operations_viewers
//  shared_vpc_host_project_id  = module.shared_vpc_host_project_non_prod.project_id
//  service_perimeter_name      = data.terraform_remote_state.rs01_org_node_stuff.outputs.vpc_sc_perimeter_name
//  subnet_1_region             = data.terraform_remote_state.rs04_shared_services_resources.outputs.private_non_prod_vpc_subnet_1_region
//  subnet_1_name               = data.terraform_remote_state.rs04_shared_services_resources.outputs.private_non_prod_vpc_subnet_1_name
//  subnet_2_region             = data.terraform_remote_state.rs04_shared_services_resources.outputs.private_non_prod_vpc_subnet_2_region
//  subnet_2_name               = data.terraform_remote_state.rs04_shared_services_resources.outputs.private_non_prod_vpc_subnet_2_name
//}
//
//# Prod
//module "gke_cluster_project_prod_private" {
//  source                      = "github.com/john-hurringjr/test-modules/project-creation/vpc-sc-restricted-access/shared-vpc-service"
//  project_friendly_name       = "GKE - Private"
//  unique_shared_id            = var.project_unique_shared_id
//  environment                 = "prod"
//  unique_project_identifier   = "gke-private"
//  folder_id                   = data.terraform_remote_state.rs02_folder_structure_and_policies.outputs.shared_services_folder_id
//  billing_account_id          = var.billing_account_id
//  label_business_unit         = ""
//  label_restrictions          = ""
//  project_viewer_group        = var.operations_viewers
//  shared_vpc_host_project_id  = module.shared_vpc_host_project_prod.project_id
//  service_perimeter_name      = data.terraform_remote_state.rs01_org_node_stuff.outputs.vpc_sc_perimeter_name
//  subnet_1_region             = data.terraform_remote_state.rs04_shared_services_resources.outputs.private_prod_vpc_subnet_1_region
//  subnet_1_name               = data.terraform_remote_state.rs04_shared_services_resources.outputs.private_prod_vpc_subnet_1_name
//  subnet_2_region             = data.terraform_remote_state.rs04_shared_services_resources.outputs.private_prod_vpc_subnet_2_region
//  subnet_2_name               = data.terraform_remote_state.rs04_shared_services_resources.outputs.private_prod_vpc_subnet_2_name
//}
//
///******************************************
//  GKE Clusters - Retricted
// *****************************************/
//
//# Non-Prod
//module "gke_cluster_project_non_prod_restricted" {
//  source                      = "github.com/john-hurringjr/test-modules/project-creation/vpc-sc-restricted-access/shared-vpc-service"
//  project_friendly_name       = "GKE - Restricted"
//  unique_shared_id            = var.project_unique_shared_id
//  environment                 = "non-prod"
//  unique_project_identifier   = "gke-restricted"
//  folder_id                   = data.terraform_remote_state.rs02_folder_structure_and_policies.outputs.shared_services_folder_id
//  billing_account_id          = var.billing_account_id
//  label_business_unit         = ""
//  label_restrictions          = ""
//  project_viewer_group        = var.operations_viewers
//  shared_vpc_host_project_id  = module.shared_vpc_host_project_non_prod.project_id
//  service_perimeter_name      = data.terraform_remote_state.rs01_org_node_stuff.outputs.vpc_sc_perimeter_name
//  subnet_1_region             = data.terraform_remote_state.rs04_shared_services_resources.outputs.restricted_non_prod_vpc_subnet_1_region
//  subnet_1_name               = data.terraform_remote_state.rs04_shared_services_resources.outputs.restricted_non_prod_vpc_subnet_1_name
//  subnet_2_region             = data.terraform_remote_state.rs04_shared_services_resources.outputs.restricted_non_prod_vpc_subnet_2_region
//  subnet_2_name               = data.terraform_remote_state.rs04_shared_services_resources.outputs.restricted_non_prod_vpc_subnet_2_name
//}
//
//# Prod
//module "gke_cluster_project_prod_restricted" {
//  source                      = "github.com/john-hurringjr/test-modules/project-creation/vpc-sc-restricted-access/shared-vpc-service"
//  project_friendly_name       = "GKE - Restricted"
//  unique_shared_id            = var.project_unique_shared_id
//  environment                 = "prod"
//  unique_project_identifier   = "gke-restricted"
//  folder_id                   = data.terraform_remote_state.rs02_folder_structure_and_policies.outputs.shared_services_folder_id
//  billing_account_id          = var.billing_account_id
//  label_business_unit         = ""
//  label_restrictions          = ""
//  project_viewer_group        = var.operations_viewers
//  shared_vpc_host_project_id  = module.shared_vpc_host_project_prod.project_id
//  service_perimeter_name      = data.terraform_remote_state.rs01_org_node_stuff.outputs.vpc_sc_perimeter_name
//  subnet_1_region             = data.terraform_remote_state.rs04_shared_services_resources.outputs.restricted_prod_vpc_subnet_1_region
//  subnet_1_name               = data.terraform_remote_state.rs04_shared_services_resources.outputs.restricted_prod_vpc_subnet_1_name
//  subnet_2_region             = data.terraform_remote_state.rs04_shared_services_resources.outputs.restricted_prod_vpc_subnet_2_region
//  subnet_2_name               = data.terraform_remote_state.rs04_shared_services_resources.outputs.restricted_prod_vpc_subnet_2_name
//}