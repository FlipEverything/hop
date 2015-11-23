openstack_networking:
  cmd.run:
    - name: ovs-vsctl add-port br-ex eth2
    - user: root

virsh net-destroy default:
  cmd.run:
    - user: root
