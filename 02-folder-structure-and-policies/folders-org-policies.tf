#/**
# *
# * Licensed under the Apache License, Version 2.0 (the "License");
# * you may not use this file except in compliance with the License.
# * You may obtain a copy of the License at
# *
# *      http://www.apache.org/licenses/LICENSE-2.0
# *
# * Unless required by applicable law or agreed to in writing, software
# * distributed under the License is distributed on an "AS IS" BASIS,
# * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# * See the License for the specific language governing permissions and
# * limitations under the License.
# */
#
#/******************************************
#  Shared VPC Restrict to Specific Host Prj
# *****************************************/
## This must be applied after Shared Service Projects is run:
#resource "google_folder_organization_policy" "prod_restrict_vpc_host" {
#  constraint  = "constraints/compute.restrictSharedVpcHostProjects"
#  folder      = google_folder.production.id
#
#  list_policy {
#    allow {
#      values = [
#        "projects/${data.terraform_remote_state.rs03_shared_services_projects.outputs.shared_vpc_prod_project_id}",
#      ]
#    }
#  }
#
#}
#
#resource "google_folder_organization_policy" "non_prod_restrict_vpc_host" {
#  constraint  = "constraints/compute.restrictSharedVpcHostProjects"
#  folder      = google_folder.non_production.id
#
#  list_policy {
#    allow {
#      values = [
#        "projects/${data.terraform_remote_state.rs03_shared_services_projects.outputs.shared_vpc_non_prod_project_id}",
#      ]
#    }
#  }
#
#}
#
#/******************************************
#  Location Restriction
# *****************************************/
#
## Restrict BU 1 to USA Locations Only
#resource "google_folder_organization_policy" "prod_bu_1_folder_location_restriction" {
#  constraint  = "constraints/gcp.resourceLocations"
#  folder      = google_folder.production_bu_1.id
#
#  list_policy {
#    allow {
#      values = ["in:us-locations"]
#    }
#  }
#
#}
#
#resource "google_folder_organization_policy" "non_prod_bu_1_folder_location_restriction" {
#  constraint  = "constraints/gcp.resourceLocations"
#  folder      = google_folder.non_production_bu_1.id
#
#  list_policy {
#    allow {
#      values = ["in:us-locations"]
#    }
#  }
#
#}
#
#/******************************************
#  Outputs
# *****************************************/
