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
  Subnets Prod
 *****************************************/

variable "prod_vpc_subnet_1_region" {}
variable "prod_vpc_subnet_1_cidr" {}

variable "prod_vpc_subnet_2_region" {}
variable "prod_vpc_subnet_2_cidr" {}

variable "prod_vpc_flow_log_interval" {}
variable "prod_vpc_flow_log_sampling" {}

/******************************************
  Subnets Non-Prod
 *****************************************/
variable "non_prod_vpc_subnet_1_region" {}
variable "non_prod_vpc_subnet_1_cidr" {}

variable "non_prod_vpc_subnet_2_region" {}
variable "non_prod_vpc_subnet_2_cidr" {}

variable "non_prod_vpc_flow_log_interval" {}
variable "non_prod_vpc_flow_log_sampling" {}

/******************************************
  Firewalls
 *****************************************/
variable "prod_deny_all_egress_priority" {}
variable "prod_deny_all_ingress_priority" {}

variable "non_prod_deny_all_egress_priority" {}
variable "non_prod_deny_all_ingress_priority" {}

/******************************************
  On Prem
 *****************************************/
variable "on_prem_project_id" {}
variable "on_prem_vpc_name" {}
variable "on_prem_vpc_subnet_1_cidr" {}
variable "on_prem_vpc_subnet_2_cidr" {}
variable "on_prem_vpc_flow_log_interval" {}
variable "on_prem_vpc_flow_log_sampling" {}