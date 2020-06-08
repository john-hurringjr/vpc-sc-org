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
variable "region_1" {
  default = "us-east4"

}variable "region_2" {
  default = "us-central1"
}

/******************************************
  Subnets Prod
 *****************************************/
# Restricted
variable "restricted_prod_vpc_subnet_1_cidr" {
  default = "10.0.0.0/19"
}
variable "restricted_prod_vpc_subnet_2_cidr" {
  default = "10.128.0.0/19"
}

variable "restricted_prod_vpc_flow_log_interval" {
  default = "INTERVAL_5_MIN"
}
variable "restricted_prod_vpc_flow_log_sampling" {
  default =  0.8
}

# Private
variable "private_prod_vpc_subnet_1_cidr" {
  default = "10.0.0.0/19"
}
variable "private_prod_vpc_subnet_2_cidr" {
  default = "10.128.0.0/19"
}

variable "private_prod_vpc_flow_log_interval" {
  default = "INTERVAL_5_MIN"
}
variable "private_prod_vpc_flow_log_sampling" {
  default =  0.8
}

/******************************************
  Subnets Non-Prod
 *****************************************/

# Restricted
variable "restricted_non_prod_vpc_subnet_1_cidr" {
  default = "172.16.0.0/19"
}
variable "restricted_non_prod_vpc_subnet_2_cidr" {}

variable "restricted_non_prod_vpc_flow_log_interval" {}
variable "restricted_non_prod_vpc_flow_log_sampling" {}

# Private
variable "private_non_prod_vpc_subnet_1_cidr" {}
variable "private_non_prod_vpc_subnet_2_cidr" {}

variable "private_non_prod_vpc_flow_log_interval" {}
variable "private_non_prod_vpc_flow_log_sampling" {}

/******************************************
  Firewalls
 *****************************************/

# Restricted
variable "restricted_prod_deny_all_egress_priority" {}
variable "restricted_prod_deny_all_ingress_priority" {}

variable "restricted_non_prod_deny_all_egress_priority" {}
variable "restricted_non_prod_deny_all_ingress_priority" {}

# Restricted
variable "private_prod_deny_all_egress_priority" {}
variable "private_prod_deny_all_ingress_priority" {}

variable "private_non_prod_deny_all_egress_priority" {}
variable "private_non_prod_deny_all_ingress_priority" {}
/******************************************
  On Prem
 *****************************************/
variable "on_prem_project_id" {}

# Restricted Prod
variable "restricted_on_prem_prod_vpc_name" {}
variable "restricted_on_prem_prod_vpc_subnet_1_cidr" {}
variable "restricted_on_prem_prod_vpc_subnet_2_cidr" {}
variable "restricted_on_prem_prod_vpc_flow_log_interval" {}
variable "restricted_on_prem_prod_vpc_flow_log_sampling" {}

# Restricted Non-Prod
variable "restricted_on_prem_non_prod_vpc_name" {}
variable "restricted_on_prem_non_prod_vpc_subnet_1_cidr" {}
variable "restricted_on_prem_non_prod_vpc_subnet_2_cidr" {}
variable "restricted_on_prem_non_prod_vpc_flow_log_interval" {}
variable "restricted_on_prem_non_prod_vpc_flow_log_sampling" {}

# Private Prod
variable "private_on_prem_prod_vpc_name" {}
variable "private_on_prem_prod_vpc_subnet_1_cidr" {}
variable "private_on_prem_prod_vpc_subnet_2_cidr" {}
variable "private_on_prem_prod_vpc_flow_log_interval" {}
variable "private_on_prem_prod_vpc_flow_log_sampling" {}

# Private Non-Prod
variable "private_on_prem_non_prod_vpc_name" {}
variable "private_on_prem_non_prod_vpc_subnet_1_cidr" {}
variable "private_on_prem_non_prod_vpc_subnet_2_cidr" {}
variable "private_on_prem_non_prod_vpc_flow_log_interval" {}
variable "private_on_prem_non_prod_vpc_flow_log_sampling" {}

/******************************************
 Restricted HA VPN
 *****************************************/
variable "restricted_on_prem_prod_vpc_router_region_1_asn" {}
variable "restricted_on_prem_prod_vpc_router_region_2_asn" {}
variable "restricted_on_prem_non_prod_vpc_router_region_1_asn" {}
variable "restricted_on_prem_non_prod_vpc_router_region_2_asn" {}

variable "restricted_prod_vpc_router_region_1_asn" {}
variable "restricted_prod_vpc_router_region_2_asn" {}

variable "restricted_non_prod_vpc_router_region_1_asn" {}
variable "restricted_non_prod_vpc_router_region_2_asn" {}

variable "vpn_on_prem_restricted_prod_region_1_shared_secret_tunnel_1" {}
variable "vpn_on_prem_restricted_prod_region_1_shared_secret_tunnel_2" {}
variable "vpn_on_prem_restricted_prod_region_2_shared_secret_tunnel_1" {}
variable "vpn_on_prem_restricted_prod_region_2_shared_secret_tunnel_2" {}

variable "vpn_on_prem_restricted_non_prod_region_1_shared_secret_tunnel_1" {}
variable "vpn_on_prem_restricted_non_prod_region_1_shared_secret_tunnel_2" {}
variable "vpn_on_prem_restricted_non_prod_region_2_shared_secret_tunnel_1" {}
variable "vpn_on_prem_restricted_non_prod_region_2_shared_secret_tunnel_2" {}

/******************************************
 Private HA VPN
 *****************************************/
variable "private_on_prem_prod_vpc_router_region_1_asn" {}
variable "private_on_prem_prod_vpc_router_region_2_asn" {}
variable "private_on_prem_non_prod_vpc_router_region_1_asn" {}
variable "private_on_prem_non_prod_vpc_router_region_2_asn" {}

variable "private_prod_vpc_router_region_1_asn" {}
variable "private_prod_vpc_router_region_2_asn" {}

variable "private_non_prod_vpc_router_region_1_asn" {}
variable "private_non_prod_vpc_router_region_2_asn" {}

variable "vpn_on_prem_private_prod_region_1_shared_secret_tunnel_1" {}
variable "vpn_on_prem_private_prod_region_1_shared_secret_tunnel_2" {}
variable "vpn_on_prem_private_prod_region_2_shared_secret_tunnel_1" {}
variable "vpn_on_prem_private_prod_region_2_shared_secret_tunnel_2" {}

variable "vpn_on_prem_private_non_prod_region_1_shared_secret_tunnel_1" {}
variable "vpn_on_prem_private_non_prod_region_1_shared_secret_tunnel_2" {}
variable "vpn_on_prem_private_non_prod_region_2_shared_secret_tunnel_1" {}
variable "vpn_on_prem_private_non_prod_region_2_shared_secret_tunnel_2" {}