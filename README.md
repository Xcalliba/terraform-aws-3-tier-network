Deploys a three (3) tiered network layout in three (3) availability zones (AZs).

Description

It consists of the following main components inside a VPC with an Internet Gateway, replicated in 3 AZs:

A Public Subnet with a Bastion Host, a public route table and a NAT Gateway.
A Private Subnet with an App Host and a private route table.
A Private Subnet for the Database with nothing inside it.
A Security Group for each instance, with the following specs:
The Bastion Host allows SSH ingress from anywhere
The Bastion Host allows SSH egress to the App Host's Security Group
The Bastion Host allows ICMP egress for Echo Requests
The App Host allows SSH ingress from the Bastion Host's Security Group
The App Host allows TCP egress over HTTP port 80 to perform updates.
The App Host allows ICMP egress for Echo Requests
