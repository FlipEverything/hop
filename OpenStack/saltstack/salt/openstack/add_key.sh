#!/bin/bash

source $HOME/devstack/openrc admin

nova keypair-add --pub_key $HOME/.ssh/id_rsa.pub admin
