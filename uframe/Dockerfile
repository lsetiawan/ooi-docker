FROM java:7

# install edex
COPY edex/ /edex

# install start script
COPY edex-server /edex-server

# install fix hosts script
COPY fix_hosts.sh /fix_hosts.sh

# fix config file host names
RUN bash /fix_hosts.sh && rm /fix_hosts.sh

# make the async output directory
RUN mkdir -p /opt/ooi/async

VOLUME ["/edex/data/ooi", "/opt/ooi/async"]
CMD ["/edex-server"]
EXPOSE 12570-12600
