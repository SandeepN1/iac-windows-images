packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.1"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

packer {
  required_plugins {
    windows-update = {
      version = "0.14.0"
      source  = "github.com/rgl/windows-update"
    }
  }
}

locals {
  timestamp = legacy_strftime("%Y%m%d")
}

data "amazon-ami" "aws_os_ami" {
  filters = {
    virtualization-type = "hvm"
    name                = "${var.aws_os_ami_filter}"
    architecture        = "x86_64"
    root-device-type    = "ebs"
  }
  owners      = ["${var.aws_os_ami_owner}"]
  most_recent = true
  region      = "${var.aws_region}"
}

source "amazon-ebs" "aws_packer_windows" {
  access_key            = "${var.aws_access_key}"
  secret_key            = "${var.aws_secret_key}"
  ami_name              = "aws-windows-${var.aws_os_version}-${var.aws_imagetype_name}-${local.timestamp}"
  instance_type         = "${var.aws_instance_type}"
  region                = "${var.aws_region}"
  encrypt_boot          = "${var.aws_encrypt_boot}"
  force_deregister      = "${var.aws_force_deregister}"
  force_delete_snapshot = true
  communicator          = "winrm"
  winrm_username        = "Administrator"
  winrm_port            = 5986
  winrm_timeout         = "15m"
  winrm_use_ssl         = true
  winrm_insecure        = true
  subnet_id             = "${var.aws_subnet_id}"
  source_ami            = data.amazon-ami.aws_os_ami.id
  # This user data file sets up winrm and configures it so that the connection
  # from Packer is allowed. Without this file being set, Packer will not
  # connect to the instance.
  user_data_file = "./scripts/ConfigureRemotingForAnsible.ps1"
  tags = {
    Name        = "MAF-Windows"
    OS          = "Windows"
    Department  = "MAFGlobal"
    OS_Version  = "${var.aws_os_version}"
    Application = "${var.aws_imagetype_name}"
    Runner      = "EC2"
  }
}
