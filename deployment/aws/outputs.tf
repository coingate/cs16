output "private_ip" {
  description = "The private IP of the EC2 instance"
  value       = "${aws_instance.cs16.private_ip}"
}

output "public_ip" {
  description = "The public IP of the EC2 instance"
  value       = "${aws_eip.server_ip.public_ip}"
}