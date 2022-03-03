FROM quay.io/wildfly/wildfly
ARG CONT_IMG_VER
ENV CONT_IMG_VER=v1.0.0
RUN echo $CONT_IMG_VER
RUN /opt/jboss/wildfly/bin/add-user.sh admin Admin --silent

## Solr 4.0.0 file
ADD https://archive.apache.org/dist/lucene/solr/4.0.0/apache-solr-4.0.0.zip /tmp/
USER root
RUN yum install -y rsync
RUN unzip /tmp/apache-solr-4.0.0.zip -d /tmp
### deploy war*.zip 
RUN rsync \
  --remove-source-files \
  --chown=jboss:0 \
    /tmp/apache-solr-4.0.0/dist/apache-solr-4.0.0.war /opt/jboss/wildfly/standalone/deployments/solr.war
##RUN mv /tmp/apache-solr-4.0.0/dist/apache-solr-4.0.0.war /opt/jboss/wildfly/standalone/deployments/solr.war
##RUN chown jboss:0 /opt/jboss/wildfly/standalone/deployments/solr.war
##ADD solr.tar.gz /opt/jboss/
ENV solr.solr.home /opt/jboss/solr
##ADD solr.war /opt/jboss/wildfly/standalone/deployments/
RUN mv /tmp/apache-solr-4.0.0/example/solr /opt/jboss/
RUN chown -R jboss:0 /opt/jboss/solr
### clean up /tmp/*
RUN rm -Rf /tmp/apache-solr-4.0.0
RUN rm -f /tmp/apache-solr-4.0.0.zip
USER jboss
CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]
