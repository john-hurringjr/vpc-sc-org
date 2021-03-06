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
group_break_glass             = ""
external_user_os_login_group  = ""
security_viewer_group         = ""
billing_admins_group          = ""
my_id_just_in_case            = ""

/******************************************
  Terraform Service Accounts
 *****************************************/
terraform_org_service_account = ""

terraform_shared_services_prj_creator_service_account = ""
terraform_shared_services_resources_service_account   = ""

terraform_prod_prj_creator_service_account  = ""
terraform_prod_resources_service_account    = ""

terraform_non_prod_prj_creator_service_account  = ""
terraform_non_prod_resources_service_account    = ""

/******************************************
  Misc
 *****************************************/
organization_id           = ""
domain_identity_primary   = ""
domain_identity_secondary = ""
billing_account_id        = ""

/******************************************
  Org Sinks
 *****************************************/
gcs_org_sink_prod_age_to_move_to_nearline = 180
gcs_org_sink_prod_age_to_move_to_coldline = 365
gcs_org_sink_prod_sink_name               = ""
gcs_org_sink_prod_bucket_name             = ""

bq_org_sink_prod_dataset_friendly_name  = ""
bq_org_sink_prod_dataset_id             = ""
bq_org_sink_prod_sink_name              = ""

/******************************************
  Billing Sink
 *****************************************/

gcs_billing_sink_prod_age_to_move_to_nearline = 180
gcs_billing_sink_prod_age_to_move_to_coldline = 365
gcs_billing_sink_prod_sink_name               = ""
gcs_billing_sink_prod_bucket_name             = ""