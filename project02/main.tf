
# we mention the provider as AWS and region as us-east-1
provider "aws" {
    region = "us-east-1"
}


# this will create the aws ec2 instance
resource "aws_instance" "resource01" {
    instance_type = "t2.micro"
    ami = "ami-053b0d53c279acc90"
    subnet_id = "subnet-019ea91ed9b5257e7" 
}

# this will create the aws s3 bucket to store the state file.
resource "aws_s3_bucket" "s3_bucket" {
    bucket = "backend-s3-bucket"
}

resource "aws_dynamodb_table" "terraform_lock"{
    name = "terraform-lock"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"

    attribute {
        name = "LockID"
        type = "S" //type of the lock id , that is string here.
    }
}



