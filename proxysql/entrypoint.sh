#!/bin/bash
dataCenter=$(curl https://metadata.google.internal/computeMetadata/v1/instance/zone -H "Metadata-Flavor: Google" | awk -F "/" '{print $NF}' | cut -d- -f1,2)
...
case $dataCenter in
  us-central1)
    cp -f /opt/supportfiles/proxysql-us-central1.cnf /etc/proxysql.cnf
    ;;
  us-east1)
    cp -f /opt/supportfiles/proxysql-us-east1.cnf /etc/proxysql.cnf
    ;;
esac
...
exec proxysql -c /etc/proxysql.cnf -f -D /var/lib/proxysql
