#!/bin/bash

source "${HOME}/devstack/openrc" admin

openstack security group rule create default --proto tcp --dst-port 22
openstack security group rule create default --proto tcp --dst-port 80
openstack security group rule create default --proto tcp --dst-port 443
openstack security group rule create default --proto icmp

neutron subnet-update public-subnet --dns_nameservers list=true 8.8.8.8 8.8.4.4
neutron subnet-update private-subnet --dns_nameservers list=true 8.8.8.8 8.8.4.4

