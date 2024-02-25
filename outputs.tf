# Terraform output file

# Output the name of the ami
output "ami_name" {
  description = "The name of the AMI"
  value       = data.aws_ami.amazon_linux_2.name
}

# Output the url of the server
output "ec2_public_ipv4_url" {
  value = join("", ["http://", aws_instance.ec2_instance.public_ip])
}
