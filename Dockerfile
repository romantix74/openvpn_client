FROM alpine:latest

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing/" >> /etc/apk/repositories && \
    apk add --update openvpn iptables bash curl && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/*

# Needed by scripts
ENV OPENVPN /etc/openvpn
ENV OPENVPN_SERVER nl.secretvpn.net

VOLUME ["/etc/openvpn"]

EXPOSE 1194/udp

CMD ["ovpn_run.sh"]

ADD ./bin /usr/local/bin
RUN chmod a+x /usr/local/bin/*
