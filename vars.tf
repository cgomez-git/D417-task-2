# AWS Region Variable
variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-west-2"
}

# EC2 Instance Variable for Ubuntu Server 24.04 LTS (us-west-2)
variable "instance_ami_id_1" {
  description = "Ubuntu Server 24.04 LTS (HVM)"
  type        = string
  default     = "ami-076699d5c1342ed35"
}

# EC2 Instance Variable for Red Hat Enterprise Linux 10 (us-west-2)
variable "instance_ami_id_2" {
  description = "Red Hat Enterprise Linux 10 (HVM)"
  type        = string
  default     = "ami-0e7456aadb2fc6381"
}

# EC2 Instance Type Variable
variable "instance_type" {
  description = "EC2 Instance type"
  type        = string
  default     = "t2.micro"
}

# EC2 Key Pair Public Key Path Variable for SSH Access
variable "pubkey_path" {
  description = "EC2 key pair path for public key"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}
