FROM jboss/wildfly:11.0.0.Final

ENV MYSQL_SERVER=127.0.0.1 \
    MYSQL_PORT=3306 \
    MYSQL_DATABASE=sampledb \
    MYSQL_USER=user \
    MYSQL_PASSWORD=password
	
COPY customization /opt/jboss/wildfly/customization/

USER root

RUN chown -R jboss:root /opt/jboss/wildfly/customization/

USER jboss

RUN	/opt/jboss/wildfly/customization/execute.sh

USER root

RUN chgrp -R 0 /opt/jboss/wildfly/standalone && \
	chmod -R g=u /opt/jboss/wildfly/standalone && \
	rm -rf /opt/jboss/wildfly/customization/ && \
	rm -rf /opt/jboss/wildfly/standalone/configuration/standalone_xml_history/current/*
	
USER jboss

CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0"]
