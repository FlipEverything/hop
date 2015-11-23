#!/bin/bash

source $HOME/devstack/openrc admin

openstack security group rule create default --proto tcp --dst-port 22
openstack security group rule create default --proto icmp

nova keypair-add --pub_key $HOME/.ssh/id_rsa.pub admin
