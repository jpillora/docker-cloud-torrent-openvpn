FROM jpillora/cloud-torrent
MAINTAINER dev@jpillora.com

#install openvpn
RUN apk update && \
    apk add openvpn supervisor

#setup opt/
RUN mkdir /opt
RUN mkdir /opt/openvpn
RUN mkdir /opt/cloud-torrent
RUN mkdir /opt/cloud-torrent/downloads
COPY scripts /opt/scripts

#configure supervisor
RUN mkdir -p /var/log/supervisor
COPY supervisord.conf /opt/supervisord.conf

#run!
ENTRYPOINT ["/usr/bin/supervisord","-c","/opt/supervisord.conf"]