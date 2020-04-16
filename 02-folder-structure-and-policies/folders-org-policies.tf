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
  Shared VPC Restrict to Specific Host Prj
 *****************************************/
# This must be applied after Shared Service Projects is run:
resource "google_folder_organization_policy" "prod_restrict_vpc_host" {
  constraint  = "constraints/compute.restrictSharedVpcHostProjects"
  folder      = google_folder.production.id

  list_policy {
    allow {
      values = ["projects/${data.terraform_remote_state.03_shared_services_projects.outputs.project_id}"]
    }
  }

}




/******************************************
  Trusted Image
 *****************************************/
# Restrict BU 1 to only get GCE images from specific project

# Uncomment after Service Projects Created
//resource "google_folder_organization_policy" "prod_bu_1_folder_trusted_image_project" {
//  constraint  = "constraints/compute.trustedImageProjects"
//  folder      = google_folder.production_bu_1.id
//  list_policy {
//    allow {
//      values = ["projects/${?????}",]
//    }
//  }
//}

//resource "google_folder_organization_policy" "non_prod_bu_1_folder_trusted_image_project" {
//  constraint  = "constraints/compute.trustedImageProjects"
//  folder      = google_folder.non_production_bu_1.id
//  list_policy {
//    allow {
//      values = ["projects/${?????}",]
//    }
//  }
//}

/******************************************
  Location Restriction
 *****************************************/

# Restrict BU 1 to USA Locations Only
resource "google_folder_organization_policy" "prod_bu_1_folder_location_restriction" {
  constraint  = "constraints/gcp.resourceLocations"
  folder      = google_folder.production_bu_1.id

  list_policy {
    allow {
      values = ["us-locations"]
    }
  }

}