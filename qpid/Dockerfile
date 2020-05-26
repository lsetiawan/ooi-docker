FROM java:7
# COPY qpid-java-broker-0.18.tar.gz /
RUN wget http://archive.apache.org/dist/qpid/0.18/qpid-java-broker-0.18.tar.gz
RUN tar xvzf /qpid-java-broker-0.18.tar.gz; rm /qpid-java-broker-0.18.tar.gz
COPY config.xml /qpid-broker-0.18/etc/config.xml
COPY virtualhosts.xml /qpid-broker-0.18/etc/virtualhosts.xml
CMD ["/qpid-broker-0.18/bin/qpid-server"]
EXPOSE 5672 8180
