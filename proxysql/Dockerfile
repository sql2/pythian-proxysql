FROM centos:7
RUN groupadd proxysql && \
  useradd -r -g proxysql proxysql
RUN yum install -q -y https://github.com/sysown/proxysql/releases/download/v2.0.6/proxysql-2.0.6-1-centos67.x86_64.rpm mysql curl && \
  yum clean all
COPY supportfiles/* /opt/supportfiles/
COPY startstop/* /opt/
RUN chmod +x /opt/entrypoint.sh
RUN chown proxysql:proxysql /etc/proxysql.cnf
USER proxysql
ENTRYPOINT ["/opt/entrypoint.sh"]
