# Terraform modules ![GitHub Release](https://img.shields.io/github/v/release/Filicipa/terraform_modules)

1. EC2 instance with security group and with EIP 
2. EC2 instance with security group and without EIP
3. EBS volume
4. VPC and subnets
5. Amplify
6. ECS cluster
7. ECS task definition
8. ECS service
9. IAM user
10. IAM role
11. ECR registry
12. ACM (Certificate manager)
13. RDS
14. Load Balancer with target group

Added bash scripts for install docker, mongoDB and auto mount AWS Ebs volume for t3.* instances via "user_data"

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.0 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_amplify"></a> [amplify](#module\_amplify) | git@github.com:Filicipa/terraform_modules.git//aws_amplify | v1.5.0 |
| <a name="module_certificate_manager"></a> [certificate\_manager](#module\_certificate\_manager) | git@github.com:Filicipa/terraform_modules.git//aws_certificate_manager | v1.5.0 |
| <a name="module_ebs_volume"></a> [ebs\_volume](#module\_ebs\_volume) | git@github.com:Filicipa/terraform_modules.git//aws_ebs | v1.5.0 |
| <a name="module_ecr-repo"></a> [ecr-repo](#module\_ecr-repo) | git@github.com:filatov0120/terraform_modules.git//aws_ecr | v1.5.0 |
| <a name="module_ecs-service"></a> [ecs-service](#module\_ecs-service) | git@github.com:Filicipa/terraform_modules.git//aws_ecs_service | v1.5.0 |
| <a name="module_ecs-weway-cluster"></a> [ecs-weway-cluster](#module\_ecs-weway-cluster) | git@github.com:Filicipa/terraform_modules.git//aws_inctance | v1.5.0 |
| <a name="module_elasticache"></a> [elasticache](#module\_elasticache) | git@github.com:Filicipa/terraform_modules.git//aws_elasticache | v1.5.0 |
| <a name="module_iam_role"></a> [iam\_role](#module\_iam\_role) | git@github.com:Filicipa/terraform_modules.git//aws_iam_role | v1.5.0 |
| <a name="module_iam_user"></a> [iam\_user](#module\_iam\_user) | git@github.com:Filicipa/terraform_modules.git//aws_iam_user | v1.5.0 |
| <a name="module_load_balancer"></a> [load\_balancer](#module\_load\_balancer) | git@github.com:Filicipa/terraform_modules.git//aws_loadbalancer | v1.5.0 |
| <a name="module_rds_postgres"></a> [rds\_postgres](#module\_rds\_postgres) | git@github.com:Filicipa/terraform_modules.git//aws_rds | v1.5.0 |
| <a name="module_task-definition"></a> [task-definition](#module\_task-definition) | git@github.com:Filicipa/terraform_modules.git//aws_task_definition | v1.5.0 |
| <a name="module_test_server"></a> [test\_server](#module\_test\_server) | git@github.com:Filicipa/terraform_modules.git//aws_inctance | v1.5.0 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | git@github.com:Filicipa/terraform_modules.git//aws_vpc | v1.5.0 |

## Resources

| Name | Type |
|------|------|
| [aws_ami.ubuntu_server](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |
| [terraform_remote_state.shared](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_token"></a> [access\_token](#input\_access\_token) | GitHub access\_token | `string` | n/a | yes |
| <a name="input_allocated_storage"></a> [allocated\_storage](#input\_allocated\_storage) | Storage amount GB | `string` | `"20"` | no |
| <a name="input_allow_major_version_upgrade"></a> [allow\_major\_version\_upgrade](#input\_allow\_major\_version\_upgrade) | Allow major version upgrade | `bool` | `false` | no |
| <a name="input_app_name"></a> [app\_name](#input\_app\_name) | n/a | `string` | n/a | yes |
| <a name="input_apply_immediately"></a> [apply\_immediately](#input\_apply\_immediately) | Apply immediately | `bool` | `false` | no |
| <a name="input_backend_domain_name"></a> [backend\_domain\_name](#input\_backend\_domain\_name) | n/a | `string` | n/a | yes |
| <a name="input_backend_environment_variables"></a> [backend\_environment\_variables](#input\_backend\_environment\_variables) | n/a | `map(string)` | n/a | yes |
| <a name="input_backup_retention_period"></a> [backup\_retention\_period](#input\_backup\_retention\_period) | Backup retention period | `string` | `"3"` | no |
| <a name="input_branch_name"></a> [branch\_name](#input\_branch\_name) | n/a | `string` | n/a | yes |
| <a name="input_build_spec"></a> [build\_spec](#input\_build\_spec) | n/a | `string` | n/a | yes |
| <a name="input_cidr_vpc"></a> [cidr\_vpc](#input\_cidr\_vpc) | CIDR block for VPC | `string` | `"192.168.0.0/16"` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Created cluster name | `string` | n/a | yes |
| <a name="input_cpu"></a> [cpu](#input\_cpu) | n/a | `number` | n/a | yes |
| <a name="input_custom_rules"></a> [custom\_rules](#input\_custom\_rules) | n/a | <pre>list(object({<br/>    source    = string<br/>    status    = string<br/>    target    = string<br/>    condition = string<br/>  }))</pre> | n/a | yes |
| <a name="input_db_name"></a> [db\_name](#input\_db\_name) | Created db name | `string` | n/a | yes |
| <a name="input_db_port"></a> [db\_port](#input\_db\_port) | DB open port | `string` | n/a | yes |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | Deletion protection | `bool` | `false` | no |
| <a name="input_desired_count"></a> [desired\_count](#input\_desired\_count) | n/a | `number` | n/a | yes |
| <a name="input_dns_prefix_branch"></a> [dns\_prefix\_branch](#input\_dns\_prefix\_branch) | n/a | `string` | n/a | yes |
| <a name="input_ebs_name"></a> [ebs\_name](#input\_ebs\_name) | EBS name | `string` | `"/dev/sdf"` | no |
| <a name="input_ecr_repository_name"></a> [ecr\_repository\_name](#input\_ecr\_repository\_name) | n/a | `string` | n/a | yes |
| <a name="input_engine"></a> [engine](#input\_engine) | Cluster engine | `string` | `"redis"` | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | Engine version | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | Environment | `string` | `"dev"` | no |
| <a name="input_force_delete"></a> [force\_delete](#input\_force\_delete) | n/a | `bool` | n/a | yes |
| <a name="input_framework"></a> [framework](#input\_framework) | n/a | `string` | n/a | yes |
| <a name="input_frontend_domain_name"></a> [frontend\_domain\_name](#input\_frontend\_domain\_name) | n/a | `string` | n/a | yes |
| <a name="input_frontend_environment_variables"></a> [frontend\_environment\_variables](#input\_frontend\_environment\_variables) | n/a | `map(string)` | n/a | yes |
| <a name="input_github_repository"></a> [github\_repository](#input\_github\_repository) | GitHub repositoty URL | `string` | n/a | yes |
| <a name="input_health_check_path"></a> [health\_check\_path](#input\_health\_check\_path) | n/a | `string` | n/a | yes |
| <a name="input_iam_role_name"></a> [iam\_role\_name](#input\_iam\_role\_name) | IAM role name | `string` | n/a | yes |
| <a name="input_iam_user"></a> [iam\_user](#input\_iam\_user) | IAM user name | `string` | n/a | yes |
| <a name="input_image_tag_mutability"></a> [image\_tag\_mutability](#input\_image\_tag\_mutability) | n/a | `string` | n/a | yes |
| <a name="input_inst1_name"></a> [inst1\_name](#input\_inst1\_name) | Name for instances | `string` | `"test"` | no |
| <a name="input_inst2_name"></a> [inst2\_name](#input\_inst2\_name) | Name for instances | `string` | `""` | no |
| <a name="input_inst3_name"></a> [inst3\_name](#input\_inst3\_name) | Name for instances | `string` | `""` | no |
| <a name="input_inst4_name"></a> [inst4\_name](#input\_inst4\_name) | Name for instances | `string` | `""` | no |
| <a name="input_instance_class"></a> [instance\_class](#input\_instance\_class) | Instance\_class | `string` | `"db.t4g.micro"` | no |
| <a name="input_loadbalancer_name"></a> [loadbalancer\_name](#input\_loadbalancer\_name) | n/a | `string` | n/a | yes |
| <a name="input_loadbalancer_type"></a> [loadbalancer\_type](#input\_loadbalancer\_type) | n/a | `string` | n/a | yes |
| <a name="input_max_allocated_storage"></a> [max\_allocated\_storage](#input\_max\_allocated\_storage) | Autoscale storage amount | `string` | `"0"` | no |
| <a name="input_memory"></a> [memory](#input\_memory) | n/a | `number` | n/a | yes |
| <a name="input_monitoring_interval"></a> [monitoring\_interval](#input\_monitoring\_interval) | Monitoring interval | `string` | `"0"` | no |
| <a name="input_multi_az"></a> [multi\_az](#input\_multi\_az) | multi\_az | `bool` | `false` | no |
| <a name="input_nat_create"></a> [nat\_create](#input\_nat\_create) | Is create a NAT Gateway? | `bool` | `false` | no |
| <a name="input_node_type"></a> [node\_type](#input\_node\_type) | Node type | `string` | n/a | yes |
| <a name="input_num_cache_nodes"></a> [num\_cache\_nodes](#input\_num\_cache\_nodes) | Node count | `string` | n/a | yes |
| <a name="input_parameter_group_name"></a> [parameter\_group\_name](#input\_parameter\_group\_name) | Parameter group name | `string` | `"default.postgres14"` | no |
| <a name="input_password"></a> [password](#input\_password) | Password for master username | `string` | n/a | yes |
| <a name="input_private_subnet_cidrs"></a> [private\_subnet\_cidrs](#input\_private\_subnet\_cidrs) | Public subnet CIDRs | `list(string)` | <pre>[<br/>  "192.168.21.0/24",<br/>  "192.168.22.0/24"<br/>]</pre> | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Project name | `string` | n/a | yes |
| <a name="input_public_subnet_cidrs"></a> [public\_subnet\_cidrs](#input\_public\_subnet\_cidrs) | Public subnet CIDRs | `list(string)` | <pre>[<br/>  "192.168.11.0/24",<br/>  "192.168.12.0/24"<br/>]</pre> | no |
| <a name="input_publicly_accessible"></a> [publicly\_accessible](#input\_publicly\_accessible) | Publicly accessible | `bool` | `false` | no |
| <a name="input_rds_engine"></a> [rds\_engine](#input\_rds\_engine) | Engine type | `string` | `"postgres"` | no |
| <a name="input_rds_engine_version"></a> [rds\_engine\_version](#input\_rds\_engine\_version) | Engine\_version | `string` | `"14.8"` | no |
| <a name="input_redis_port"></a> [redis\_port](#input\_redis\_port) | Redis open port | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | AWS region | `string` | `"eu-central-1"` | no |
| <a name="input_scan_on_push"></a> [scan\_on\_push](#input\_scan\_on\_push) | n/a | `bool` | `false` | no |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | n/a | `string` | n/a | yes |
| <a name="input_sg_allow_tcp_ports"></a> [sg\_allow\_tcp\_ports](#input\_sg\_allow\_tcp\_ports) | n/a | `list(string)` | n/a | yes |
| <a name="input_skip_final_snapshot"></a> [skip\_final\_snapshot](#input\_skip\_final\_snapshot) | Skip final snapshot | `bool` | n/a | yes |
| <a name="input_ssh_key"></a> [ssh\_key](#input\_ssh\_key) | SSH key pair for instances | `string` | `"test_key"` | no |
| <a name="input_stage"></a> [stage](#input\_stage) | n/a | `string` | n/a | yes |
| <a name="input_storage_type"></a> [storage\_type](#input\_storage\_type) | Storage type | `string` | `"gp3"` | no |
| <a name="input_target_group_name"></a> [target\_group\_name](#input\_target\_group\_name) | n/a | `string` | n/a | yes |
| <a name="input_target_type"></a> [target\_type](#input\_target\_type) | Type of target group instance or ip | `string` | n/a | yes |
| <a name="input_task_name"></a> [task\_name](#input\_task\_name) | n/a | `string` | n/a | yes |
| <a name="input_username"></a> [username](#input\_username) | Master username | `string` | n/a | yes |
| <a name="input_validation_method"></a> [validation\_method](#input\_validation\_method) | n/a | `string` | `"DNS"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_DNS_backend_server"></a> [DNS\_backend\_server](#output\_DNS\_backend\_server) | DNS for backend\_server |
| <a name="output_EIP_backend_server"></a> [EIP\_backend\_server](#output\_EIP\_backend\_server) | EIP for backend\_server |
| <a name="output_Redis"></a> [Redis](#output\_Redis) | n/a |
| <a name="output_alb_dns"></a> [alb\_dns](#output\_alb\_dns) | The DNS name of the load balancer |
| <a name="output_amplify_cloud_front_dns_record"></a> [amplify\_cloud\_front\_dns\_record](#output\_amplify\_cloud\_front\_dns\_record) | DNS record for the subdomain |
| <a name="output_amplify_default_domain"></a> [amplify\_default\_domain](#output\_amplify\_default\_domain) | Default domain for the Amplify app |
| <a name="output_amplify_verification_dns_record"></a> [amplify\_verification\_dns\_record](#output\_amplify\_verification\_dns\_record) | The DNS record for certificate verification |
| <a name="output_ecr_url"></a> [ecr\_url](#output\_ecr\_url) | The URL of the repository (in the form aws\_account\_id.dkr.ecr.region.amazonaws.com/repositoryName) |
| <a name="output_iam_role_arn"></a> [iam\_role\_arn](#output\_iam\_role\_arn) | n/a |
| <a name="output_public_subnet_ids"></a> [public\_subnet\_ids](#output\_public\_subnet\_ids) | Prublic subnet IDs |
| <a name="output_vpc_cidr"></a> [vpc\_cidr](#output\_vpc\_cidr) | VPC CIDR |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | VPC id |
<!-- END_TF_DOCS -->
