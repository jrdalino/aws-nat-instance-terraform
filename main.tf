# NAT Instance A
resource "aws_instance" "nat-instance-a" {
  ami           = "ami-0003ce8d47722ef67" # amzn-ami-vpc-nat
  # availability_zone
  # placement_group
  # tenancy
  # host_id
  # cpu_core_count
  # cpu_threads_per_core
  # ebs_optimized = false
  # disable_api_termination = false
  # instance_initiated_shutdown_behavior
  instance_type = "t3.micro"
  # key_name
  # get_password_data = false
  # monitoring = false
  # security_groups
  vpc_security_group_ids = [aws_security_group.nat-instance-sg.id]
  subnet_id = "subnet-01ea56aa5f6a77c2d"
  associate_public_ip_address = true
  # private_ip
  source_dest_check = false
  # user_data
  # user_data_base64
  # iam_instance_profile
  # ipv6_address_count
  # ipv6_addresses
  # tags
  # volume_tags
  # root_blockd_device
  # ebs_block_device
  # ephemeral_block_device
  # network_interface
  # credit_specification
  # hibernation = false
  # metadata_options
}

# NAT Instance A
resource "aws_instance" "nat-instance-b" {
  ami           = "ami-0003ce8d47722ef67" # amzn-ami-vpc-nat
  # availability_zone
  # placement_group
  # tenancy
  # host_id
  # cpu_core_count
  # cpu_threads_per_core
  # ebs_optimized = false
  # disable_api_termination = false
  # instance_initiated_shutdown_behavior
  instance_type = "t3.micro"
  # key_name
  # get_password_data = false
  # monitoring = false
  # security_groups
  vpc_security_group_ids = [aws_security_group.nat-instance-sg.id]
  subnet_id = "subnet-0fb3995b8056dfe68"
  associate_public_ip_address = true
  # private_ip
  source_dest_check = false
  # user_data
  # user_data_base64
  # iam_instance_profile
  # ipv6_address_count
  # ipv6_addresses
  # tags
  # volume_tags
  # root_blockd_device
  # ebs_block_device
  # ephemeral_block_device
  # network_interface
  # credit_specification
  # hibernation = false
  # metadata_options
}

# Security Group
resource "aws_security_group" "nat-instance-sg" {
  name        = "nat-instance-sg"
  # name_prefix
  description = "NAT Instance Security Group"
  vpc_id      = "vpc-08aaa78fcaac1fd88"

  ingress {
    description = "Allow inbound HTTP traffic from servers in the private subnet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

   ingress {
    description = "Allow inbound HTTPS traffic from servers in the private subnet"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  ingress {
    description = "Allow inbound SSH access to the NAT instance from your home network (over the Internet gateway) "
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["219.74.92.53/32"] # my private ip
  }  

  egress {
    description = "Allow outbound HTTP access to the Internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow outbound HTTPS access to the Internet"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}