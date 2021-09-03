# CLOUD ENGINEERS
module "cloud_engineers" {
  source = "git@github.com:mackah666/terragrunt-test-modules.git//iam-group?ref=v1.2.0"

  iam_group_name     = "cloud-engineers"
  policy_name        = "cloud-engineers"
  policy_description = "Cloud Engineers policy"
  policy             = data.aws_iam_policy_document.cloud_engineers.json
}

# DEVELOPERS
module "developers" {
  source = "git@github.com:mackah666/terragrunt-test-modules.git//iam-group?ref=v1.2.0"

  iam_group_name     = "developers"
  policy_name        = "developers"
  policy_description = "Developers policy"
  policy             = data.aws_iam_policy_document.developers.json
}

# DATABASE ADMINS
module "database_admins" {
  source = "git@github.com:mackah666/terragrunt-test-modules.git//iam-group?ref=v1.2.0"

  iam_group_name     = "database-admins"
  policy_name        = "database-admins"
  policy_description = "Database Admins policy"
  policy             = data.aws_iam_policy_document.database_admins.json
}

# NETWORK ADMINS
# Modules creates group and policy and attaches policy to group. 
module "network_admins" {
  source = "git@github.com:mackah666/terragrunt-test-modules.git//iam-group?ref=v1.2.0"

  iam_group_name     = "network-admins"
  policy_name        = "network-admins"
  policy_description = "Network Admins policy"
  policy             = data.aws_iam_policy_document.network_admins_main.json
}
# Create the network admins misc policy 
resource "aws_iam_policy" "network_admins_misc" {
  name        = "network-admins-misc"
  description = "Network Admins"
  policy      = data.aws_iam_policy_document.network_admins_misc.json
}
# Attach the above policy to the network admins group. 
resource "aws_iam_group_policy_attachment" "network_admins_misc" {
  group      = "network-admins"
  policy_arn = aws_iam_policy.network_admins_misc.arn

  depends_on = [aws_iam_policy.network_admins_misc]
}

# DEVOPS ENGINEERS
# Modules creates group and policy and attaches policy to group. 
module "devops_engineers" {
  source = "git@github.com:mackah666/terragrunt-test-modules.git//iam-group?ref=v1.2.0"

  iam_group_name     = "devops-engineers"
  policy_name        = "devops-engineers"
  policy_description = "Devops Engineers policy"
  policy             = data.aws_iam_policy_document.devops_engineers_main.json
}
# Create the network admins misc policy 
resource "aws_iam_policy" "devops_engineers_misc" {
  name        = "devops-engineers-misc"
  description = "Devops Engineers"
  policy      = data.aws_iam_policy_document.devops_engineers_misc.json
}
# Attach the above policy to the network admins group. 
resource "aws_iam_group_policy_attachment" "devops_engineers_misc" {
  group      = "devops-engineers"
  policy_arn = aws_iam_policy.devops_engineers_misc.arn

  depends_on = [aws_iam_policy.devops_engineers_misc]
}
