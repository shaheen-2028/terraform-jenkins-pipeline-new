resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install nginx -y
              systemctl start nginx
              systemctl enable nginx
              echo "<h1>Hello from Shaheen's Jenkins Pipeline 🚀</h1>" > /usr/share/nginx/html/index.html
              EOF

  tags = {
    Name = var.name_tag
  }
}