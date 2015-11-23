openstack_user:
  user.present:
    - name: stack
    - shell: /usr/sbin/nologin
    - home: /var/lib/stack
    - createhome: True
    - system: True
  file.managed:
    - name: /etc/sudoers.d/stack
    - user: root
    - group: root
    - mode: 0440
    - contents: "stack ALL=(root) NOPASSWD:ALL"
ssh_public_key:
  file.managed:
    - name: /var/lib/stack/.ssh/id_rsa.pub
    - user: stack
    - group: stack
    - mode: 0640
    - makedirs: True
    - source: salt://openstack/id_rsa.pub
