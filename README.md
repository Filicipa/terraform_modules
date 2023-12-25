# Terraform modules and example user_data files
![GitHub release (with filter)](https://img.shields.io/github/v/release/Filicipa/terraform_modules)
<br>

- EC2 instance with security group and with EIP 
- EC2 instance with security group and without EIP
- EBS volume
- VPC and subnet

Added bash scripts for install docker, mongoDB and auto mount AWS Ebs volume for t3.* instances via "user_data"

<!-- BEGIN_TF_DOCS -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.16 |

### Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.16 |

### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ebs_volume"></a> [ebs\_volume](#module\_ebs\_volume) | git@github.com:Filicipa/terraform_modules.git//aws_ebs | n/a |
| <a name="module_test_server"></a> [test\_server](#module\_test\_server) | git@github.com:Filicipa/terraform_modules.git//aws_instance | n/a |
| <a name="module_vpc-terraform"></a> [vpc-terraform](#module\_vpc-terraform) | git@github.com:Filicipa/terraform_modules.git//aws_vpc | n/a |

### Resources

| Name | Type |
|------|------|
| [aws_ami.ubuntu_server](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami_ubuntu_22_04"></a> [ami\_ubuntu\_22\_04](#input\_ami\_ubuntu\_22\_04) | ami\_ubuntu\_22.04 | `string` | `"ami-0ec7f9846da6b0f61"` | no |
| <a name="input_cidr_vpc"></a> [cidr\_vpc](#input\_cidr\_vpc) | CIDR block for VPC | `string` | `"192.168.0.0/16"` | no |
| <a name="input_ebs_name"></a> [ebs\_name](#input\_ebs\_name) | EBS name | `string` | `"/dev/sdf"` | no |
| <a name="input_env"></a> [env](#input\_env) | Name of env | `string` | `"dev"` | no |
| <a name="input_inst1_name"></a> [inst1\_name](#input\_inst1\_name) | Name for instances | `string` | `"test"` | no |
| <a name="input_inst2_name"></a> [inst2\_name](#input\_inst2\_name) | Name for instances | `string` | `""` | no |
| <a name="input_inst3_name"></a> [inst3\_name](#input\_inst3\_name) | Name for instances | `string` | `""` | no |
| <a name="input_inst4_name"></a> [inst4\_name](#input\_inst4\_name) | Name for instances | `string` | `""` | no |
| <a name="input_proj_name"></a> [proj\_name](#input\_proj\_name) | Name of project | `string` | `"test"` | no |
| <a name="input_public_subnet_cidrs"></a> [public\_subnet\_cidrs](#input\_public\_subnet\_cidrs) | Public subnet CIDRs | `list` | <pre>[<br>  "192.168.11.0/24"<br>]</pre> | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region | `string` | `"us-east-1"` | no |
| <a name="input_ssh_key"></a> [ssh\_key](#input\_ssh\_key) | SSH key pair for instances | `string` | `"test-key"` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_DNS_backend_server"></a> [DNS\_backend\_server](#output\_DNS\_backend\_server) | DNS for backend\_server |
| <a name="output_EIP_backend_server"></a> [EIP\_backend\_server](#output\_EIP\_backend\_server) | EIP for backend\_server |
| <a name="output_public_subnet_ids"></a> [public\_subnet\_ids](#output\_public\_subnet\_ids) | Prublic subnet IDs |
| <a name="output_vpc_cidr"></a> [vpc\_cidr](#output\_vpc\_cidr) | VPC CIDR |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | VPC id |
<!-- END_TF_DOCS -->