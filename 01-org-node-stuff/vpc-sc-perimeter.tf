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
  Access Context Manager Access Policy
 *****************************************/

resource "google_access_context_manager_access_policy" "access_policy" {
  parent = "organizations/${var.organization_id}"
  title  = "org access policy"
}

/*
Be very careful using the above block. If your org already has an access policy this will clear it out and make a new one
Clearing out a policy like this will remove any access levels already created.
*/


/******************************************
  Access Context Manager Perimeter (VPC Service Controls)
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
      "notebooks.googleapis.com",
      "ml.googleapis.com",
      "meshca.googleapis.com",
      "apigee.googleapis.com",
      "apigeeconnect.googleapis.com",
      "artifactregistry.googleapis.com",
      "automl.googleapis.com",
      "eu-automl.googleapis.com",
      "bigquery.googleapis.com",
      "bigquerydatatransfer.googleapis.com",
      "binaryauthorization.googleapis.com",
      "privateca.googleapis.com",
      "cloudasset.googleapis.com",
      "bigtable.googleapis.com",
      "cloudbuild.googleapis.com",
      "composer.googleapis.com",
      "datafusion.googleapis.com",
      "dlp.googleapis.com",
      "cloudfunctions.googleapis.com",
      "healthcare.googleapis.com",
      "cloudkms.googleapis.com",
      "logging.googleapis.com",
      "monitoring.googleapis.com",
      "cloudprofiler.googleapis.com",
      "spanner.googleapis.com",
      "sqladmin.googleapis.com",
      "storage.googleapis.com",
      "tpu.googleapis.com",
      "cloudtrace.googleapis.com",
      "vision.googleapis.com",
      "compute.googleapi.com",
      "containeranalysis.googleapis.com",
      "containerregistry.googleapis.com",
      "datacatalog.googleapis.com",
      "dataflow.googleapis.com",
      "dataproc.googleapis.com",
      "metastore.googleapis.com",
      "gameservices.googleapis.com",
      "container.googleapis.com",
      "gkeconnect.googleapis.com",
      "gkehub.googleapis.com",
      "iaptunnel.googleapis.com",
      "managedidentities.googleapis.com",
      "redis.googleapis.com",
      "language.googleapis.com",
      "oslogin.googleapis.com",
      "pubsub.googleapis.com",
      "pubsublite.googleapis.com",
      "cloudresourcemanager.googleapis.com",
      "secretmanager.googleapis.com",
      "vpcaccess.googleapis.com",
      "servicecontrol.googleapis.com",
      "servicedirectory.googleapis.com",
      "speech.googleapis.com",
      "storagetransfer.googleapis.com",
      "texttospeech.googleapis.com",
      "translate.googleapis.com",
      "videointelligence.googleapis.com",
      "osconfig.googleapis.com"
    ]

    # Below will need to be added later after you have deployed  necessary projects it will be referencing and
    # created the necessary access levels
    access_levels = [
      google_access_context_manager_access_level.allow_all_tf_service_accounts.id,
      #Uncomment line below after you've set up your org log sinks
      google_access_context_manager_access_level.org_sinks_service_accounts.id,
      #Comment line below in/out as you need to troubleshoot
      google_access_context_manager_access_level.allow_my_account.id
    ]

  }

  # The below is required so we can dynamically add new projects to perimeter
  # Without this block, if we create new projects and add them, this resource
  # will wipe out those additions and revert to whatever we list here
  lifecycle {
    ignore_changes = [status[0].resources]
  }

}

/******************************************
  Outputs
 *****************************************/

output "vpc_sc_perimeter_name" {
  value = google_access_context_manager_service_perimeter.service_perimeter_configuration.name
}