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
  GCS
 *****************************************/

# Uncomment below and run terraform apply again after you've set up your project
//module "gcs_bucket_builds_bootstrap" {
//  source                            = "github.com/john-hurringjr/test-modules/gcs/iac-build-bootstrap"
//  project_id                        = module.bootstrap_project.project_id
//  gcs_backend_variables_unique_id   = var.gcs_backend_variables_unique_id
//  gcs_backend_state_files_unique_id = var.gcs_backend_state_files_unique_id
//}

/******************************************
  Cloud Build Triggers
 *****************************************/
# Waiting on further support for Cloud Build and GitHub to build this


