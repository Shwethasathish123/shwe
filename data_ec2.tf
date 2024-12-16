resource "aws_instance" "data_ec2" {
  ami                    = "ami-0327f51db613d7bd2"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.subnet2.id
  key_name               = "devops_batch"
  vpc_security_group_ids = [aws_security_group.sc1.id]
  tags = {
    Name = "data_ec2"
  }

}