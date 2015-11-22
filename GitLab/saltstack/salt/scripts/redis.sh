# Configure redis to use sockets
cp /etc/redis/redis.conf /etc/redis/redis.conf.orig

# Disable Redis listening on TCP by setting 'port' to 0
sed 's/^port .*/port 0/' /etc/redis/redis.conf.orig | tee /etc/redis/redis.conf

# Enable Redis socket for default Debian / Ubuntu path
echo 'unixsocket /var/run/redis/redis.sock' | tee -a /etc/redis/redis.conf
# Grant permission to the socket to all members of the redis group
echo 'unixsocketperm 770' | tee -a /etc/redis/redis.conf

# Persist the directory which contains the socket, if applicable
if [ -d /etc/tmpfiles.d ]; then
  echo 'd  /var/run/redis  0755  redis  redis  10d  -' | tee -a /etc/tmpfiles.d/redis.conf
fi

service redis-server restart
