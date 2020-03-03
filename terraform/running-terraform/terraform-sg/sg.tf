provider "aws" {
  region = "us-east-1"
}

variable "Environment"{
  type = string
  default = "dev"
}

resource "aws_security_group" "consumerAdminElb" {
  vpc_id      = "vpc-01bd657ba417f6350"
  name        = "consumer-${var.Environment}-adminelb-sg"
  description = "consumer-${var.Environment}-adminelb-sg"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "consumer-${var.Environment}-adminelb-sg"
  }
}

resource "aws_security_group" "consumerAdmin" {
  vpc_id      = "vpc-01bd657ba417f6350"
  name        = "consumer-${var.Environment}-admin-sg"
  description = "consumer-${var.Environment}-admin-sg"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["10.127.0.0/16"]
	description = "Allow users to consumer SG, RF1121005"
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.127.0.0/16"]
	description = "Allow users to consumer SG, RF1121005"
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["10.127.0.0/16"]
	description = "Allow users to consumer SG, RF1121005"
  }
  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["10.127.0.0/16"]
	description = "Allow users to consumer SG, RF1121005"
  }
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.127.0.0/16"]
	description = "Allow users to consumer SG, RF1121005"
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["10.206.0.0/16"]
	description = "Allow users to consumer SG, RF1121005"
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.206.0.0/16"]
	description = "Allow users to consumer SG, RF1121005"
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["10.206.0.0/16"]
	description = "Allow users to consumer SG, RF1121005"
  }
  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["10.206.0.0/16"]
	description = "Allow users to consumer SG, RF1121005"
  }
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.206.0.0/16"]
	description = "Allow users to consumer SG, RF1121005"
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["10.198.0.0/16"]
	description = "Allow users to consumer SG, RF1121005"
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.198.0.0/16"]
	description = "Allow users to consumer SG, RF1121005"
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["10.198.0.0/16"]
	description = "Allow users to consumer SG, RF1121005"
  }
  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["10.198.0.0/16"]
	description = "Allow users to consumer SG, RF1121005"
  }
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.198.0.0/16"]
	description = "Allow users to consumer SG, RF1121005"
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["10.153.0.0/18"]
	description = "Allow users to consumer SG, RF1121005"
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.153.0.0/18"]
	description = "Allow users to consumer SG, RF1121005"
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["10.153.0.0/18"]
	description = "Allow users to consumer SG, RF1121005"
  }
  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["10.153.0.0/18"]
	description = "Allow users to consumer SG, RF1121005"
  }
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.153.0.0/18"]
	description = "Allow users to consumer SG, RF1121005"
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["10.87.0.0/16"]
	description = "Allow users to consumer SG, RF1121005"
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.87.0.0/16"]
	description = "Allow users to consumer SG, RF1121005"
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["10.87.0.0/16"]
	description = "Allow users to consumer SG, RF1121005"
  }
  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["10.87.0.0/16"]
	description = "Allow users to consumer SG, RF1121005"
  }
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.87.0.0/16"]
	description = "Allow users to consumer SG, RF1121005"
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.242.16.0/22"]
	description = "Allow users to consumer SG, RF1121005"
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.242.20.0/22"]
	description = "Allow users to consumer SG, RF1121005"
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.242.24.0/22"]
	description = "Allow users to consumer SG, RF1121005"
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.242.32.0/22"]
	description = "Allow users to consumer SG, RF1121005"
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.242.36.0/22"]
	description = "Allow users to consumer SG, RF1121005"
  }
   ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.242.40.0/22"]
	description = "Allow users to consumer SG, RF1121005"
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.242.48.0/22"]
	description = "Allow users to consumer SG, RF1121005"
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.242.52.0/22"]
	description = "Allow users to consumer SG, RF1121005"
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.242.56.0/22"]
	description = "Allow users to consumer SG, RF1121005"
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.242.0.0/22"]
	description = "Allow users to consumer SG, RF1121005"
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.242.4.0/22"]
   description = "Allow users to consumer SG, RF1121005"
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.242.8.0/22"]
	description = "Allow users to consumer SG, RF1121005"
  }
  tags = {
    Name = "consumer-${var.Environment}-admin-sg"
  }
}

resource "aws_security_group" "consumerApi" {
  vpc_id      = "vpc-01bd657ba417f6350"
  name        = "consumer-${var.Environment}-api-sg"
  description = "consumer-${var.Environment}-api-sg"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["10.127.0.0/16"]
	description = "Allow users to consumer SG, RF1121005"
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["10.127.0.0/16"]
	description = "Allow users to consumer SG, RF1121005"
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["10.206.0.0/16"]
	description = "Allow users to consumer SG, RF1121005"
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["10.206.0.0/16"]
	description = "Allow users to consumer SG, RF1121005"
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["10.198.0.0/16"]
	description = "Allow users to consumer SG, RF1121005"
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["10.198.0.0/16"]
	description = "Allow users to consumer SG, RF1121005"
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["10.153.0.0/18"]
	description = "Allow users to consumer SG, RF1121005"
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["10.153.0.0/18"]
	description = "Allow users to consumer SG, RF1121005"
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["10.87.0.0/16"]
	description = "Allow users to consumer SG, RF1121005"
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["10.87.0.0/16"]
	description = "Allow users to consumer SG, RF1121005"
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["12.7.177.128/25"]
	description = "Allow users to consumer SG, RF1121005"
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["12.7.177.128/25"]
	description = "Allow users to consumer SG, RF1121005"
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["12.160.253.0/24"]
	description = "Allow users to consumer SG, RF1121005"
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["12.160.253.0/24"]
	description = "Allow users to consumer SG, RF1121005"
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["47.44.116.168/29"]
	description = "Allow users to consumer SG, RF1121005"
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["47.44.116.168/29"]
	description = "Allow users to consumer SG, RF1121005"
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["216.161.194.0/25"]
	description = "Allow users to consumer SG, RF1121005"
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["216.161.194.0/25"]
	description = "Allow users to consumer SG, RF1121005"
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["47.44.116.72/29"]
	description = "Allow users to consumer SG, RF1121005"
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["47.44.116.72/29"]
	description = "Allow users to consumer SG, RF1121005"
  }
  tags = {
    Name = "consumer-${var.Environment}-api-sg"
  }
}
resource "aws_security_group" "consumerWeb" {
  vpc_id      = "vpc-01bd657ba417f6350"
  name        = "consumer-${var.Environment}-web-sg"
  description = "consumer-${var.Environment}-web-sg"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8082
    to_port     = 8082
    protocol    = "tcp"
    cidr_blocks = ["10.127.0.0/16"]
	description = "Allow users to consumer SG, RF1121005"
  } 
  ingress {
    from_port   = 8443
    to_port     = 8443
    protocol    = "tcp"
    cidr_blocks = ["10.127.0.0/16"]
	description = "Allow users to consumer SG, RF1121005"
  } 
  ingress {
    from_port   = 8082
    to_port     = 8082
    protocol    = "tcp"
    cidr_blocks = ["10.206.0.0/16"]
	description = "Allow users to consumer SG, RF1121005"
  } 
  ingress {
    from_port   = 8443
    to_port     = 8443
    protocol    = "tcp"
    cidr_blocks = ["10.206.0.0/16"]
	description = "Allow users to consumer SG, RF1121005"
  } 
  ingress {
    from_port   = 8082
    to_port     = 8082
    protocol    = "tcp"
    cidr_blocks = ["10.198.0.0/16"]
	description = "Allow users to consumer SG, RF1121005"
  } 
  ingress {
    from_port   = 8443
    to_port     = 8443
    protocol    = "tcp"
    cidr_blocks = ["10.198.0.0/16"]
	description = "Allow users to consumer SG, RF1121005"
  } 
  ingress {
    from_port   = 8082
    to_port     = 8082
    protocol    = "tcp"
    cidr_blocks = ["10.153.0.0/18"]
	description = "Allow users to consumer SG, RF1121005"
  } 
  ingress {
    from_port   = 8443
    to_port     = 8443
    protocol    = "tcp"
    cidr_blocks = ["10.153.0.0/18"]
	description = "Allow users to consumer SG, RF1121005"
  } 
  ingress {
    from_port   = 8082
    to_port     = 8082
    protocol    = "tcp"
    cidr_blocks = ["10.87.0.0/16"]
	description = "Allow users to consumer SG, RF1121005"
  } 
  ingress {
    from_port   = 8443
    to_port     = 8443
    protocol    = "tcp"
    cidr_blocks = ["10.87.0.0/16"]
	description = "Allow users to consumer SG, RF1121005"
  } 
  tags = {
    Name = "consumer-${var.Environment}-web-sg"
  }
}
resource "aws_security_group" "consumerZoot" {
  vpc_id      = "vpc-01bd657ba417f6350"
  name        = "consumer-${var.Environment}-zoot-sg"
  description = "consumer-${var.Environment}-zoot-sg"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["10.242.16.0/22"]
	description = "Allow users to consumer SG, RF1121005"
  } 
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["10.242.16.0/22"]
	description = "Allow users to consumer SG, RF1121005"
  } 
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["10.242.20.0/22"]
	description = "Allow users to consumer SG, RF1121005"
  } 
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["10.242.20.0/22"]
	description = "Allow users to consumer SG, RF1121005"
  } 
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["10.242.24.0/22"]
	description = "Allow users to consumer SG, RF1121005"
  } 
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["10.242.24.0/22"]
	description = "Allow users to consumer SG, RF1121005"
  } 
 
  tags = {
    Name = "consumer-${var.Environment}-zoot-sg"
  }
}

resource "aws_security_group" "consumerData" {
  vpc_id      = "vpc-01bd657ba417f6350"
  name        = "consumer-${var.Environment}-data-sg"
  description = "consumer-${var.Environment}-data-sg"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.242.16.0/22"]
	description = "Allow users to consumer SG, RF1121005"
  } 
 ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.242.20.0/22"]
	description = "Allow users to consumer SG, RF1121005"
  } 
 ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.242.24.0/22"]
	description = "Allow users to consumer SG, RF1121005"
  } 
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.242.48.0/24"]
	description = "Allow users to consumer SG, RF1121005"
  } 
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.242.50.0/24"]
	description = "Allow users to consumer SG, RF1121005"
  } 
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.242.16.0/22"]
	description = "Allow users to consumer SG, RF1121005"
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.242.20.0/22"]
	description = "Allow users to consumer SG, RF1121005"
  } 
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.242.24.0/22"]
	description = "Allow users to consumer SG, RF1121005"
  }   
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.242.32.0/22"]
	description = "Allow users to consumer SG, RF1121005"
  }   
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.242.36.0/22"]
	description = "Allow users to consumer SG, RF1121005"
  }   
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.242.40.0/22"]
	description = "Allow users to consumer SG, RF1121005"
  }   
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.242.0.0/22"]
	description = "Allow users to consumer SG, RF1121005"
  }   
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.242.4.0/22"]
	description = "Allow users to consumer SG, RF1121005"
  }   
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.242.8.0/22"]
	description = "Allow users to consumer SG, RF1121005"
  }   
 
  tags = {
    Name = "consumer-${var.Environment}-data-sg"
  }
}
