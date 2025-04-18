
provider "aws" {
    alias = "us-east-1"
    region = "us-east-1"
}

provider "aws" {
    alias = "us-west-2"
    region = "us-west-2"
}

resource "aws_instance "server1" {
    ami= "ami-0123456789abcdef0"
    instance_type="t2.micro"
    provider="aws.us-east-1"
}

resource "aws_instance" "server2"{
    ami="ami-0123456789abcdef2"
    instance_type = "t2.micro"
    provider = "aws.us-west-2"
}