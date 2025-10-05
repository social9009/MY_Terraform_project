variable "aws_region" {
    description = "AWS region"
    default = "ap-south-1"
  
}

variable "cidr_block" {
    description = "vpc_cidr"
    default = "172.16.0.0/16"

}

variable "security_group" {
    description = "jenkins SG"
    default = "jenkins_SG"
  
}

variable "ami_id" {
    description = "AMI for instance"
    default = "ami-02d26659fd82cf299"
  
}

variable "key_name" {
    description = "SSH key to connect to ec2 instance"
    default = "jenkins-ap-south"
  
}

variable "instance_type" {
    description = "instance type"
    default = "t2.micro"
  
}
variable "tag_name" {
    description = "name of EC2"
    default = "my_EC2_instance"
  
}

variable "bucket_prefix" {
    description = "create a unique bucket name beginning with the specified prefix"
    type = string
    default = "my-s3bucket-"
  
}


variable "tags" {
    description = "map of tags to assign to bucket"
    default = {
        environment="Dev"
        terraform="true"
    }
  
}

variable "versioning" {
    description = "state of versioning"
    type = bool
    default = true
  
}

