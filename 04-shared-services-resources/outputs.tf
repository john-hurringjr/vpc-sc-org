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


/******************************************
  Restricted Subnets Prod
 *****************************************/
output "restricted_prod_vpc_subnet_1_region" {
  value = var.region_1
}

output "restricted_prod_vpc_subnet_1_name" {
  value = module.restricted_prod_vpc_subnet_1.subnet_name
}

output "restricted_prod_vpc_subnet_1_self_link" {
  value = module.restricted_prod_vpc_subnet_1.subnet_self_link
}

output "restricted_prod_vpc_subnet_1_id" {
  value = module.restricted_prod_vpc_subnet_1.subnet_id
}

output "restricted_prod_vpc_subnet_2_region" {
  value = var.region_2
}

output "restricted_prod_vpc_subnet_2_name" {
  value = module.restricted_prod_vpc_subnet_2.subnet_name
}

output "restricted_prod_vpc_subnet_2_self_link" {
  value = module.restricted_prod_vpc_subnet_2.subnet_self_link
}

output "restricted_prod_vpc_subnet_2_id" {
  value = module.restricted_prod_vpc_subnet_2.subnet_id
}

/******************************************
  Restricted Subnets Non Prod
 *****************************************/
output "restricted_non_prod_vpc_subnet_1_region" {
  value = var.region_1
}

output "restricted_non_prod_vpc_subnet_1_name" {
  value = module.restricted_non_prod_vpc_subnet_1.subnet_name
}

output "restricted_non_prod_vpc_subnet_1_self_link" {
  value = module.restricted_non_prod_vpc_subnet_1.subnet_self_link
}

output "restricted_non_prod_vpc_subnet_1_id" {
  value = module.restricted_non_prod_vpc_subnet_1.subnet_id
}

output "restricted_non_prod_vpc_subnet_2_region" {
  value = var.region_2
}

output "restricted_non_prod_vpc_subnet_2_name" {
  value = module.restricted_non_prod_vpc_subnet_2.subnet_name
}

output "restricted_non_prod_vpc_subnet_2_self_link" {
  value = module.restricted_non_prod_vpc_subnet_2.subnet_self_link
}

output "restricted_non_prod_vpc_subnet_2_id" {
  value = module.restricted_non_prod_vpc_subnet_2.subnet_id
}

/******************************************
  Private Subnets Prod
 *****************************************/
output "private_prod_vpc_subnet_1_region" {
  value = var.region_1
}

output "private_prod_vpc_subnet_1_name" {
  value = module.private_prod_vpc_subnet_1.subnet_name
}

output "private_prod_vpc_subnet_1_self_link" {
  value = module.private_prod_vpc_subnet_1.subnet_self_link
}

output "private_prod_vpc_subnet_1_id" {
  value = module.private_prod_vpc_subnet_1.subnet_id
}

output "private_prod_vpc_subnet_2_region" {
  value = var.region_2
}

output "private_prod_vpc_subnet_2_name" {
  value = module.private_prod_vpc_subnet_2.subnet_name
}

output "private_prod_vpc_subnet_2_self_link" {
  value = module.private_prod_vpc_subnet_2.subnet_self_link
}

output "private_prod_vpc_subnet_2_id" {
  value = module.private_prod_vpc_subnet_2.subnet_id
}

/******************************************
  Private Subnets Non Prod
 *****************************************/
output "private_non_prod_vpc_subnet_1_region" {
  value = var.region_1
}

output "private_non_prod_vpc_subnet_1_name" {
  value = module.private_non_prod_vpc_subnet_1.subnet_name
}

output "private_non_prod_vpc_subnet_1_self_link" {
  value = module.private_non_prod_vpc_subnet_1.subnet_self_link
}

output "private_non_prod_vpc_subnet_1_id" {
  value = module.private_non_prod_vpc_subnet_1.subnet_id
}

output "private_on_prod_vpc_subnet_2_region" {
  value = var.region_2
}

output "private_non_prod_vpc_subnet_2_name" {
  value = module.private_non_prod_vpc_subnet_2.subnet_name
}

output "private_non_prod_vpc_subnet_2_self_link" {
  value = module.private_non_prod_vpc_subnet_2.subnet_self_link
}

output "private_non_prod_vpc_subnet_2_id" {
  value = module.private_non_prod_vpc_subnet_2.subnet_id
}