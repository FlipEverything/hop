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
  cmd.run:
    - name: /var/lib/stack/devstack/stack.sh
    - cwd: /var/lib/stack/devstack
    - user: stack
    - shell: /bin/bash
