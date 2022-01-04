provider "aws" {
    region = "us-east-1"
    access_key = "AKIAVI5KGKVD26Y72BVN"
    secret_key = "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"
}

module "my_vpc"{
    source = "./module_vpc"
    vpc_cidr = "192.168.0.0/16"
    tenancy = "default"
    vpc_id = "${module.my_vpc.vpc_id}"
    subnet_cidr = "192.168.1.0/24"
}

module "my_ec2"{
    source = "./module_ec2"
}