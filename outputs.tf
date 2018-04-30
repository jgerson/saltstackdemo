output "next steps" {
  value = "The NGINX Web Server is now available at http://${aws_eip.demo.public_ip}"
}
