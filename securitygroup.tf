resource "aws_security_group" "alb_sg" {
  vpc_id      = "${aws_vpc.my_vpc.id }"
  tags = {
    name = "alb_sg"
  }
}
 resource "aws_vpc_security_group_ingress_rule" "alb_ipv4" {
    security_group_id = aws_security_group.alb_sg.id
    from_port = 80
    to_port = 80
    ip_protocol = "tcp" 
    cidr_ipv4 = aws_vpc.my_vpc.cidr_block
  }
   resource "aws_vpc_security_group_egress_rule" "alb_traffic_ipv4" {
    security_group_id = aws_security_group.alb_sg.id
    ip_protocol = "-1"
    cidr_ipv4 = "0.0.0.0/0"
  }

#rds-sg
resource "aws_security_group" "db_sg" {
  vpc_id      = aws_vpc.my_vpc.id 
  tags = {
    name = "db_sg"
  }
}
 resource "aws_vpc_security_group_ingress_rule" "db_ipv4" {
    security_group_id = aws_security_group.db_sg.id
    from_port = 3306
    to_port = 3306
    ip_protocol = "tcp" 
    cidr_ipv4 = aws_vpc.my_vpc.cidr_block
  }
   resource "aws_vpc_security_group_egress_rule" "db_traffic_ipv4" {
    security_group_id = aws_security_group.db_sg.id
    ip_protocol = "-1"
    cidr_ipv4 = "0.0.0.0/0"
  }
