#!/bin/bash

apt-get install -y vim nfs-kernel-server

mkdir -p /volumes/v{0,1,2,3,4,5,6,7,8,9}

cat > /etc/exports <<EOF
/volumes/v0 172.27.11.0/24(rw,no_root_squash,no_subtree_check)
/volumes/v1 172.27.11.0/24(rw,no_root_squash,no_subtree_check)
/volumes/v2 172.27.11.0/24(rw,no_root_squash,no_subtree_check)
/volumes/v3 172.27.11.0/24(rw,no_root_squash,no_subtree_check)
/volumes/v4 172.27.11.0/24(rw,no_root_squash,no_subtree_check)
/volumes/v5 172.27.11.0/24(rw,no_root_squash,no_subtree_check)
/volumes/v6 172.27.11.0/24(rw,no_root_squash,no_subtree_check)
/volumes/v7 172.27.11.0/24(rw,no_root_squash,no_subtree_check)
/volumes/v8 172.27.11.0/24(rw,no_root_squash,no_subtree_check)
/volumes/v9 172.27.11.0/24(rw,no_root_squash,no_subtree_check)
EOF

exportfs -a
