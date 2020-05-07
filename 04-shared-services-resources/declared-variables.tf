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
  Regions
 *****************************************/
variable "region_1" {}
variable "region_2" {}

/******************************************
  Subnets Prod
 *****************************************/
variable "prod_vpc_subnet_1_cidr" {}
variable "prod_vpc_subnet_2_cidr" {}

variable "prod_vpc_flow_log_interval" {}
variable "prod_vpc_flow_log_sampling" {}

/******************************************
  Subnets Non-Prod
 *****************************************/
variable "non_prod_vpc_subnet_1_cidr" {}
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

#Prod
variable "on_prem_prod_vpc_name" {}
variable "on_prem_prod_vpc_subnet_1_cidr" {}
variable "on_prem_prod_vpc_subnet_2_cidr" {}
variable "on_prem_prod_vpc_flow_log_interval" {}
variable "on_prem_prod_vpc_flow_log_sampling" {}

#Non-Prod
variable "on_prem_non_prod_vpc_name" {}
variable "on_prem_non_prod_vpc_subnet_1_cidr" {}
variable "on_prem_non_prod_vpc_subnet_2_cidr" {}
variable "on_prem_non_prod_vpc_flow_log_interval" {}
variable "on_prem_non_prod_vpc_flow_log_sampling" {}

/******************************************
  HA VPN
 *****************************************/
variable "on_prem_vpc_router_region_1_asn" {}
variable "on_prem_vpc_router_region_2_asn" {}

variable "prod_vpc_router_region_1_asn" {}
variable "prod_vpc_router_region_2_asn" {}

variable "non_prod_vpc_router_region_1_asn" {}
variable "non_prod_vpc_router_region_2_asn" {}

variable "vpn_on_prem_prod_region_1_shared_secret_tunnel_1" {}
variable "vpn_on_prem_prod_region_1_shared_secret_tunnel_2" {}
variable "vpn_on_prem_prod_region_2_shared_secret_tunnel_1" {}
variable "vpn_on_prem_prod_region_2_shared_secret_tunnel_2" {}

variable "vpn_on_prem_non_prod_region_1_shared_secret_tunnel_1" {}
variable "vpn_on_prem_non_prod_region_1_shared_secret_tunnel_2" {}
variable "vpn_on_prem_non_prod_region_2_shared_secret_tunnel_1" {}
variable "vpn_on_prem_non_prod_region_2_shared_secret_tunnel_2" {}