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
  Org IAM
 *****************************************/

module "org_iam" {
  source                                          = "github.com/john-hurringjr/test-modules/org-iam/vpc-sc-limited"
  group_break_glass                               = var.group_break_glass
  terraform_org_service_account                   = var.terraform_org_service_account
  terraform_prod_prj_creator_service_account      = var.terraform_prod_prj_creator_service_account
  terraform_non_prod_prj_creator_service_account  = var.terraform_non_prod_prj_creator_service_account
  external_user_os_login_group                    = var.external_user_os_login_group
  security_viewer_group                           = var.security_viewer_group
  billing_admins_group                            = var.billing_admins_group
  organization_id                                 = var.organization_id
}

/******************************************
  Outputs
 *****************************************/