nginx:
  service.running:
    - watch:
      - file: /etc/nginx/*
nginx_config:
  file.copy:
    - name: /etc/nginx/sites-available/gitlab
    - source: /home/git/gitlab/lib/support/nginx/gitlab
    - user: root
/etc/nginx/sites-enabled/gitlab:
  file.symlink:
    - target: /etc/nginx/sites-available/gitlab
