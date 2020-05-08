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
  Uncomment below after creating Billing
  And Org Log Sink Projects
 *****************************************/

/******************************************
  Org Log Sink - GCS
 *****************************************/

module "org_sink_gcs_prod" {
  source                       = "github.com/john-hurringjr/test-modules/org-sinks/gcs"
  project_id                   = data.terraform_remote_state.rs03_shared_services_projects.outputs.org_log_sink_prod_project_id
  gcs_bucket_name              = var.org_log_sink_prod_gcs_bucket_name
  object_age_move_to_nearline  = var.org_log_sink_prod_gcs_age_to_move_to_nearline
  object_age_move_to_coldline  = var.org_log_sink_prod_gcs_age_to_move_to_coldine
  sink_name                    = var.org_log_sink_prod_gcs_sink_name
  organization_id              = var.organization_id
}

/******************************************
  Org Log Sink - BigQuery
 *****************************************/

//module "org_sink_bigquery" {
//  source                          = "github.com/john-hurringjr/test-modules/org-sinks/bigquery"
//  project_id                      = data.terraform_remote_state.rs03_shared_services_projects.outputs.org_log_sink_prod_project_id
//  bigquery_dataset_friendly_name  = var.org_log_sink_prod_bq_dataset_friendly_name
//  bigquery_dataset_id             = var.org_log_sink_prod_bq_dataset_id
//  bigquery_dataset_location       = var.org_log_sink_prod_bq_dataset_location
//  sink_name                       = var.org_log_sink_prod_bq_sink_name
//  organization_id                 = var.organization_id
//}

/******************************************
  Billing Account Log Sink - GCS
 *****************************************/

module "billing_sink_gcs" {
  source                       = "github.com/john-hurringjr/test-modules/billing-log-sink/gcs"
  project_id                   = data.terraform_remote_state.rs03_shared_services_projects.outputs.org_log_sink_prod_project_id
  gcs_bucket_name              = var.billing_log_sink_prod_gcs_bucket_name
  object_age_move_to_nearline  = var.billing_log_sink_prod_gcs_age_to_move_to_nearline
  object_age_move_to_coldline  = var.billing_log_sink_prod_gcs_age_to_move_to_coldline
  sink_name                    = var.billing_log_sink_prod_gcs_sink_name
  billing_account              = var.billing_account_id
}

/******************************************
  Billing Account Charges Export - BigQuery
 *****************************************/

module "billing_charges_export_bigquery" {
  source                          = "github.com/john-hurringjr/test-modules/billing-export/bigquery"
  project_id                      = data.terraform_remote_state.rs03_shared_services_projects.outputs.billing_charges_export_project_id
  bigquery_dataset_friendly_name  = var.billing_charges_export_prod_bq_dataset_friendly_name
  bigquery_dataset_location       = var.billing_charges_export_prod_bq_dataset_location
  sink_name                       = var.billing_charges_export_prod_bq_sink_name
  bigquery_dataset_id             = var.billing_charges_export_prod_bq_dataset_id
  organization_id                 = var.organization_id
  billing_account_id              = var.billing_account_id
}