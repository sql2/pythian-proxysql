FROM centos:7
RUN yum install -q -y unzip wget && \
  yum clean all
RUN groupadd consul && \
  useradd -r -g consul -d /var/lib/consul consul
RUN mkdir /opt/consul && \
  mkdir /etc/consul && \
  mkdir /var/log/consul && \
  mkdir /var/lib/consul && \
  chown -R consul:consul /opt/consul && \
  chown -R consul:consul /etc/consul && \
  chown -R consul:consul /var/log/consul && \
  chown -R consul:consul /var/lib/consul
RUN wget -q -O /opt/consul/consul.zip https://releases.hashicorp.com/consul/1.6.1/consul_1.6.1_linux_amd64.zip && \
  unzip /opt/consul/consul.zip -d /opt/consul/ && \
  rm -f /opt/consul/consul.zip && \
  ln -s /opt/consul/consul /usr/local/bin/consul
COPY supportfiles/consul.conf.json /etc/consul/
USER consul
ENTRYPOINT ["/usr/local/bin/consul", "agent", "--config-file=/etc/consul/consul.conf.json"]
