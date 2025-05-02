

terraform {
    backend "s3" {
    # providing backend details to store the state file in the S3
     bucket = "backend-s3-bucket"
     region = "us-east-1"
     key = "backend/terraform.tfstate"

     # providing the lock details
     dynamdb_table = "terraform_lock"

    }
}