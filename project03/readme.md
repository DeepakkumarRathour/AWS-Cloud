
This is the 3rd Terraform project where i will work on the terraform WORKSPACE.

# TERRAFORM WORKSPACES

1. what is terraform workspace and what kind of problems it will solved.

2. how to create terrafoorm workspace and how to switch between the workspaces.

3. how to setup terraform workspaces for different environment in your organization.


Terraform Workspace isolate their state, so if you run "terraform plan" Terraform will not see any existing state for this configuration.



# To excute terraform with a particular tfvars file -->
  --  terraform apply -var-file=stage.tfvars


# To create a new terraform workspace environment  
  1. terraform workspace new dev     --> 
                       It will create the new terraform environment as "dev".
                       It will create the folder named as "terraform.tfstate.d" and inside this folder all environment that you create will stored here.

  2. terraform workspace new stage  --> create a new environment as stage inside the same folder named as "terraform.tfstate.d".
  3. terraform wirkspace new prod  --> create new environment as prod inside the same folder named as "terraform.tfstate.d".

# Switching between environment.  cmds are as below --
  terraform workspace select "environmentName"   
  --example-- 
             1. terraform workspace select dev
             2. terraform workspace select stage

# To show the present working environment  cmds are below --
  --example-- 
             1. terraform workspace show


When you run terraform apply the separate "terraform.tfstate" file will be created for separate environment, and this state file will not impact your other environments.


You can create a separate tfvars file as stage.tfvars, dev.tfvars, and prod.tfvars files to avoid overwritting the existing or main tfvars file, and these tfvars file you can create insdoe their respective environment.  
              ANOTHER METHOD IS THST.
 go to the main.tf  and use "map()" function or method.
  
 # You can use this map() and lookup() method to select one parameter based on the type of environment.
 /* --example--

   variable "instance_type" { 
    description = "value"
    type = map(string)
        default = {
        "dev" = "t2.micro"     # if the environment is dev then select the t2.micro instance
        "stage" = "t2.medium" # if the environment is stage then select the t2.medium instance
        "prod" = "t2xlarge"  # if the environment is prod then select the t2.xlarge instance
       }
  }
 

    module "ec2_instance" {
    source = "./modules/ec2_instance"
    ami = var.ami
    instance_type = lookup(instnace_type, terraform.workspace, t2.micro)
    }
  */
# Things in the lookup(inputMap dynamic, key string, __default dynamic) method                 
    1) instance_type -->       The value it has to lookup.   
    2)  terraform workspace --> If you are in the stage workspace or environment then this value will be resolved in stage, means 
                                         depends on the environment you are in, in the excution it will resolve the "terraform.workspace" into that environment.
    3) t2.micro -->    It is the default. if there is no environment then it will automatically take default value that you are provided. 




               
  