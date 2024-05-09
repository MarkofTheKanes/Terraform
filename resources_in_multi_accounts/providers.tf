provider "aws" {
  region = "us-east-2"
  alias  = "profile1"
  shared_credentials_files = ["~/.aws/credentials"]
  profile = "533266985142_AdministratorAccess"

}

provider "aws" {
  region = "us-west-2"
  alias  = "profile2"
  shared_credentials_files = ["~/.aws/credentials"]
  profile = "533266985142_AdministratorAccess2"
}