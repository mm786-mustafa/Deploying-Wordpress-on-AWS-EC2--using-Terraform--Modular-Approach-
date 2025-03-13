data "aws_region" "current" {} # Fetching Current Region

# *** Importing Subnets ***
module "subnets" {
  source = "../subnets"
}

# *** Importing Security Group ***
module "sg" {
  source = "../security-group"
}

# *** Importing RDS ***
module "rds" {
  source = "../rds-instance"
}

# *** EC2 Instance ***
resource "aws_instance" "my_ec2_instance" {
  instance_type = var.instance_type
  ami = var.ami
  key_name = var.key_name
  subnet_id = module.subnets.private_subnet_1_id
  security_groups = [ module.sg.security_group_id ]
  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo amazon-linux-extras install php7.4 -y
    sudo yum install httpd -y
    sudo yum install mysql -y
    sudo yum install php-mysqlnd php-fpm php-json php-xml php-gd php-mbstring -y
    sudo systemctl enable httpd
    sudo systemctl start httpd
    wget https://wordpress.org/latest.tar.gz
    tar -xvzf latest.tar.gz
    sudo mv wordpress/* /var/www/html/
    sudo chown -R apache:apache /var/www/html/
    sudo systemctl restart httpd
    sudo cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
    sudo sed -i "s/database_name_here/${module.rds.rds_db_name}/" /var/www/html/wp-config.php
    sudo sed -i "s/username_here/${module.rds.rds_username}/" /var/www/html/wp-config.php
    sudo sed -i "s/password_here/${module.rds.rds_password}/" /var/www/html/wp-config.php
    sudo sed -i "s/localhost/${split(":",module.rds.rds_endpoint)[0]}/" /var/www/html/wp-config.php
    sudo systemctl restart httpd
    EOF
    # "${file("user_data.sh")}"
  tags = {
    Name = "${var.environment}-${var.my_ec2_instance_name}-${data.aws_region.current.name}"
  }
}