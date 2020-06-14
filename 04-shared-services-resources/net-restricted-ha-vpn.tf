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

/*
  HA VPN can become costs if left up 24x7 for a simple test environment
  Therefore, it is highly recommend and asked that you use this file
  to comment the VPN in/out as needed. Declared variables are included
  in this file as Terraform will stop supporting declared variables that
  are unused (and if you comment out the code they will be unused). I've also
  only decided to connect two regions. You may wish to connect more, but
  for the purposes of this deployment, I decided to allow global routing to
  cover my access to non-directly-connected regions.
*/

/******************************************
 Declared Variable - Restricted HA VPN
 *****************************************/
//# Prod
//variable "restricted_on_prem_prod_vpc_router_region_1_asn" {
//  default = 4200000100
//}
//variable "restricted_on_prem_prod_vpc_router_region_2_asn" {
//  default = 4200000101
//}
//
//variable "restricted_prod_vpc_router_region_1_asn" {
//  default = 4200000600
//}
//variable "restricted_prod_vpc_router_region_2_asn" {
//  default = 4200000601
//}
//
//variable "vpn_on_prem_restricted_prod_region_1_shared_secret_tunnel_1" {}
//variable "vpn_on_prem_restricted_prod_region_1_shared_secret_tunnel_2" {}
//variable "vpn_on_prem_restricted_prod_region_2_shared_secret_tunnel_1" {}
//variable "vpn_on_prem_restricted_prod_region_2_shared_secret_tunnel_2" {}

# Non-Prod
variable "restricted_on_prem_non_prod_vpc_router_region_1_asn" {
  default = 4200000200
}
variable "restricted_on_prem_non_prod_vpc_router_region_2_asn" {
  default = 4200000201
}

variable "restricted_non_prod_vpc_router_region_1_asn" {
  default = 4200000700
}
variable "restricted_non_prod_vpc_router_region_2_asn" {
  default = 4200000701
}

variable "vpn_on_prem_restricted_non_prod_region_1_shared_secret_tunnel_1" {}
variable "vpn_on_prem_restricted_non_prod_region_1_shared_secret_tunnel_2" {}
variable "vpn_on_prem_restricted_non_prod_region_2_shared_secret_tunnel_1" {}
variable "vpn_on_prem_restricted_non_prod_region_2_shared_secret_tunnel_2" {}

/******************************************
  Restricted On Prem HA VPN with Prod VPC
 *****************************************/

//module "restricted_ha_vpn_on_prem_with_prod_vpc_region_1" {
//  source                    = "github.com/john-hurringjr/test-modules/networking/vpn-ha-gcp"
//  project_1_id              = var.on_prem_project_id
//  network_1_self_link       = google_compute_network.restricted_on_prem_vpc_prod.self_link
//  network_1_name            = google_compute_network.restricted_on_prem_vpc_prod.name
//  network_1_router_bgp_asn  = var.restricted_on_prem_prod_vpc_router_region_1_asn
//  project_2_id              = data.terraform_remote_state.rs03_shared_services_projects.outputs.shared_vpc_prod_project_id
//  network_2_self_link       = google_compute_network.restricted_prod_vpc.self_link
//  network_2_name            = google_compute_network.restricted_prod_vpc.name
//  network_2_router_bgp_asn  = var.restricted_prod_vpc_router_region_1_asn
//  shared_secret_tunnel_1    = var.vpn_on_prem_restricted_prod_region_1_shared_secret_tunnel_1
//  shared_secret_tunnel_2    = var.vpn_on_prem_restricted_prod_region_1_shared_secret_tunnel_2
//  region                    = var.region_1
//  custom_range              = "199.36.153.4/30" #Restricted: 199.36.153.4/30
//}
//
//module "restricted_ha_vpn_on_prem_with_prod_vpc_region_2" {
//  source                    = "github.com/john-hurringjr/test-modules/networking/vpn-ha-gcp"
//  project_1_id              = var.on_prem_project_id
//  network_1_self_link       = google_compute_network.restricted_on_prem_vpc_prod.self_link
//  network_1_name            = google_compute_network.restricted_on_prem_vpc_prod.name
//  network_1_router_bgp_asn  = var.restricted_on_prem_prod_vpc_router_region_2_asn
//  project_2_id              = data.terraform_remote_state.rs03_shared_services_projects.outputs.shared_vpc_prod_project_id
//  network_2_self_link       = google_compute_network.restricted_prod_vpc.self_link
//  network_2_name            = google_compute_network.restricted_prod_vpc.name
//  network_2_router_bgp_asn  = var.restricted_prod_vpc_router_region_2_asn
//  shared_secret_tunnel_1    = var.vpn_on_prem_restricted_prod_region_2_shared_secret_tunnel_1
//  shared_secret_tunnel_2    = var.vpn_on_prem_restricted_prod_region_2_shared_secret_tunnel_2
//  region                    = var.region_2
//  custom_range              = "199.36.153.4/30" #Restricted: 199.36.153.4/30
//}

/******************************************
  Restricted On Prem HA VPN with Non-Prod VPC
 *****************************************/

module "restricted_vpc_sc_ha_vpn_on_prem_with_non_prod_vpc_region_1" {
  source                    = "github.com/john-hurringjr/test-modules/networking/vpn-ha-gcp"
  project_1_id              = var.on_prem_project_id
  network_1_self_link       = google_compute_network.restricted_on_prem_vpc_non_prod.self_link
  network_1_name            = google_compute_network.restricted_on_prem_vpc_non_prod.name
  network_1_router_bgp_asn  = var.restricted_on_prem_non_prod_vpc_router_region_1_asn
  project_2_id              = data.terraform_remote_state.rs03_shared_services_projects.outputs.shared_vpc_non_prod_project_id
  network_2_self_link       = google_compute_network.restricted_non_prod_vpc.self_link
  network_2_name            = google_compute_network.restricted_non_prod_vpc.name
  network_2_router_bgp_asn  = var.restricted_non_prod_vpc_router_region_1_asn
  shared_secret_tunnel_1    = var.vpn_on_prem_restricted_non_prod_region_1_shared_secret_tunnel_1
  shared_secret_tunnel_2    = var.vpn_on_prem_restricted_non_prod_region_1_shared_secret_tunnel_2
  region                    = var.region_1
  custom_range              = "199.36.153.4/30" #Restricted: 199.36.153.4/30
}

module "restricted_vpc_sc_ha_vpn_on_prem_with_non_prod_vpc_region_2" {
  source                    = "github.com/john-hurringjr/test-modules/networking/vpn-ha-gcp"
  project_1_id              = var.on_prem_project_id
  network_1_self_link       = google_compute_network.restricted_on_prem_vpc_non_prod.self_link
  network_1_name            = google_compute_network.restricted_on_prem_vpc_non_prod.name
  network_1_router_bgp_asn  = var.restricted_on_prem_non_prod_vpc_router_region_2_asn
  project_2_id              = data.terraform_remote_state.rs03_shared_services_projects.outputs.shared_vpc_non_prod_project_id
  network_2_self_link       = google_compute_network.restricted_non_prod_vpc.self_link
  network_2_name            = google_compute_network.restricted_non_prod_vpc.name
  network_2_router_bgp_asn  = var.restricted_non_prod_vpc_router_region_2_asn
  shared_secret_tunnel_1    = var.vpn_on_prem_restricted_non_prod_region_2_shared_secret_tunnel_1
  shared_secret_tunnel_2    = var.vpn_on_prem_restricted_non_prod_region_2_shared_secret_tunnel_2
  region                    = var.region_2
  custom_range              = "199.36.153.4/30" #Restricted: 199.36.153.4/30
}
