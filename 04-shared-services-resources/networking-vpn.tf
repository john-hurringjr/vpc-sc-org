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

I use a GCP project hosted in another Org for my fake "On Prem"
environment. You may ignore this if you want to configure your own VPN.

Note, I use thise file to comment in/out my VPN to help reduce cost
when I am not using the VPN for testing.

As mentioned in the readme, you will need to grant your TF service
account the appropriate permissions to your "on prem" gcp project.

*/

/******************************************
  On Prem HA VPN with Transit VPC
 *****************************************/

//module "vpc_sc_ha_vpn_on_prem_with_transit_vpc_region_1" {
//  source                    = "github.com/john-hurringjr/test-modules/networking/vpn-ha-gcp"
//  project_1_id              = google_project.on_premise.project_id
//  network_1_self_link       = google_compute_network.vpc_sc_on_prem_vpc.self_link
//  network_1_name            = google_compute_network.vpc_sc_on_prem_vpc.name
//  network_1_router_bgp_asn  = var.on_prem_vpc_router_region_1_asn
//  project_2_id              = module.vpc_sc_shared_vpc_host_project_transit.project_id
//  network_2_self_link       = google_compute_network.vpc_sc_transit_vpc.self_link
//  network_2_name            = google_compute_network.vpc_sc_transit_vpc.name
//  network_2_router_bgp_asn  = var.transit_vpc_router_region_1_asn
//  shared_secret_tunnel_1    = var.vpn_on_prem_transit_region_1_shared_secret_tunnel_1
//  shared_secret_tunnel_2    = var.vpn_on_prem_transit_region_1_shared_secret_tunnel_2
//  region                    = var.region_1
//}
//
//module "vpc_sc_ha_vpn_on_prem_with_transit_vpc_region_2" {
//  source                    = "github.com/john-hurringjr/test-modules/networking/vpn-ha-gcp"
//  project_1_id              = google_project.on_premise.project_id
//  network_1_self_link       = google_compute_network.vpc_sc_on_prem_vpc.self_link
//  network_1_name            = google_compute_network.vpc_sc_on_prem_vpc.name
//  network_1_router_bgp_asn  = var.on_prem_vpc_router_region_2_asn
//  project_2_id              = module.vpc_sc_shared_vpc_host_project_transit.project_id
//  network_2_self_link       = google_compute_network.vpc_sc_transit_vpc.self_link
//  network_2_name            = google_compute_network.vpc_sc_transit_vpc.name
//  network_2_router_bgp_asn  = var.transit_vpc_router_region_2_asn
//  shared_secret_tunnel_1    = var.vpn_on_prem_transit_region_2_shared_secret_tunnel_1
//  shared_secret_tunnel_2    = var.vpn_on_prem_transit_region_2_shared_secret_tunnel_2
//  region                    = var.region_2
//}

/******************************************
  On Prem HA VPN with Dev VPC
 *****************************************/

//module "vpc_sc_ha_vpn_on_prem_with_dev_vpc_region_1" {
//  source                    = "github.com/john-hurringjr/test-modules/networking/vpn-ha-gcp"
//  project_1_id              = google_project.on_premise.project_id
//  network_1_self_link       = google_compute_network.vpc_sc_on_prem_vpc.self_link
//  network_1_name            = google_compute_network.vpc_sc_on_prem_vpc.name
//  network_1_router_bgp_asn  = var.on_prem_vpc_router_region_1_asn
//  project_2_id              = module.vpc_sc_shared_vpc_host_project_dev.project_id
//  network_2_self_link       = google_compute_network.vpc_sc_dev_vpc.self_link
//  network_2_name            = google_compute_network.vpc_sc_dev_vpc.name
//  network_2_router_bgp_asn  = var.transit_vpc_router_region_1_asn
//  shared_secret_tunnel_1    = var.vpn_on_prem_transit_region_1_shared_secret_tunnel_1
//  shared_secret_tunnel_2    = var.vpn_on_prem_transit_region_1_shared_secret_tunnel_2
//  region                    = var.region_1
//  custom_range              = "199.36.153.8/30" #Restricted: 199.36.153.4/30 OR Private: 199.36.153.8/30
//}
//
//module "vpc_sc_ha_vpn_on_prem_with_dev_vpc_region_2" {
//  source                    = "github.com/john-hurringjr/test-modules/networking/vpn-ha-gcp"
//  project_1_id              = google_project.on_premise.project_id
//  network_1_self_link       = google_compute_network.vpc_sc_on_prem_vpc.self_link
//  network_1_name            = google_compute_network.vpc_sc_on_prem_vpc.name
//  network_1_router_bgp_asn  = var.on_prem_vpc_router_region_2_asn
//  project_2_id              = module.vpc_sc_shared_vpc_host_project_dev.project_id
//  network_2_self_link       = google_compute_network.vpc_sc_dev_vpc.self_link
//  network_2_name            = google_compute_network.vpc_sc_dev_vpc.name
//  network_2_router_bgp_asn  = var.transit_vpc_router_region_2_asn
//  shared_secret_tunnel_1    = var.vpn_on_prem_transit_region_2_shared_secret_tunnel_1
//  shared_secret_tunnel_2    = var.vpn_on_prem_transit_region_2_shared_secret_tunnel_2
//  region                    = var.region_2
//  custom_range              = "199.36.153.8/30" #Restricted: 199.36.153.4/30 OR Private: 199.36.153.8/30
//}