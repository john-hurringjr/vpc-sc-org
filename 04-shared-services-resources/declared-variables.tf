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
  Subnets
 *****************************************/

variable "subnet_region_1" {}
variable "subnet_region_1_prod_cidr" {}
variable "subnet_region_1_non_prod_cidr" {}

variable "subnet_region_2" {}
variable "subnet_region_2_prod_cidr" {}
variable "subnet_region_2_non_prod_cidr" {}

variable "shared_vpc_flow_log_interval" {}
variable "shared_vpc_flow_log_sampling" {}