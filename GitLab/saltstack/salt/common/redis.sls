/var/run/redis:
  file.directory:
    - user: redis
    - group: redis
    - dir_mode: 755
redis.sh:
  cmd.script:
    - source: salt://scripts/redis.sh
    - cwd: /tmp
    - user: root
