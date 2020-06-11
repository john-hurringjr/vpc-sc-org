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
  On Prem Service Accounts
 *****************************************/
variable "on_prem_non_prod_service_account" {}
variable "on_prem_prod_service_account" {}

/******************************************
  Misc
 *****************************************/
variable "billing_account_id" {}
variable "organization_id" {}