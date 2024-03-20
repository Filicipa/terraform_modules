# Terraform modules ![GitHub release (with filter)](https://img.shields.io/github/v/release/Filicipa/terraform_modules)

1. EC2 instance with security group and with EIP 
2. EC2 instance with security group and without EIP
3. EBS volume
4. VPC and subnets
5. Amplify
6. ECS cluster
7. ECS task definition
8. ECS service
9. IAM user
10. ECR registry
11. ACM (Certificate manager)
12. RDS
13. Load Balancer with target group

Added bash scripts for install docker, mongoDB and auto mount AWS Ebs volume for t3.* instances via "user_data"

<!-- BEGIN_TF_DOCS -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

### Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.0 |

### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ebs_volume"></a> [ebs\_volume](#module\_ebs\_volume) | git@github.com:Filicipa/terraform_modules.git//aws_ebs | v1.2.0 |
| <a name="module_rds_postgres"></a> [rds\_postgres](#module\_rds\_postgres) | ./aws_rds | n/a |
| <a name="module_test_server"></a> [test\_server](#module\_test\_server) | git@github.com:Filicipa/terraform_modules.git//aws_inctance | v1.2.0 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | git@github.com:Filicipa/terraform_modules.git//aws_vpc | v1.2.0 |

### Resources

| Name | Type |
|------|------|
| [aws_ami.ubuntu_server](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allocated_storage"></a> [allocated\_storage](#input\_allocated\_storage) | Storage amount GB | `string` | `"20"` | no |
| <a name="input_allow_major_version_upgrade"></a> [allow\_major\_version\_upgrade](#input\_allow\_major\_version\_upgrade) | Allow major version upgrade | `bool` | `false` | no |
| <a name="input_apply_immediately"></a> [apply\_immediately](#input\_apply\_immediately) | Apply immediately | `bool` | `false` | no |
| <a name="input_backup_retention_period"></a> [backup\_retention\_period](#input\_backup\_retention\_period) | Backup retention period | `string` | `"3"` | no |
| <a name="input_cidr_vpc"></a> [cidr\_vpc](#input\_cidr\_vpc) | CIDR block for VPC | `string` | `"192.168.0.0/16"` | no |
| <a name="input_db_name"></a> [db\_name](#input\_db\_name) | Created db name | `string` | n/a | yes |
| <a name="input_db_port"></a> [db\_port](#input\_db\_port) | DB open port | `string` | n/a | yes |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | Deletion protection | `bool` | `false` | no |
| <a name="input_ebs_name"></a> [ebs\_name](#input\_ebs\_name) | EBS name | `string` | `"/dev/sdf"` | no |
| <a name="input_engine"></a> [engine](#input\_engine) | Engine type | `string` | `"postgres"` | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | Engine\_version | `string` | `"14.8"` | no |
| <a name="input_env"></a> [env](#input\_env) | Environment | `string` | `"dev"` | no |
| <a name="input_inst1_name"></a> [inst1\_name](#input\_inst1\_name) | Name for instances | `string` | `"test"` | no |
| <a name="input_inst2_name"></a> [inst2\_name](#input\_inst2\_name) | Name for instances | `string` | `""` | no |
| <a name="input_inst3_name"></a> [inst3\_name](#input\_inst3\_name) | Name for instances | `string` | `""` | no |
| <a name="input_inst4_name"></a> [inst4\_name](#input\_inst4\_name) | Name for instances | `string` | `""` | no |
| <a name="input_instance_class"></a> [instance\_class](#input\_instance\_class) | Instance\_class | `string` | `"db.t4g.micro"` | no |
| <a name="input_max_allocated_storage"></a> [max\_allocated\_storage](#input\_max\_allocated\_storage) | Autoscale stogage amount | `string` | `"0"` | no |
| <a name="input_monitoring_interval"></a> [monitoring\_interval](#input\_monitoring\_interval) | Monitoring interval | `string` | `"0"` | no |
| <a name="input_multi_az"></a> [multi\_az](#input\_multi\_az) | multi\_az | `bool` | `false` | no |
| <a name="input_nat_create"></a> [nat\_create](#input\_nat\_create) | Is create a NAT Gateway? | `bool` | `false` | no |
| <a name="input_parameter_group_name"></a> [parameter\_group\_name](#input\_parameter\_group\_name) | Parameter group name | `string` | `"default.postgres14"` | no |
| <a name="input_password"></a> [password](#input\_password) | Password for master username | `string` | n/a | yes |
| <a name="input_private_subnet_cidrs"></a> [private\_subnet\_cidrs](#input\_private\_subnet\_cidrs) | Public subnet CIDRs | `list(string)` | <pre>[<br>  "192.168.21.0/24",<br>  "192.168.22.0/24"<br>]</pre> | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Project name | `string` | n/a | yes |
| <a name="input_public_subnet_cidrs"></a> [public\_subnet\_cidrs](#input\_public\_subnet\_cidrs) | Public subnet CIDRs | `list(string)` | <pre>[<br>  "192.168.11.0/24",<br>  "192.168.12.0/24"<br>]</pre> | no |
| <a name="input_publicly_accessible"></a> [publicly\_accessible](#input\_publicly\_accessible) | Publicly accessible | `bool` | `false` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region | `string` | `"eu-central-1"` | no |
| <a name="input_skip_final_snapshot"></a> [skip\_final\_snapshot](#input\_skip\_final\_snapshot) | Skip final snapshot | `bool` | n/a | yes |
| <a name="input_ssh_key"></a> [ssh\_key](#input\_ssh\_key) | SSH key pair for instances | `string` | `"test_key"` | no |
| <a name="input_storage_type"></a> [storage\_type](#input\_storage\_type) | Storage type | `string` | `"gp3"` | no |
| <a name="input_username"></a> [username](#input\_username) | Master username | `string` | n/a | yes |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_DNS_backend_server"></a> [DNS\_backend\_server](#output\_DNS\_backend\_server) | DNS for backend\_server |
| <a name="output_EIP_backend_server"></a> [EIP\_backend\_server](#output\_EIP\_backend\_server) | EIP for backend\_server |
| <a name="output_public_subnet_ids"></a> [public\_subnet\_ids](#output\_public\_subnet\_ids) | Prublic subnet IDs |
| <a name="output_vpc_cidr"></a> [vpc\_cidr](#output\_vpc\_cidr) | VPC CIDR |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | VPC id |
<!-- END_TF_DOCS -->
