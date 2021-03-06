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
  Backend State Reference
 *****************************************/

 terraform {
   backend "gcs" {
     bucket = ""
     prefix = "04_shared_services_resources"
   }
 }

 /******************************************
   Remote State References
  *****************************************/
# Run init for all remote state references, without it, there is not file for below to reference, so it will fail.

data "terraform_remote_state" "rs01_org_node_stuff" {
  backend = "gcs"
  config = {
    bucket = ""
    prefix = "01-org-node-stuff"
  }
}
data "terraform_remote_state" "rs02_folder_structure_and_policies" {
  backend = "gcs"
  config = {
    bucket = ""
    prefix = "02-folder-structure-and-policies"
  }
}

data "terraform_remote_state" "rs03_shared_services_projects" {
  backend = "gcs"
  config = {
    bucket = ""
    prefix = "03-shared-services-projects"
  }
}

data "terraform_remote_state" "rs05_prod_projects" {
  backend = "gcs"
  config = {
    bucket = ""
    prefix = "05-prod-projects"
  }
}

data "terraform_remote_state" "rs06_non_prod_projects" {
  backend = "gcs"
  config = {
    bucket = ""
    prefix = "06-non-prod-projects"
  }
}

data "terraform_remote_state" "rs07_prod_resources" {
  backend = "gcs"
  config = {
    bucket = ""
    prefix = "07-prod-resources"
  }
}

data "terraform_remote_state" "rs08_non_prod_resources" {
  backend = "gcs"
  config = {
    bucket = ""
    prefix = "08-non-prod-resources"
  }
}