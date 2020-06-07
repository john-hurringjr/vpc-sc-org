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
  Outputs
 *****************************************/

output "shared_vpc_prod_project_id" {
  value = module.shared_vpc_host_project_prod.project_id
}

output "shared_vpc_non_prod_project_id" {
  value = module.shared_vpc_host_project_non_prod.project_id
}

output "billing_charges_export_project_id" {
  value = module.billing_charges_export_project.project_id
}

output "org_log_sink_prod_project_id" {
  value = module.org_log_sink_project_prod.project_id
}

output "monitoring_prod_project_id" {
  value = module.monitoring_project_prod.project_id
}

output "monitoring_non_prod_project_id" {
  value = module.monitoring_project_non_prod.project_id
}

# Uncomment below after created OS image projects
output "os_images_prod_project_id" {
  value = module.os_images_project_prod.project_id
}

output "os_images_non_prod_project_id" {
  value = module.os_images_project_non_prod.project_id
}

# Uncomment below after created GKE projects
output "gke_cluster_prod_project_id" {
  value = module.gke_cluster_project_prod.project_id
}

output "gke_cluster_non_prod_project_id" {
  value = module.gke_cluster_project_non_prod.project_id
}
