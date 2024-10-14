/**
 * Copyright 2023 Google LLC
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

ax_region = "us-west1"

project_id = "<gcp_project_id>"

#project_parent = "folders/<folder_id>" # Or "organizations<organization_id>".

project_create = false

billing_account = "<billing_account_id>"

apigee_instances_metadata = {
  usw1-instance = {
    apigee_instances = {
      region       = "us-west1"
      ip_range     = "10.103.0.0/22,10.104.0.0/28"
      environments = ["test1", "test2"]
    }
    l7_ilb_proxy_subnet_name       = "l7ilb-proxy-sbnt-usw1"
    l7_ilb_proxy_subnet_cidr_range = "10.150.0.0/24"
    l7_ilb_name_prefix             = "l7ilb-psc-usw1"
  }
  usc1-instance = {
    apigee_instances = {
      region       = "us-central1"
      ip_range     = "10.103.8.0/22,10.104.0.32/28"
      environments = ["test1", "test2"]
    }
    l7_ilb_proxy_subnet_name       = "l7ilb-proxy-sbnt-usc1"
    l7_ilb_proxy_subnet_cidr_range = "10.152.0.0/24"
    l7_ilb_name_prefix             = "l7ilb-psc-usc1"
  }
}

apigee_environments = {
  test1 = {
    display_name = "Test 1"
    description  = "Environment created by apigee/terraform-modules"
    node_config  = null
    iam          = null
    envgroups    = ["test"]
    type         = "COMPREHENSIVE"
  }
  test2 = {
    display_name = "Test 2"
    description  = "Environment created by apigee/terraform-modules"
    node_config  = null
    iam          = null
    envgroups    = ["test"]
    type         = "COMPREHENSIVE"
  }
}

apigee_envgroups = {
  test = {
    hostnames = ["test.api.example.com"]
  }
}

network = "apigee-network"

psc_ingress_network = "psc-ingress"

psc_ingress_subnets = [
  {
    name               = "apigee-psc-usw1"
    ip_cidr_range      = "10.101.0.0/24"
    region             = "us-west1"
    secondary_ip_range = null
  },
  {
    name               = "apigee-psc-usc1"
    ip_cidr_range      = "10.102.0.0/24"
    region             = "us-central1"
    secondary_ip_range = null
  }
]

peering_range = "10.103.0.0/20"
support_range = "10.104.0.0/26"
