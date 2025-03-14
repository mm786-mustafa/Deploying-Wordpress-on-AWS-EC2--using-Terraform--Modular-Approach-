# Deploying-Wordpress-on-AWS-EC2--using-Terraform--Modular-Approach-
In this project, I am deploying Wordpress on EC2 instance using Terraform.
Following are the details:
-> EC2 resides in private subnet
-> RDS is setup for Wordpress
-> Security group is created. It contains two rules. One, Wordpress can be accessed using port 80 and MySQL on port 3306.
-> Load Balancer used to direct traffic to the EC2 instance.
