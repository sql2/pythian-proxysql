#!/bin/bash
dataCenter=$(curl https://metadata.google.internal/computeMetadata/v1/instance/zone -H "Metadata-Flavor: Google" | awk -F "/" '{print $NF}' | cut -d- -f1,2)
...
cp /opt/supportfiles/consul-template-config /etc/consul-template/config/consul-template.conf.json
case $dataCenter in
  us-central1)
    cp /opt/supportfiles/template-mysql-servers-us-central1 /etc/consul-template/templates/mysql_servers.tpl
    ;;
  us-east1)
    cp /opt/supportfiles/template-mysql-servers-us-east1 /etc/consul-template/templates/mysql_servers.tpl
    ;;
esac
cp /opt/supportfiles/template-mysql-users /etc/consul-template/templates/mysql_users.tpl
### Ensure that proxysql has started
while ! nc -z localhost 6032; do
  sleep 1;
done
### Ensure that consul agent has started
while ! nc -z localhost 8500; do
  sleep 1;
done
exec /usr/local/bin/consul-template --config=/etc/consul-template/config/consul-template.conf.json
