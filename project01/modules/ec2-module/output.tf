
output "public-ip-address" {
    
    value = aws_instance.resource01.public_ip
  
}