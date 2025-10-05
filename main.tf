provider "aws" {
    region = var.aws_region
  
}

###########################VPC#########################

resource "aws_vpc" "my_vpc" {
    cidr_block = var.cidr_block
    instance_tenancy = "default"
    tags = {
     Name="my_vpc" 
    }
  
}

resource "aws_security_group" "jenkins_sg" {
    name = var.security_group
    description = "security group for jenkins"
    vpc_id = aws_vpc.my_vpc.id

    ingress = [
        for port in [22, 8080] : {
            from_port = port
            to_port   = port
            protocol = "tcp"
            cidr_blocks =["0.0.0.0/0"]
            
            
        }
        ]

    egress = [{
      description = "allow all outbound"
      from_port = 0
      to_port = 65535
      protocol = "tcp"
      cidr_block=["0.0.0.0/0"]

    }
    ]
    tags = {
      Name=var.security_group
    }


}




##################EC2-Instance##############################

resource "aws_instance" "jenkins-server" {
    ami = var.ami_id
    key_name = var.key_name
    instance_type = var.instance_type
    user_data = file("./jenkins-server.sh")
    vpc_security_group_ids = [aws_security_group.jenkins_sg.id]
    tags = {
      Name="var.tag_name"
    }
  
}




#################Create-Elastic-IP######################

resource "aws_eip" "jenkin_elastic_ip" {
    instance = aws_instance.jenkins-server.id
  
  tags = {
    Name="my_elastic_ip"
  }
}

