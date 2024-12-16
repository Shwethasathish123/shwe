resource "aws_instance" "app_ec2" {
  ami                    = "ami-0327f51db613d7bd2"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.subnet1.id
  key_name               = "devops_batch"
  vpc_security_group_ids = [aws_security_group.sc1.id]
  user_data              = <<-EOF
  #!/bin/bash
  cat << SCRIPT > /home/ec2-user/script.sh
  sudo yum update -y
  sudo yum install httpd -y
  sudo systemctl start httpd
  sudo systemctl enable httpd
  SCRIPT
    chmod +x /home/ec2-user/script.sh
    sh /home/ec2-user/script.sh
    EOF

  tags = {
    Name = "app_ec2"
  }
}