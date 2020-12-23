FROM centos:7
RUN yum install -q -y unzip wget mysql nmap-ncat curl && \
  yum clean all
RUN groupadd consul && \
  useradd -r -g consul -d /var/lib/consul consul
RUN mkdir /opt/consul-template && \
  mkdir /etc/consul-template && \
  mkdir /etc/consul-template/templates && \
  mkdir /etc/consul-template/config && \
  mkdir /opt/supportfiles && \
  mkdir /var/log/consul/ && \
  chown -R consul:consul /etc/consul-template && \
  chown -R consul:consul /etc/consul-template/templates && \
  chown -R consul:consul /etc/consul-template/config && \
  chown -R consul:consul /var/log/consul
RUN wget -q -O /opt/consul-template/consul-template.zip https://releases.hashicorp.com/consul-template/0.22.0/consul-template_0.22.0_linux_amd64.zip && \
  unzip /opt/consul-template/consul-template.zip -d /opt/consul-template/ && \
  rm -f /opt/consul-template/consul-template.zip && \
  ln -s /opt/consul-template/consul-template /usr/local/bin/consul-template
RUN chown -R consul:consul /opt/consul-template
COPY supportfiles/* /opt/supportfiles/
COPY startstop/* /opt/
RUN chmod +x /opt/entrypoint.sh
USER consul
ENTRYPOINT ["/opt/entrypoint.sh"]
