resource "aws_instance" "name" {
  ami             = "ami-0c614dee691cbbf37"
  key_name        = "Developer2"
  instance_type   = "t2.medium"
  security_groups = [ "default" ]
  user_data       = <<-EOF
                    #!/bin/bash
                    # Install Jenkins
                    sudo yum install java-17-amazon-corretto.x86_64 -y
                    sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
                    yum install wget -y
                    sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key 
                    sudo yum install jenkins -y
                    sudo systemctl enable jenkins
                    sudo systemctl start jenkins 
                    sleep 30
                    sudo systemctl status jenkins 
                    EOF
}

