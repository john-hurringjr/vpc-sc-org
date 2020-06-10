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

/*
  The projects below have their service accounts added to subnet IAM for the
  restricted API VPCs. In general, restricted APIs should be used if VPC SC
  are used as it reduces the risk of data exfiltration. Private is configured
  mainly for testing purposes.
*/

/******************************************
  Uncomment below after Host Projects
  & Host VPCs are set up (04 VPCs)
 *****************************************/

/******************************************
  OS Images Projects
 *****************************************/
# Non-Prod
module "os_images_project_non_prod" {
  source                      = "github.com/john-hurringjr/test-modules/project-creation/vpc-sc-restricted-access/shared-vpc-service"
  project_friendly_name       = "OS Images"
  unique_shared_id            = var.project_unique_shared_id
  environment                 = "non-prod"
  unique_project_identifier   = "osimage-2"
  folder_id                   = data.terraform_remote_state.rs02_folder_structure_and_policies.outputs.shared_services_folder_id
  billing_account_id          = var.billing_account_id
  label_business_unit         = ""
  label_restrictions          = ""
  project_viewer_group        = var.operations_viewers
  shared_vpc_host_project_id  = module.shared_vpc_host_project_non_prod.project_id
  service_perimeter_name      = data.terraform_remote_state.rs01_org_node_stuff.outputs.vpc_sc_perimeter_name
  subnet_1_region             = data.terraform_remote_state.rs04_shared_services_resources.outputs.subnet_1_region
  subnet_1_name               = data.terraform_remote_state.rs04_shared_services_resources.outputs.restricted_non_prod_vpc_subnet_1_name
  subnet_2_region             = data.terraform_remote_state.rs04_shared_services_resources.outputs.subnet_2_region
  subnet_2_name               = data.terraform_remote_state.rs04_shared_services_resources.outputs.restricted_non_prod_vpc_subnet_2_name
  subnet_3_region             = data.terraform_remote_state.rs04_shared_services_resources.outputs.subnet_3_region
  subnet_3_name               = data.terraform_remote_state.rs04_shared_services_resources.outputs.restricted_non_prod_vpc_subnet_3_name
  subnet_4_region             = data.terraform_remote_state.rs04_shared_services_resources.outputs.subnet_4_region
  subnet_4_name               = data.terraform_remote_state.rs04_shared_services_resources.outputs.restricted_non_prod_vpc_subnet_4_name
}

# Prod
module "os_images_project_prod" {
  source                      = "github.com/john-hurringjr/test-modules/project-creation/vpc-sc-restricted-access/shared-vpc-service"
  project_friendly_name       = "OS Images"
  unique_shared_id            = var.project_unique_shared_id
  environment                 = "prod"
  unique_project_identifier   = "osimage-2"
  folder_id                   = data.terraform_remote_state.rs02_folder_structure_and_policies.outputs.shared_services_folder_id
  billing_account_id          = var.billing_account_id
  label_business_unit         = ""
  label_restrictions          = ""
  project_viewer_group        = var.operations_viewers
  shared_vpc_host_project_id  = module.shared_vpc_host_project_prod.project_id
  service_perimeter_name      = data.terraform_remote_state.rs01_org_node_stuff.outputs.vpc_sc_perimeter_name
  subnet_1_region             = data.terraform_remote_state.rs04_shared_services_resources.outputs.subnet_1_region
  subnet_1_name               = data.terraform_remote_state.rs04_shared_services_resources.outputs.restricted_prod_vpc_subnet_1_name
  subnet_2_region             = data.terraform_remote_state.rs04_shared_services_resources.outputs.subnet_2_region
  subnet_2_name               = data.terraform_remote_state.rs04_shared_services_resources.outputs.restricted_prod_vpc_subnet_2_name
  subnet_3_region             = data.terraform_remote_state.rs04_shared_services_resources.outputs.subnet_3_region
  subnet_3_name               = data.terraform_remote_state.rs04_shared_services_resources.outputs.restricted_prod_vpc_subnet_3_name
  subnet_4_region             = data.terraform_remote_state.rs04_shared_services_resources.outputs.subnet_4_region
  subnet_4_name               = data.terraform_remote_state.rs04_shared_services_resources.outputs.restricted_prod_vpc_subnet_4_name
}

/******************************************
  GKE Clusters
 *****************************************/
# Non-Prod
module "gke_cluster_project_non_prod" {
  source                      = "github.com/john-hurringjr/test-modules/project-creation/vpc-sc-restricted-access/shared-vpc-service"
  project_friendly_name       = "GKE - Non-Prod"
  unique_shared_id            = var.project_unique_shared_id
  environment                 = "non-prod"
  unique_project_identifier   = "gke"
  folder_id                   = data.terraform_remote_state.rs02_folder_structure_and_policies.outputs.shared_services_folder_id
  billing_account_id          = var.billing_account_id
  label_business_unit         = ""
  label_restrictions          = ""
  project_viewer_group        = var.operations_viewers
  shared_vpc_host_project_id  = module.shared_vpc_host_project_non_prod.project_id
  service_perimeter_name      = data.terraform_remote_state.rs01_org_node_stuff.outputs.vpc_sc_perimeter_name
  subnet_1_region             = data.terraform_remote_state.rs04_shared_services_resources.outputs.subnet_1_region
  subnet_1_name               = data.terraform_remote_state.rs04_shared_services_resources.outputs.restricted_non_prod_vpc_subnet_1_name
  subnet_2_region             = data.terraform_remote_state.rs04_shared_services_resources.outputs.subnet_2_region
  subnet_2_name               = data.terraform_remote_state.rs04_shared_services_resources.outputs.restricted_non_prod_vpc_subnet_2_name
  subnet_3_region             = data.terraform_remote_state.rs04_shared_services_resources.outputs.subnet_3_region
  subnet_3_name               = data.terraform_remote_state.rs04_shared_services_resources.outputs.restricted_non_prod_vpc_subnet_3_name
  subnet_4_region             = data.terraform_remote_state.rs04_shared_services_resources.outputs.subnet_4_region
  subnet_4_name               = data.terraform_remote_state.rs04_shared_services_resources.outputs.restricted_non_prod_vpc_subnet_4_name
}

// In order for GKE to manage the network it needs permissions to the host
// https://cloud.google.com/kubernetes-engine/docs/how-to/cluster-shared-vpc#grant_host_service_agent_role
resource "google_project_iam_member" "allow_gke_permission_to_vpc_host_non_prod" {
  project = module.shared_vpc_host_project_non_prod.project_id
  role    = "roles/container.hostServiceAgentUser"
  member =  "serviceAccount:service-${module.gke_cluster_project_non_prod.project_number}@container-engine-robot.iam.gserviceaccount.com"
}

resource "google_project_iam_member" "allow_gke_permission_to_vpc_host_networks_non_prod" {
  project = module.shared_vpc_host_project_non_prod.project_id
  role    = "roles/compute.networkUser"
  member =  "serviceAccount:service-${module.gke_cluster_project_non_prod.project_number}@container-engine-robot.iam.gserviceaccount.com"
}

# Prod
module "gke_cluster_project_prod" {
  source                      = "github.com/john-hurringjr/test-modules/project-creation/vpc-sc-restricted-access/shared-vpc-service"
  project_friendly_name       = "GKE - Prod"
  unique_shared_id            = var.project_unique_shared_id
  environment                 = "prod"
  unique_project_identifier   = "gke"
  folder_id                   = data.terraform_remote_state.rs02_folder_structure_and_policies.outputs.shared_services_folder_id
  billing_account_id          = var.billing_account_id
  label_business_unit         = ""
  label_restrictions          = ""
  project_viewer_group        = var.operations_viewers
  shared_vpc_host_project_id  = module.shared_vpc_host_project_prod.project_id
  service_perimeter_name      = data.terraform_remote_state.rs01_org_node_stuff.outputs.vpc_sc_perimeter_name
  subnet_1_region             = data.terraform_remote_state.rs04_shared_services_resources.outputs.subnet_1_region
  subnet_1_name               = data.terraform_remote_state.rs04_shared_services_resources.outputs.restricted_prod_vpc_subnet_1_name
  subnet_2_region             = data.terraform_remote_state.rs04_shared_services_resources.outputs.subnet_2_region
  subnet_2_name               = data.terraform_remote_state.rs04_shared_services_resources.outputs.restricted_prod_vpc_subnet_2_name
  subnet_3_region             = data.terraform_remote_state.rs04_shared_services_resources.outputs.subnet_3_region
  subnet_3_name               = data.terraform_remote_state.rs04_shared_services_resources.outputs.restricted_prod_vpc_subnet_3_name
  subnet_4_region             = data.terraform_remote_state.rs04_shared_services_resources.outputs.subnet_4_region
  subnet_4_name               = data.terraform_remote_state.rs04_shared_services_resources.outputs.restricted_prod_vpc_subnet_4_name
}

// In order for GKE to manage the network it needs permissions to the host
// https://cloud.google.com/kubernetes-engine/docs/how-to/cluster-shared-vpc#grant_host_service_agent_role
resource "google_project_iam_member" "allow_gke_permission_to_vpc_host_prod" {
  project = module.shared_vpc_host_project_prod.project_id
  role    = "roles/container.hostServiceAgentUser"
  member =  "serviceAccount:service-${module.gke_cluster_project_prod.project_number}@container-engine-robot.iam.gserviceaccount.com"
}

resource "google_project_iam_member" "allow_gke_permission_to_vpc_host_networks_prod" {
  project = module.shared_vpc_host_project_prod.project_id
  role    = "roles/compute.networkUser"
  member =  "serviceAccount:service-${module.gke_cluster_project_prod.project_number}@container-engine-robot.iam.gserviceaccount.com"
}

/******************************************
  Outputs
 *****************************************/
output "os_images_prod_project_id" {
  value = module.os_images_project_prod.project_id
}

output "os_images_non_prod_project_id" {
  value = module.os_images_project_non_prod.project_id
}

output "gke_cluster_prod_project_id" {
  value = module.gke_cluster_project_prod.project_id
}

output "gke_cluster_non_prod_project_id" {
  value = module.gke_cluster_project_non_prod.project_id
}
