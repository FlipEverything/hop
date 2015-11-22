nginx:
  service.running:
    - watch:
      - file: /etc/nginx/*
nginx_config:
  file.copy:
    - name: /etc/nginx/sites-available/gitlab
    - source: /home/git/gitlab/lib/support/nginx/gitlab
    - user: root
replace_fqdn:
  file.replace:
    - name: /etc/nginx/sites-available/gitlab
    - pattern: |
        server_name YOUR_SERVER_FQDN;.*
    - repl: |
        server_name {{ grains['nginx']['fqdn'] }};
/etc/nginx/sites-enabled/gitlab:
  file.symlink:
    - target: /etc/nginx/sites-available/gitlab
/etc/nginx/sites-enabled/default:
  file.absent
