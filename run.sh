#!/bin/sh

cat > /etc/php7/conf.d/00_custom.ini <<EOF
max_execution_time = 0
upload_max_filesize = 2000M
post_max_size = 2000M
memory_limit = -1
EOF

chown -R $UID:$GID /adminer /etc/php7
exec su-exec $UID:$GID php7 -S 0.0.0.0:8888 -t /adminer
