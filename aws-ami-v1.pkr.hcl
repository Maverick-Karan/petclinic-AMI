# https://www.packer.io/plugins/builders/amazon 

# AWS PLUGIN

packer {
  required_plugins {
    amazon = {
      source  = "github.com/hashicorp/amazon"
      version = "~> 1"
    }
  }
}

# which ami to use as the base and where to save it
source "amazon-ebs" "amazon-linux" {
  region          = "us-east-1"
  ami_name        = "ami-version-1.0.1-{{timestamp}}"
  instance_type   = "t2.micro"
  source_ami      = "ami-0e731c8a588258d0d"
  ssh_username    = "ec2-user"
  ami_regions     = ["us-east-1"]
}


# what to install, configure and file to copy/execute
build {
  name = "AMI-build"
  sources = ["source.amazon-ebs.amazon-linux"]

  provisioner "file" {
  source = "provisioner.sh"
  destination = "/tmp/provisioner.sh"
  }

  provisioner "shell" {
    inline = ["chmod a+x /tmp/provisioner.sh"]
  }

  provisioner "shell" {
    inline = ["/bin/bash -x /tmp/provisioner.sh"]
  }
}