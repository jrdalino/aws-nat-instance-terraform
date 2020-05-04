resource "aws_instance" "nat-instance" {
  ami           = "ami-0ec225b5e01ccb706"
  # availability_zone
  # placement_group
  # tenancy
  # host_id
  # cpu_core_count
  # cpu_threads_per_core
  # ebs_optimized
  # disable_api_termination
  # instance_initiated_shutdown_behavior
  instance_type = "t3.micro"
  # key_name

  source_dest_check = false
  user_data = <<-EOF
        #! /bin/bash
        sudo yum update
        sysctl -w net.ipv4.ip_forward=1
        /sbin/iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
	EOF

  tags = {
    Name = "NAT Instance"
  }
}