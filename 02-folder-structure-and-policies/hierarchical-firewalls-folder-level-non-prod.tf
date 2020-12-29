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
  HFW Folder Level - Non-Prod
 *****************************************/
//
//resource "google_compute_organization_security_policy" "non_prod_hfw_policy" {
//  provider = google-beta
//
//  display_name = "hfw-for-non-prod-folder"
//  parent       = google_folder.non_production.id
//}
//
//resource "google_compute_organization_security_policy_rule" "non_prod_hfw_policy_iap_ssh_next" {
//  provider = google-beta
//
//  policy_id = google_compute_organization_security_policy.non_prod_hfw_policy.id
//  action = "goto_next"
//
//  direction = "INGRESS"
//
//  match {
//    config {
//      src_ip_ranges = ["35.235.240.0/20"]
//      layer4_config {
//        ip_protocol = "tcp"
//        ports        = ["22"]
//      }
//    }
//  }
//
//  priority = 50
//
//}
//
//resource "google_compute_organization_security_policy_rule" "non_prod_hfw_policy_restrictedvip_next" {
//  provider = google-beta
//
//  policy_id = google_compute_organization_security_policy.non_prod_hfw_policy.id
//  action = "goto_next"
//
//  direction = "EGRESS"
//
//  match {
//    config {
//      dest_ip_ranges = ["199.36.153.4/30"]
//      layer4_config {
//        ip_protocol = "tcp"
//        ports        = ["443"]
//      }
//    }
//  }
//
//  priority = 45
//
//}
//
//resource "google_compute_organization_security_policy_rule" "non_prod_hfw_policy_rfcingress_next" {
//  provider = google-beta
//
//  policy_id = google_compute_organization_security_policy.non_prod_hfw_policy.id
//  action = "goto_next"
//
//  direction = "INGRESS"
//
//  match {
//    config {
//      src_ip_ranges = ["10.0.0.0/8", "192.168.0.0/16", "172.16.0.0/12"]
//      layer4_config {
//        ip_protocol = "tcp"
//      }
//      layer4_config {
//        ip_protocol = "udp"
//      }
//    }
//  }
//
//  priority = 90
//
//}
//
//resource "google_compute_organization_security_policy_rule" "non_prod_hfw_policy_rfcengress_next" {
//  provider = google-beta
//
//  policy_id = google_compute_organization_security_policy.non_prod_hfw_policy.id
//  action = "goto_next"
//
//  direction = "EGRESS"
//
//  match {
//    config {
//      dest_ip_ranges = ["10.0.0.0/8", "192.168.0.0/16", "172.16.0.0/12"]
//      layer4_config {
//        ip_protocol = "tcp"
//      }
//      layer4_config {
//        ip_protocol = "udp"
//      }
//    }
//  }
//
//  priority = 80
//
//}
//
//resource "google_compute_organization_security_policy_rule" "non_prod_hfw_policy_allingress_deny" {
//  provider = google-beta
//
//  policy_id = google_compute_organization_security_policy.non_prod_hfw_policy.id
//  action = "deny"
//
//  direction = "INGRESS"
//
//  match {
//    config {
//      src_ip_ranges = ["0.0.0.0/0"]
//      layer4_config {
//        ip_protocol = "tcp"
//      }
//      layer4_config {
//        ip_protocol = "udp"
//      }
//    }
//  }
//
//  priority = 100
//
//}
//
//resource "google_compute_organization_security_policy_rule" "non_prod_hfw_policy_allengress_deny" {
//  provider = google-beta
//
//  policy_id = google_compute_organization_security_policy.non_prod_hfw_policy.id
//  action = "deny"
//
//  direction = "EGRESS"
//
//  match {
//    config {
//      dest_ip_ranges = ["0.0.0.0/0"]
//      layer4_config {
//        ip_protocol = "tcp"
//      }
//      layer4_config {
//        ip_protocol = "udp"
//      }
//    }
//  }
//
//  priority = 110
//
//}
//
//
//
//resource "google_compute_organization_security_policy_association" "non_prod_hfw_policy_associated" {
//  provider = google-beta
//
//  name = "hfw-for-non-prod-folder-association"
//  attachment_id = google_compute_organization_security_policy.non_prod_hfw_policy.parent
//  policy_id     = google_compute_organization_security_policy.non_prod_hfw_policy.id
//}