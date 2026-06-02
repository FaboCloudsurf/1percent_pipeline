
provider "aws" {
  # Configuration options
}

# resource "aws_instance" "one_percent_ec2" {
#   ami           = "ami-05cf1e9f73fbad2e2"
#   instance_type = "t2.micro"
#   key_name = data.aws_key_pair.existing_key.key_name
#   vpc_security_group_ids = [aws_security_group.one_percent_sg.id]
#   count = 3

#   tags = {
#     Name = "one_percent_ec2.${count.index +1}"

#   }
# }

resource "aws_instance" "one_percent_main" {
  ami           = "ami-05cf1e9f73fbad2e2"
  instance_type = "t3.micro"
  key_name = data.aws_key_pair.existing_key.key_name
  vpc_security_group_ids = [aws_security_group.one_percent_sg.id]
  count = 1

  tags = {
    Name = "one_percent_ec2_main"


 

  }
  
}

