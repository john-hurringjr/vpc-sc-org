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
Feel free to change the variables below as needed/wanted
*/

/******************************************
  Subnets Prod
 *****************************************/

prod_vpc_subnet_1_region  = "us-east4"
prod_vpc_subnet_1_cidr    = "10.0.0.0/19"

prod_vpc_subnet_2_region = "us-central1"
prod_vpc_subnet_2_cidr = "10.128.0.0/19"

prod_vpc_flow_log_interval = "INTERVAL_5_MIN"
prod_vpc_flow_log_sampling = 0.8

/******************************************
  Subnets Non-Prod
 *****************************************/
non_prod_vpc_subnet_1_region = "us-east4"
non_prod_vpc_subnet_1_cidr = "172.16.0.0/19"

non_prod_vpc_subnet_2_region = "us-central1"
non_prod_vpc_subnet_2_cidr = "172.24.0.0/19"

non_prod_vpc_flow_log_interval = "INTERVAL_15_MIN"
non_prod_vpc_flow_log_sampling = 0.2