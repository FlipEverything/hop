openstack_install:
  git.latest:
    - name: https://git.openstack.org/openstack-dev/devstack
    - user: stack
    - target: /var/lib/stack/devstack
  file.managed:
    - name: /var/lib/stack/devstack/local.conf
    - user: stack
    - group: stack
    - mode: 0644
    - source: salt://openstack/local_conf.template
    - template: jinja
    - context:
        ip: {{ salt['network.interfaces']()['eth1']['inet'][0]['address'] }}

enable_eth2:
  cmd.run:
    - name: ip link set dev eth2 up
    - user: root

run_stack:
  cmd.run:
    - name: /var/lib/stack/devstack/stack.sh
    - cwd: /var/lib/stack/devstack
    - user: stack
    - shell: /bin/bash

add_keypair:
  cmd.script:
    - name: salt://openstack/add_key.sh
    - user: stack
    - group: stack
    - shell: /bin/bash

add_ubuntu:
  cmd.script:
    - name: salt://openstack/add_ubuntu.sh
    - user: stack
    - group: stack
    - shell: /bin/bash
