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
  Outputs
 *****************************************/

output "subnet_1_region" {
  value = var.region_1_subnet_1_prod
}

output "subnet_1_prod_name" {
  value = module.prod_vpc_region_1_subnet_1.subnet_name
}

output "subnet_1_non_prod_name" {
  value = module.non_prod_vpc_region_1_subnet_1.subnet_name
}

output "subnet_2_region" {
  value = var.subnet_region_2
}

output "subnet_2_prod_name" {
  value = module.prod_vpc_region_2_subnet_1.subnet_name
}

output "subnet_2_prod_name" {
  value = module.non_prod_vpc_region_2_subnet_1.subnet_name
}