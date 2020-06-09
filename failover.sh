#!/bin/sh
failed_node=10.70.100.8
new_master=10.70.100.199
(
date
echo "Failed node: $failed_node"
set -x
/usr/bin/ssh postgres@$new_master "repmgr standby promote -v"
exit 0;
) 2>&1 | tee -a /var/log/pgpoollogdir/failover.log
