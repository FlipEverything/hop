redis-server:
  service.running:
    - watch:
      - file: /etc/redis/redis.conf
/var/run/redis:
  file.directory:
    - user: redis
    - group: redis
    - dir_mode: 755
disable_redis_listening:
  file.replace:
    - name: /etc/redis/redis.conf
    - pattern: |
        ^port .*
    - repl: |
        port 0
enable_redis_socket:
  file.append:
    - name: /etc/redis/redis.conf
    - text: |
        unixsocket /var/run/redis/redis.sock
        unixsocketperm 770
