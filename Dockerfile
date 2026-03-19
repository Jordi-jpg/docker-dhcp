FROM ubuntu:24.04

RUN apt-get update -y && \
    apt install kea supervisor -y && \
    mkdir -p /var/log/supervisor /var/lib/kea /var/run/kea

COPY kea-dhcp4.conf /etc/kea/kea-dhcp4.conf
COPY supervisord.conf /etc/supervisor/supervisord.conf

EXPOSE 67/udp 67/tcp

CMD ["supervisord", "-c", "/etc/supervisor/supervisord.conf"]
