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
#/******************************************
#  Restricted Shared VPC Host - Prod - DNS & Routing
# *****************************************/
#module "restricted_prod_vpc_restricted_apis_dns" {
#  source            = "github.com/john-hurringjr/test-modules/networking/dns/internal-restricted-apis"
#  project_id        = data.terraform_remote_state.rs03_shared_services_projects.outputs.shared_vpc_prod_project_id
#  network_self_link = google_compute_network.restricted_prod_vpc.self_link
#}
#
#module "restricted_prod_vpc_restricted_apis_routing" {
#  source            = "github.com/john-hurringjr/test-modules/networking/routing/restricted-apis"
#  project_id        = data.terraform_remote_state.rs03_shared_services_projects.outputs.shared_vpc_prod_project_id
#  network_self_link = google_compute_network.restricted_prod_vpc.self_link
#}
#
#/******************************************
#  Restricted Shared VPC Host - Non-Prod - DNS & Routing
# *****************************************/
#module "restricted_non_prod_vpc_restricted_apis_dns" {
#  source            = "github.com/john-hurringjr/test-modules/networking/dns/internal-restricted-apis"
#  project_id        = data.terraform_remote_state.rs03_shared_services_projects.outputs.shared_vpc_non_prod_project_id
#  network_self_link = google_compute_network.restricted_non_prod_vpc.self_link
#}
#
#module "restricted_non_prod_vpc_restricted_apis_routing" {
#  source            = "github.com/john-hurringjr/test-modules/networking/routing/restricted-apis"
#  project_id        = data.terraform_remote_state.rs03_shared_services_projects.outputs.shared_vpc_non_prod_project_id
#  network_self_link = google_compute_network.restricted_non_prod_vpc.self_link
#}
#
#/******************************************
#  Restricted Shared VPC Host - Prod - Firewalls
# *****************************************/
#
## Denies all egress on all VMs. Also enables logging for this FW rule.
#module "restricted_prod_vpc_firewall_deny_all_egress" {
#  source            = "github.com/john-hurringjr/test-modules/networking/firewall-rules/all/deny-egress-all-port-proto"
#  project_id        = data.terraform_remote_state.rs03_shared_services_projects.outputs.shared_vpc_prod_project_id
#  network_self_link = google_compute_network.restricted_prod_vpc.self_link
#  network_name      = google_compute_network.restricted_prod_vpc.name
#  priority          = var.prod_deny_all_egress_priority
#}
#
## Denies all ingress on all VMs. Also enables logging for this FW rule.
#module "restricted_prod_vpc_firewall_deny_all_ingress" {
#  source            = "github.com/john-hurringjr/test-modules/networking/firewall-rules/all/deny-ingress-all-port-proto"
#  project_id        = data.terraform_remote_state.rs03_shared_services_projects.outputs.shared_vpc_prod_project_id
#  network_self_link = google_compute_network.restricted_prod_vpc.self_link
#  network_name      = google_compute_network.restricted_prod_vpc.name
#  priority          = var.prod_deny_all_ingress_priority
#}
#
## Allows egress for all VMs to restrict apis vips
#module "restricted_prod_vpc_firewall_allow_egress_restricted_apis" {
#  source            = "github.com/john-hurringjr/test-modules/networking/firewall-rules/all/allow-egress-restricted-apis"
#  project_id        = data.terraform_remote_state.rs03_shared_services_projects.outputs.shared_vpc_prod_project_id
#  network_self_link = google_compute_network.restricted_prod_vpc.self_link
#  network_name      = google_compute_network.restricted_prod_vpc.name
#}
#
#/******************************************
#  Restricted Shared VPC Host - Non-Prod - Firewalls
# *****************************************/
## Denies all egress on all VMs. Also enables logging for this FW rule.
#module "restricted_non_prod_vpc_firewall_deny_all_egress" {
#  source            = "github.com/john-hurringjr/test-modules/networking/firewall-rules/all/deny-egress-all-port-proto"
#  project_id        = data.terraform_remote_state.rs03_shared_services_projects.outputs.shared_vpc_non_prod_project_id
#  network_self_link = google_compute_network.restricted_non_prod_vpc.self_link
#  network_name      = google_compute_network.restricted_non_prod_vpc.name
#  priority          = var.non_prod_deny_all_egress_priority
#}
#
## Denies all ingress on all VMs. Also enables logging for this FW rule.
#module "restricted_non_prod_vpc_firewall_deny_all_ingress" {
#  source            = "github.com/john-hurringjr/test-modules/networking/firewall-rules/all/deny-ingress-all-port-proto"
#  project_id        = data.terraform_remote_state.rs03_shared_services_projects.outputs.shared_vpc_non_prod_project_id
#  network_self_link = google_compute_network.restricted_non_prod_vpc.self_link
#  network_name      = google_compute_network.restricted_non_prod_vpc.name
#  priority          = var.non_prod_deny_all_ingress_priority
#}
#
## Allows ingress on 22, 3389, 443 on all VMs from all rfc1918
#module "restricted_non_prod_vpc_firewall_allow_ingress_rfc1918_limited" {
#  source            = "github.com/john-hurringjr/test-modules/networking/firewall-rules/all/allow-ingress-rfc1918-limited"
#  project_id        = data.terraform_remote_state.rs03_shared_services_projects.outputs.shared_vpc_non_prod_project_id
#  network_self_link = google_compute_network.restricted_non_prod_vpc.self_link
#  network_name      = google_compute_network.restricted_non_prod_vpc.name
#}
#
## Allows egress on 22, 3389, 443 on all VMs to rfc1918
#module "restricted_non_prod_vpc_firewall_allow_egress_rfc1918_limited" {
#  source            = "github.com/john-hurringjr/test-modules/networking/firewall-rules/all/allow-egress-rfc1918-limited"
#  project_id        = data.terraform_remote_state.rs03_shared_services_projects.outputs.shared_vpc_non_prod_project_id
#  network_self_link = google_compute_network.restricted_non_prod_vpc.self_link
#  network_name      = google_compute_network.restricted_non_prod_vpc.name
#}
#
## Allows egress for all VMs to restrict apis vips
#module "restricted_non_prod_vpc_firewall_allow_egress_restricted_apis" {
#  source            = "github.com/john-hurringjr/test-modules/networking/firewall-rules/all/allow-egress-restricted-apis"
#  project_id        = data.terraform_remote_state.rs03_shared_services_projects.outputs.shared_vpc_non_prod_project_id
#  network_self_link = google_compute_network.restricted_non_prod_vpc.self_link
#  network_name      = google_compute_network.restricted_non_prod_vpc.name
#}