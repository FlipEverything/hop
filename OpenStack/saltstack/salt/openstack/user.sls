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
