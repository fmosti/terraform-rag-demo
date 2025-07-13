variable "aws_access_key" {
  description = "AWS access key."
  type        = string
}

resource "aws_security_group" "web_server_sg" {
  name        = "web-server-sg"
  description = "Allows web traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }
}

resource "aws_s3_bucket" "financial_reports" {
  bucket = "company-financial-reports-2025"

}

# VIOLATION: Resource missing required tags
resource "aws_instance" "bastion_host" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  tags = {
    Name = "Bastion Host"
  }
}
