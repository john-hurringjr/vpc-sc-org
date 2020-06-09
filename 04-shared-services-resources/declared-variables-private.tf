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

/*
  Many of the same variables are used for private api access and for
  restricted api access. So, they are only declared once here
  and then reused in both deployments. A few need to be unique
  and so you will see "private" or "restricted" listed in the variable
  name for those. For example, in the projects we will create
  both restricted and private so we need to distinguish between them
  by calling it out in the VPC Name.
 */

/******************************************
  VPC Names
 *****************************************/

# On Prem
variable "private_on_prem_prod_vpc_name" {
  default = "priv-op-prod-vpc"
}
variable "private_on_prem_non_prod_vpc_name" {
  default = "priv-op-non-prod-vpc"
}
variable "restricted_on_prem_prod_vpc_name" {
  default = "rest-op-prod-vpc"
}
variable "restricted_on_prem_non_prod_vpc_name" {
  default = "rest-op-non-prod-vpc"
}

# Prod
variable "private_prod_vpc_name" {
  default = "priv-prod-vpc"
}

variable "restricted_prod_vpc_name" {
  default = "rest-prod-vpc"
}

# Non-Prod
variable "private_non_prod_vpc_name" {
  default = "priv-non-prod-vpc"
}

variable "restricted_non_prod_vpc_name" {
  default = "rest-non-prod-vpc"
}

/******************************************
  Regions
 *****************************************/
variable "region_1" {
  default = "us-east4"
}

variable "region_2" {
  default = "us-central1"
}

variable "region_3" {
  default = "us-west4"
}

variable "region_4" {
  default = "northamerica-northeast1"
}

/******************************************
  Prod - Subnets
 *****************************************/
# Primary
variable "prod_vpc_subnet_1_cidr_primary" {
  default = "10.0.0.0/19"
}
variable "prod_vpc_subnet_2_cidr_primary" {
  default = "10.0.32.0/19"
}

variable "prod_vpc_subnet_3_cidr_primary" {
  default = "10.0.64.0/19"
}
variable "prod_vpc_subnet_4_cidr_primary" {
  default = "10.0.96.0/19"
}

# Secondary Pod IPs
variable "prod_vpc_subnet_1_cidr_pods" {
  default = "10.2.0.0/18"
}

variable "prod_vpc_subnet_2_cidr_pods" {
  default = "10.2.64.0/18"
}

variable "prod_vpc_subnet_3_cidr_pods" {
  default = "10.2.128.0/18"
}

variable "prod_vpc_subnet_4_cidr_pods" {
  default = "10.2.192.0/18"
}

# Secondary Services IPs
variable "prod_vpc_subnet_1_cidr_services" {
  default = "10.1.0.0/19"
}

variable "prod_vpc_subnet_2_cidr_services" {
  default = "10.1.32.0/19"
}

variable "prod_vpc_subnet_3_cidr_services" {
  default = "10.1.64.0/19"
}

variable "prod_vpc_subnet_4_cidr_services" {
  default = "10.1.96.0/19"
}

# Logging Settings
variable "prod_vpc_flow_log_interval" {
  default = "INTERVAL_5_MIN"
}

variable "prod_vpc_flow_log_sampling" {
  default =  0.8
}

/******************************************
  Non-Prod - Subnets
 *****************************************/
# Primary
variable "non_prod_vpc_subnet_1_cidr_primary" {
  default = "172.16.0.0/19"
}

variable "non_prod_vpc_subnet_2_cidr_primary" {
  default = "172.16.32.0/19"
}

variable "non_prod_vpc_subnet_3_cidr_primary" {
  default = "172.16.64.0/19"
}

variable "non_prod_vpc_subnet_4_cidr_primary" {
  default = "172.16.96.0/19"
}

# Secondary Pod IPs
variable "non_prod_vpc_subnet_1_cidr_pods" {
  default = "172.18.0.0/18"
}

variable "non_prod_vpc_subnet_2_cidr_pods" {
  default = "172.18.64.0/18"
}

variable "non_prod_vpc_subnet_3_cidr_pods" {
  default = "172.18.128.0/18"
}

variable "non_prod_vpc_subnet_4_cidr_pods" {
  default = "172.18.192.0/18"
}

# Secondary Services IPs
variable "non_prod_vpc_subnet_1_cidr_services" {
  default = "172.17.0.0/19"
}

variable "non_prod_vpc_subnet_2_cidr_services" {
  default = "172.17.32.0/19"
}

variable "non_prod_vpc_subnet_3_cidr_services" {
  default = "172.17.64.0/19"
}

variable "non_prod_vpc_subnet_4_cidr_services" {
  default = "172.17.96.0/19"
}

# Logging Settings
variable "non_prod_vpc_flow_log_interval" {
  default = "INTERVAL_15_MIN"
}

variable "non_prod_vpc_flow_log_sampling" {
  default =  0.2
}

/******************************************
  Prod & Non-Prod - Firewalls
 *****************************************/
variable "prod_deny_all_egress_priority" {
  default = 65535
}
variable "prod_deny_all_ingress_priority" {
  default = 65535
}

variable "non_prod_deny_all_egress_priority" {
  default = 65535
}
variable "non_prod_deny_all_ingress_priority" {
  default = 65535
}

/******************************************
  On Prem
 *****************************************/
# Project ID - We are pointing to a project outside of our Org.
variable "on_prem_project_id" {}

# Subnets
variable "on_prem_prod_vpc_subnet_1_cidr" {
  default = "192.168.0.0/22"
}
variable "on_prem_prod_vpc_subnet_2_cidr" {
  default = "192.168.4.0/22"
}
variable "on_prem_prod_vpc_subnet_3_cidr" {
  default = "192.168.8.0/22"
}
variable "on_prem_prod_vpc_subnet_4_cidr" {
  default = "192.168.12.0/22"
}

variable "on_prem_non_prod_vpc_subnet_1_cidr" {
  default = "192.168.16.0/22"
}
variable "on_prem_non_prod_vpc_subnet_2_cidr" {
  default = "192.168.20.0/22"
}
variable "on_prem_non_prod_vpc_subnet_3_cidr" {
  default = "192.168.24.0/22"
}
variable "on_prem_non_prod_vpc_subnet_4_cidr" {
  default = "192.168.28.0/22"
}

# Logging
variable "on_prem_prod_vpc_flow_log_interval" {
  default = "INTERVAL_15_MIN"
}
variable "on_prem_prod_vpc_flow_log_sampling" {
  default = 0.2
}