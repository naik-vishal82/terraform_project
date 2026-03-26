output "apache-server" {
 	description = "Public IP address Apache Server"
  	value = aws_instance.apache-server.public_ip
}
output "pip-apache-server" {
 	description = "Private IP address Apache Server"
  	value = aws_instance.apache-server.private_ip
}
output "docker-server" {
 	description = "Public IP address Docker Server"
  	value = aws_instance.docker-server.public_ip
}
output "pip-docker-server" {
 	description = "Private IP address Docker Server"
  	value = aws_instance.docker-server.private_ip
}
output "nginx-server" {
 	description = "Public IP address Nginx Server"
  	value = aws_instance.nginx-server.public_ip
}
output "pip-nginx-server" {
 	description = "Private IP address nginx Server"
  	value = aws_instance.nginx-server.private_ip
}

