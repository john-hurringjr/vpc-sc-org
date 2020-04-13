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
  Variables
 *****************************************/
variable "group_break_glass" {
  type = "string"
}
variable "terraform_org_service_account" {}
variable "terraform_prod_prj_creator_service_account" {}
variable "terraform_non_prod_prj_creator_service_account" {}
variable "external_user_os_login_group" {}
variable "security_viewer_group" {}
variable "billing_admins_group" {
  type = "string"
}
variable "organization_id" {}
variable "domain_identity_primary" {}
variable "domain_identity_secondary" {}
