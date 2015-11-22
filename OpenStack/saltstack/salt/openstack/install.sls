openstack_install:
  git.latest:
    - name: https://git.openstack.org/openstack-dev/devstack
    - user: stack
    - target: /tmp/devstack
  file.managed:
    - name: /tmp/devstack/local.conf
    - user: stack
    - group: stack
    - mode: 0644
    - source: salt://openstack/localrc.template
    - template: jinja
  cmd.run:
    - name: /tmp/devstack/stack.sh
    - cwd: /tmp/devstack
    - user: stack
    - shell: /bin/bash
