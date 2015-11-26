openstack_networking:
  cmd.run:
    - name: ovs-vsctl add-port br-ex eth2
    - user: root

virsh net-destroy default:
  cmd.run:
    - user: root

network_rules:
  cmd.script:
    - name: salt://openstack/networking.sh
    - user: stack
    - group: stack
    - shell: /bin/bash
