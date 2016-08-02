# --------------------------------------------
#  MODULE TO CREATE THE SECURITY GROUP
#             FOR WEB SERVER
# --------------------------------------------

variable "vpc_id"  { }

resource "aws_security_group" "web_server_sg" {
  name        = "web_server_sg"
  description = "Allows hhtp, https and ssh traffic"
  vpc_id = "${var.vpc_id}" 

  ingress {
    from_port = 80 
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 443 
    to_port   = 443
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
   
  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
 }

}

output "web_server_sg_id" { value = "${aws_security_group.web_server_sg.id}" }
