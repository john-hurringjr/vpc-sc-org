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

/*
  In order to connect from your on prem gce VM to a VM inside of your test
  projects (retricted or private), you'll most likely want to just run
  gcloud compute ssh. However, if you do not want to sign in and authn to the
  on prem GCE vm, then you'll need the service account that the gce on prem vm
  is running as to have permission to SSH to any VM in your test org. This is
  why we've authorized our on prem gcp org.
*/

/******************************************

 *****************************************/