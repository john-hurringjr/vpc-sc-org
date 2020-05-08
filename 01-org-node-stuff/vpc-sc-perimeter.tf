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
  Acceess Context Manager Access Policy
 *****************************************/

resource "google_access_context_manager_access_policy" "access_policy" {
  parent = "organizations/${var.organization_id}"
  title  = "org access policy"
}

/*
Be very careful using the aboce block. If your org already has an access policy this will clear it out and make a new one
Clearing out a policy like this will remove any access levels already created.
*/


/******************************************
  Acceess Context Manager Perimeter (VPC Service Controls)
 *****************************************/
resource "google_access_context_manager_service_perimeter" "service_perimeter_configuration" {
  parent = "accessPolicies/${google_access_context_manager_access_policy.access_policy.name}"
  name   = "accessPolicies/${google_access_context_manager_access_policy.access_policy.name}/servicePerimeters/restrict_all"
  title  = "restrict_all"
  status {
    # Below list is built from official list, and will be updated to reflect it. Order is same as site.
    # NOTE: Restricting an API here does not just grant IAM permission to use that API/Service
    # Link: https://cloud.google.com/vpc-service-controls/docs/supported-products
    restricted_services = [
      "accessapproval.googleapis.com",
      "ml.googleapis.com",
      "artifactregistry.googleapis.com",
      "automl.googleapis.com",
      # Claims that profiler is not supported, but site says it is...
      #"eu-automl.googleapis.com",
      "bigquery.googleapis.com",
      "bigtable.googleapis.com",
      "cloudasset.googleapis.com",
      "datafusion.googleapis.com",
      "dataflow.googleapis.com",
      "dataproc.googleapis.com",
      "dlp.googleapis.com",
      "cloudfunctions.googleapis.com",
      "cloudkms.googleapis.com",
      "secretmanager.googleapis.com",
      "language.googleapis.com",
      "managedidentities.googleapis.com",
      "pubsub.googleapis.com",
      "meshca.googleapis.com",
      "spanner.googleapis.com",
      "storage.googleapis.com",
      "storagetransfer.googleapis.com",
      "sqladmin.googleapis.com",
      "vision.googleapis.com",
      "containeranalysis.googleapis.com",
      "containerregistry.googleapis.com",
      "container.googleapis.com",
      "gkeconnect.googleapis.com",
      "gkehub.googleapis.com",
      "cloudresourcemanager.googleapis.com",
      "logging.googleapis.com",
      "monitoring.googleapis.com",
      # Claims that profiler is not supported, but site says it is...
      # "profiler.googleapis.com",
      "texttospeech.googleapis.com",
      "translate.googleapis.com",
      "cloudtrace.googleapis.com",
      "tpu.googleapis.com",
      "videointelligence.googleapis.com",
      "healthcare.googleapis.com",
      "servicecontrol.googleapis.com"
    ]

    # Below will need to be added later after you have deployed  necessary projects it will be referencing and
    # created the necessary access levels
    access_levels = [
      google_access_context_manager_access_level.allow_all_tf_service_accounts.id,
      #Comment line below in/out as you need to troubleshoot
      google_access_context_manager_access_level.allow_my_account.id
    ]

  }

  lifecycle {
    ignore_changes = [status[0].resources]
  }

}