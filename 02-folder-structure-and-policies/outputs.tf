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

output "shared_services_folder_id" {
  value = google_folder.shared_services.id
}

output "prod_folder_id" {
  value = google_folder.production.id
}

output "non_prod_folder_id" {
  value = google_folder.non_production.id
}

output "prod_bu_1_folder_id" {
  value = google_folder.production_bu_1.id
}

output "prod_bu_2_folder_id" {
  value = google_folder.production_bu_2.id
}

output "non_prod_bu_1_folder_id" {
  value = google_folder.non_production_bu_1.id
}

output "non_prod_bu_2_folder_id" {
  value = google_folder.non_production_bu_2.id
}