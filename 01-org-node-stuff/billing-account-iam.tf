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
  Billing Account IAM - Policy Data
 *****************************************/

data "google_iam_policy" "billing_account_policy_data" {

  binding {
    members = [
      "serviceAccount:${var.terraform_org_service_account}",
      "group:${var.billing_admins_group}",
      "user:${var.my_id_just_in_case}"
    ]
    role = "roles/billing.admin"
  }

  binding {
    members = [
      "serviceAccount:${var.terraform_org_service_account}",
      "user:${var.my_id_just_in_case}"
    ]
    role = "roles/logging.admin"
  }

  binding {
    members = [
      "serviceAccount:${var.terraform_prod_prj_creator_service_account}",
      "serviceAccount:${var.terraform_non_prod_prj_creator_service_account}",
      "serviceAccount:${var.terraform_shared_services_prj_creator_service_account}"
    ]
    role = "roles/billing.user"
  }

}

/******************************************
  Billing Account IAM - Policy Applied
 *****************************************/
resource "google_billing_account_iam_policy" "billing_account_iam" {
  billing_account_id  = var.billing_account_id
  policy_data         = data.google_iam_policy.billing_account_policy_data.policy_data
}

/******************************************
  Outputs
 *****************************************/

