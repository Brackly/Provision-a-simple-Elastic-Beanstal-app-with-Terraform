terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">=1.2.0"
}

provider "aws" {
  region = "us-east-1"

}

resource "aws_elastic_beanstalk_application" "test_eb_app" {
  name = "gitlab-vdespa"
  appversion_lifecycle {
    service_role = data.aws_iam_role.AWSServiceRoleForElasticBeanstalk.arn
  }
}

data "aws_iam_role" "AWSServiceRoleForElasticBeanstalk" {
  name = "AWSServiceRoleForElasticBeanstalk"
}

