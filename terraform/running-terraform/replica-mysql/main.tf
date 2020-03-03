provider "aws" {
  region = "us-east-1"
}

terraform {
backend "s3" {
  bucket         = "asg-lb"
  key            = "asg-lb/rds.tfstate"
  region         = "us-east-1"
 }
}

####################################
# Variables common to both instnaces
####################################
locals {
  engine            = "mysql"
  engine_version    = "5.7.19"
  major_engine_version = "5.7"
  instance_class    = "db.t2.large"
  allocated_storage = 5
  port              = "3306"
}

###########
# Master DB
###########
module "master" {
  source = "../module/rds"

  identifier = "demodb-master-mysql"

  engine            = local.engine
  engine_version    = local.engine_version
  major_engine_version    = local.major_engine_version
  instance_class    = local.instance_class
  allocated_storage = local.allocated_storage

  name     = "consumerdb"
  username = "admin"
  password = "rootroot"
  port     = local.port

  vpc_security_group_ids = ["sg-0195c773fbba79bd4","sg-05562ebf1cd71fcdc"]

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  multi_az = true

  # Backups are required in order to create a replica
  backup_retention_period = 1

  # DB subnet group
  subnet_ids = ["subnet-006294c01260d0d47","subnet-03117a6d6b2bc3fca","subnet-0d2657d6ee3786750"]

  create_db_option_group    = false
  create_db_parameter_group = false
}

############
# Replica DB
############
module "replica" {
  source = "../module/rds"

  identifier = "consumerdb-replica-mysql"

  # Source database. For cross-region use this_db_instance_arn
  replicate_source_db = module.master.this_db_instance_id

  engine            = local.engine
  engine_version    = local.engine_version
  major_engine_version    = local.major_engine_version
  instance_class    = local.instance_class
  allocated_storage = local.allocated_storage

  # Username and password should not be set for replicas
  username = ""
  password = ""
  port     = local.port

  #vpc_security_group_ids = [data.aws_security_group.default.id]
  vpc_security_group_ids = ["sg-0195c773fbba79bd4","sg-05562ebf1cd71fcdc"]

  maintenance_window = "Tue:00:00-Tue:03:00"
  backup_window      = "03:00-06:00"

  multi_az = false

  # disable backups to create DB faster
  backup_retention_period = 0

  # Not allowed to specify a subnet group for replicas in the same region
  create_db_subnet_group = false

  create_db_option_group    = false
  create_db_parameter_group = false
}
