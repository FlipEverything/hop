!#/bin/bash

source "${HOME}/devstack/openrc" admin

IMG_LOC='/tmp/trusty-server-cloudimg-amd64-disk1.img'

wget -q -O "${IMG_LOC}" http://uec-images.ubuntu.com/trusty/current/trusty-server-cloudimg-amd64-disk1.img

glance --os-tenant-name admin image-create --name ubuntu/trusty64 --min-disk 2 --min-ram 512 --file "${IMG_LOC}" --property net_model=e1000 --property disk_bus=ide --disk-format=qcow2 --container-format ovf --visibility public --architecture x86_64 --os-distro ubuntu --os-version 14.04
