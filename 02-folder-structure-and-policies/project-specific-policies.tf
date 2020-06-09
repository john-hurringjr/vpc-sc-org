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

// This file may be uncommented after the projects below are created

/******************************************
  Trusted Image
 *****************************************/
# Restrict just BU 1 to only get GCE images from specific project
resource "google_folder_organization_policy" "prod_bu_1_folder_trusted_image_project" {
  constraint  = "constraints/compute.trustedImageProjects"
  folder      = google_folder.production_bu_1.id
  list_policy {
    allow {
      values = [
        "projects/${data.terraform_remote_state.rs03_shared_services_projects.outputs.os_images_prod_project_id}",
      ]
    }
  }
}

# Trusted Images can be the publicly available images
resource "google_folder_organization_policy" "non_prod_bu_1_folder_trusted_image_project" {
  constraint  = "constraints/compute.trustedImageProjects"
  folder      = google_folder.non_production_bu_1.id
  list_policy {
    allow {
      values = [
        "projects/cos-cloud",
        "projects/debian-cloud",
        "projects/centos-cloud",
        "projects/coreos-cloud",
      ]
    }
  }
}

/******************************************
  GKE Project (Stop Requiring OS Login)
 *****************************************/
# Uncomment after GKE Projects Created

resource "google_project_organization_policy" "prod_gke_cluster_project_stop_os_login" {
  constraint  = "constraints/compute.requireOsLogin"
  project = data.terraform_remote_state.rs03_shared_services_projects.outputs.gke_cluster_prod_project_id

  boolean_policy {
    enforced = false
  }
}

resource "google_project_organization_policy" "non_prod_gke_cluster_project_stop_os_login" {
  constraint  = "constraints/compute.requireOsLogin"
  project = data.terraform_remote_state.rs03_shared_services_projects.outputs.gke_cluster_non_prod_project_id

  boolean_policy {
    enforced = false
  }
}

/******************************************
  GKE Project (Allow IP Forwarding)
 *****************************************/

resource "google_project_organization_policy" "prod_gke_cluster_project_allow_ip_forward" {
  constraint  = "compute.vmCanIpForward"
  project = data.terraform_remote_state.rs03_shared_services_projects.outputs.gke_cluster_prod_project_id

  list_policy {
    allow {
      all = true
    }
  }

}

resource "google_project_organization_policy" "non_prod_gke_cluster_project_allow_ip_forward" {
  constraint = "compute.vmCanIpForward"
  project = data.terraform_remote_state.rs03_shared_services_projects.outputs.gke_cluster_non_prod_project_id

  list_policy {
    allow {
      all = true
    }
  }
}
