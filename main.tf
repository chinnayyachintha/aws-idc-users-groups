module "idc_users_and_groups" {
  source  = "aws-samples/identity-center-users-and-groups/aws"
  version = "1.0.0"
  groups  = "./groups.yml"
  users   = "./users.yml"
}