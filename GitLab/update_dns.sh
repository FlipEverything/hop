#!/bin/bash

sed -i -e 's/\(nameserver \).*$/\18.8.8.8/' /etc/resolv.conf
