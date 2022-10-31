resource "aws_instance" "Ubuntu" {
    ami = "ami-08c40ec9ead489470"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.allow_tls.id]
    key_name = "vlad"

    user_data = <<EOT
#!/bin/bash
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update
sudo apt install -y openjdk-11-jdk
sudo apt install -y jenkins
sudo systemctl start jenkins


EOT
    tags ={
        Name = "Jenkins"  
    }
}
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"

  ingress {
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}