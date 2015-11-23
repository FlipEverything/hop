{% from "config/map.jinja" import config with context %}

gitlab_git:
  git.latest:
    - name: https://gitlab.com/gitlab-org/gitlab-ce.git
    - branch: 8-2-stable
    - target: /home/git/gitlab
    - user: git
gitlab_config:
  file.copy:
    - name: /home/git/gitlab/config/gitlab.yml
    - source: /home/git/gitlab/config/gitlab.yml.example
gitlab_secrets:
  file.managed:
    - name: /home/git/gitlab/config/secrets.yml
    - user: git
    - group: git
    - mode: 0600
    - source: salt://template/secrets.yaml.template
    - template: jinja
/home/git/gitlab/log:
  file.directory:
    - dir_mode: 755
    - file_mode: 744
    - recurse:
      - mode
/home/git/gitlab/tmp:
  file.directory:
    - dir_mode: 755
    - file_mode: 744
    - recurse:
      - mode
/home/git/gitlab/public/uploads:
  file.directory:
    - dir_mode: 755
    - file_mode: 744
    - recurse:
      - mode
/home/git/gitlab/builds:
  file.directory:
    - dir_mode: 755
    - file_mode: 744
    - recurse:
      - mode
/home/git/gitlab/shared/artifacts:
  file.directory:
    - dir_mode: 755
    - file_mode: 744
    - recurse:
      - mode
unicorn_config:
  file.copy:
    - name: /home/git/gitlab/config/unicorn.rb
    - source: /home/git/gitlab/config/unicorn.rb.example
rack_attack_config:
  file.copy:
    - name: /home/git/gitlab/config/initializers/rack_attack.rb
    - source: /home/git/gitlab/config/initializers/rack_attack.rb.example
git_global:
  git.config_set:
    - name: core.autocrlf
    - value: input
    - user: git
    - global: True
redis_connection_settings:
  file.copy:
    - name: /home/git/gitlab/config/resque.yml
    - source: /home/git/gitlab/config/resque.yml.example
gitlab_db:
  file.copy:
    - name: /home/git/gitlab/config/database.yml
    - source: /home/git/gitlab/config/database.yml.postgresql
/home/git/gitlab/config/database.yml:
  file.managed:
    - file_mode: 440
bundle install --deployment --without development test mysql aws kerberos:
  cmd.run:
    - user: git
    - cwd: /home/git/gitlab
bundle exec rake gitlab:shell:install[v2.6.7] REDIS_URL=unix:/var/run/redis/redis.sock RAILS_ENV=production:
  cmd.run:
    - user: git
    - cwd: /home/git/gitlab
gitlab-workhorse:
  git.latest:
    - name: https://gitlab.com/gitlab-org/gitlab-workhorse.git
    - rev: 0.4.2
    - target: /home/git/gitlab-workhorse
    - user: git
gitlab-workhorse_make:
  cmd.run:
    - cwd: /home/git/gitlab-workhorse
    - user: git
    - name: make
yes 'yes' | bundle exec rake gitlab:setup RAILS_ENV=production GITLAB_ROOT_PASSWORD={{ salt['pillar.get']('config:lookup:gitlab:root_password') }}:
  cmd.run:
    - cwd: /home/git/gitlab
    - user: git
gitlab_init_script:
  file.copy:
    - name: /etc/init.d/gitlab
    - source: /home/git/gitlab/lib/support/init.d/gitlab
    - user: root
update-rc.d gitlab defaults 21:
  cmd.run:
    - user: root
gitlab:
  service.running:
    - watch:
      - file: /home/git/gitlab/*
gitlab_logrotate:
  file.copy:
    - name: /etc/logrotate.d/gitlab
    - source: /home/git/gitlab/lib/support/logrotate/gitlab
    - user: root
bundle exec rake assets:precompile RAILS_ENV=production:
  cmd.run:
    - cwd: /home/git/gitlab
    - user: git
