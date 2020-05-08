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
  Access Levels
 *****************************************/

# Depending on where you execute your code from, an access level like below will most likley not be needed
# However, since we are using Cloud Build which is not currently supported by VPC SC then our project with Cloud Build
# must be outside our perimeter. And since it's outside our perimeter...we need access level described below
resource "google_access_context_manager_access_level" "allow_all_tf_service_accounts" {
  parent = "accessPolicies/${google_access_context_manager_access_policy.access_policy.name}"
  name   = "accessPolicies/${google_access_context_manager_access_policy.access_policy.name}/accessLevels/terraform_service_accounts"
  title  = "terraform_service_accounts"
  basic {
    conditions {
      members = [
        "serviceAccount:${var.terraform_org_service_account}",
        "serviceAccount:${var.terraform_shared_services_prj_creator_service_account}",
        "serviceAccount:${var.terraform_non_prod_prj_creator_service_account}",
        "serviceAccount:${var.terraform_prod_resources_service_account}",
        "serviceAccount:${var.terraform_non_prod_resources_service_account}",
        "serviceAccount:${var.terraform_shared_services_resources_service_account}",
      ]
    }
  }
}

# Often troubleshooting requires you to be able to access from outside the perimeter. This can be useful to turn on/off
resource "google_access_context_manager_access_level" "allow_my_account" {
  parent = "accessPolicies/${google_access_context_manager_access_policy.access_policy.name}"
  name   = "accessPolicies/${google_access_context_manager_access_policy.access_policy.name}/accessLevels/my_account_special_access"
  title  = "my_account_special_access"
  basic {
    conditions {
      members = [
        "user:${var.my_id_just_in_case}",
      ]
    }
  }
}

# To be defined later
//resource "google_access_context_manager_access_level" "org_sinks_service_accounts" {
//  parent = "accessPolicies/${google_access_context_manager_access_policy.access_policy.name}"
//  name   = "accessPolicies/${google_access_context_manager_access_policy.access_policy.name}/accessLevels/org_sinks_service_accounts"
//  title  = "org_sinks_service_accounts"
//  basic {
//    conditions {
//      members = [
//        "serviceAccount:${}",
//        "serviceAccount:${}",
//      ]
//    }
//  }
//}

