output "Ubuntu_SRV_info" {
  value = {
    name        = aws_instance.Ubuntu_SRV.tags["Name"]
    instance_id = aws_instance.Ubuntu_SRV.id
    public_ip   = aws_instance.Ubuntu_SRV.public_ip
    private_ip  = aws_instance.Ubuntu_SRV.private_ip
  }
}

output "RedHat_SRV_info" {
  value = {
    name        = aws_instance.RedHat_SRV.tags["Name"]
    instance_id = aws_instance.RedHat_SRV.id
    public_ip   = aws_instance.RedHat_SRV.public_ip
    private_ip  = aws_instance.RedHat_SRV.private_ip
  }
}
