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
  Groups
 *****************************************/
variable "group_break_glass" {}
variable "external_user_os_login_group" {}
variable "security_viewer_group" {}
variable "billing_admins_group" {}
variable "my_id_just_in_case" {}
variable "security_viewers" {}

/******************************************
  Terraform Service Accounts
 *****************************************/
variable "terraform_org_service_account" {}

variable "terraform_shared_services_prj_creator_service_account" {}
variable "terraform_shared_services_resources_service_account" {}

variable "terraform_prod_prj_creator_service_account" {}
variable "terraform_prod_resources_service_account" {}

variable "terraform_non_prod_prj_creator_service_account" {}
variable "terraform_non_prod_resources_service_account" {}

/******************************************
  Misc
 *****************************************/
variable "organization_id" {}

variable "billing_account_id" {}

variable "domain_identity_primary" {}
variable "domain_identity_secondary" {}

/******************************************
  Org Sinks
 *****************************************/
variable "org_log_sink_prod_gcs_age_to_move_to_nearline" {}
variable "org_log_sink_prod_gcs_age_to_move_to_coldine" {}
variable "org_log_sink_prod_gcs_sink_name" {}
variable "org_log_sink_prod_gcs_bucket_name" {}

variable "org_log_sink_prod_bq_dataset_friendly_name" {}
variable "org_log_sink_prod_bq_dataset_id" {}
variable "org_log_sink_prod_bq_dataset_location" {}
variable "org_log_sink_prod_bq_sink_name" {}

/******************************************
  Billing Log Sink - GCS
 *****************************************/
variable "billing_log_sink_prod_gcs_age_to_move_to_nearline" {}
variable "billing_log_sink_prod_gcs_age_to_move_to_coldline" {}
variable "billing_log_sink_prod_gcs_sink_name" {}
variable "billing_log_sink_prod_gcs_bucket_name" {}

/******************************************
  Billing Export - BigQuery
 *****************************************/
variable "billing_charges_export_prod_bq_dataset_friendly_name" {}
variable "billing_charges_export_prod_bq_dataset_location" {}
variable "billing_charges_export_prod_bq_sink_name" {}
variable "billing_charges_export_prod_bq_dataset_id" {}