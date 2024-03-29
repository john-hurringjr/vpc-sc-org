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
  Shared VPC Host Projects
 *****************************************/
#
#module "shared_vpc_host_project_prod" {
#  source                    = "github.com/john-hurringjr/test-modules/project-creation/vpc-sc-restricted-access/shared-vpc-host"
#  project_friendly_name     = "Shared VPC Host - Prod"
#  unique_shared_id          = var.project_unique_shared_id
#  environment               = "prod"
#  folder_id                 = data.terraform_remote_state.rs02_folder_structure_and_policies.outputs.shared_services_folder_id
#  billing_account_id        = var.billing_account_id
#  label_business_unit       = "shared-services"
#  label_restrictions        = "highlyconfidential"
#  network_viewer_group_id   = var.network_viewers
#  service_perimeter_name    = data.terraform_remote_state.rs01_org_node_stuff.outputs.vpc_sc_perimeter_name
#}
#
#module "shared_vpc_host_project_non_prod" {
#  source                    = "github.com/john-hurringjr/test-modules/project-creation/vpc-sc-restricted-access/shared-vpc-host"
#  project_friendly_name     = "Shared VPC Host Non-Prod"
#  unique_shared_id          = var.project_unique_shared_id
#  environment               = "non-prod"
#  folder_id                 = data.terraform_remote_state.rs02_folder_structure_and_policies.outputs.shared_services_folder_id
#  billing_account_id        = var.billing_account_id
#  label_business_unit       = "shared-services"
#  label_restrictions        = ""
#  network_viewer_group_id   = var.network_viewers
#  service_perimeter_name    = data.terraform_remote_state.rs01_org_node_stuff.outputs.vpc_sc_perimeter_name
#}
#
#/******************************************
#  Billing Charges Export Project
# *****************************************/
#
#module "billing_charges_export_project" {
#  source                      = "github.com/john-hurringjr/test-modules/project-creation/vpc-sc-restricted-access/billing"
#  project_friendly_name       = "Billing Charges Export"
#  unique_shared_id            = var.project_unique_shared_id
#  environment                 = "prod"
#  unique_project_identifier   = "billing2"
#  folder_id                   = data.terraform_remote_state.rs02_folder_structure_and_policies.outputs.shared_services_folder_id
#  billing_account_id          = var.billing_account_id
#  label_business_unit         = ""
#  label_restrictions          = ""
#  project_viewer_group        = var.billing_admins_group
#  service_perimeter_name      = data.terraform_remote_state.rs01_org_node_stuff.outputs.vpc_sc_perimeter_name
#}
#
#/******************************************
#  Org Log Sink Project
# *****************************************/
#module "org_log_sink_project" {
#  source                      = "github.com/john-hurringjr/test-modules/project-creation/vpc-sc-restricted-access/log-sink"
#  project_friendly_name       = "Org Log Sink Project"
#  unique_shared_id            = var.project_unique_shared_id
#  environment                 = ""
#  unique_project_identifier   = "orgsink"
#  folder_id                   = data.terraform_remote_state.rs02_folder_structure_and_policies.outputs.shared_services_folder_id
#  billing_account_id          = var.billing_account_id
#  label_business_unit         = ""
#  label_restrictions          = ""
#  project_viewer_group        = var.security_viewers
#  service_perimeter_name      = data.terraform_remote_state.rs01_org_node_stuff.outputs.vpc_sc_perimeter_name
#}
#
#/******************************************
#  Monitoring Project
# *****************************************/
## Monitors all Shared Service Projects
#module "monitoring_project_shared_services" {
#  source                      = "github.com/john-hurringjr/test-modules/project-creation/vpc-sc-restricted-access/monitoring"
#  project_friendly_name       = "SS Monitoring Project"
#  unique_shared_id            = var.project_unique_shared_id
#  environment                 = ""
#  unique_project_identifier   = "ss-monitoring"
#  folder_id                   = data.terraform_remote_state.rs02_folder_structure_and_policies.outputs.shared_services_folder_id
#  billing_account_id          = var.billing_account_id
#  label_business_unit         = ""
#  label_restrictions          = ""
#  project_viewer_group        = var.security_viewers
#  service_perimeter_name      = data.terraform_remote_state.rs01_org_node_stuff.outputs.vpc_sc_perimeter_name
#}
#
#/******************************************
#  KMS Projects
# *****************************************/
#
#module "kms_prod_project_shared_services" {
#  source                      = "github.com/john-hurringjr/test-modules/project-creation/vpc-sc-restricted-access/kms"
#  project_friendly_name       = "KMS Prod Project"
#  unique_shared_id            = var.project_unique_shared_id
#  environment                 = ""
#  unique_project_identifier   = "kms-prod"
#  folder_id                   = data.terraform_remote_state.rs02_folder_structure_and_policies.outputs.shared_services_folder_id
#  billing_account_id          = var.billing_account_id
#  label_business_unit         = ""
#  label_restrictions          = ""
#  project_viewer_group        = var.security_viewers
#  service_perimeter_name      = data.terraform_remote_state.rs01_org_node_stuff.outputs.vpc_sc_perimeter_name
#}
#
#module "kms_non_prod_project_shared_services" {
#  source                      = "github.com/john-hurringjr/test-modules/project-creation/vpc-sc-restricted-access/kms"
#  project_friendly_name       = "KMS Non-Prod Project"
#  unique_shared_id            = var.project_unique_shared_id
#  environment                 = ""
#  unique_project_identifier   = "kms-nonprod"
#  folder_id                   = data.terraform_remote_state.rs02_folder_structure_and_policies.outputs.shared_services_folder_id
#  billing_account_id          = var.billing_account_id
#  label_business_unit         = ""
#  label_restrictions          = ""
#  project_viewer_group        = var.security_viewers
#  service_perimeter_name      = data.terraform_remote_state.rs01_org_node_stuff.outputs.vpc_sc_perimeter_name
#}
#
#/******************************************
#  Outputs
# *****************************************/
#
#output "shared_vpc_prod_project_id" {
#  value = module.shared_vpc_host_project_prod.project_id
#}
#
#output "shared_vpc_non_prod_project_id" {
#  value = module.shared_vpc_host_project_non_prod.project_id
#}
#
#output "billing_charges_export_project_id" {
#  value = module.billing_charges_export_project.project_id
#}
#
#output "org_log_sink_prod_project_id" {
#  value = module.org_log_sink_project.project_id
#}
#
#output "monitoring_prod_project_id" {
#  value = module.monitoring_project_shared_services.project_id
#}
#
#output "kms_prod_project_id" {
#  value = module.kms_prod_project_shared_services.project_id
#}
#
#output "kms_non_prod_project_id" {
#  value = module.kms_non_prod_project_shared_services.project_id
#}
