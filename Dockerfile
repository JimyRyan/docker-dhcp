FROM jimyryan/docker-ubuntu

MAINTAINER JimyRyan <JimyRyan@gmail.com>

RUN apt-get install -y --no-install-recommends isc-dhcp-server \
	&& touch /var/lib/dhcp/dhcpd.leases

VOLUME ["/var/lib/dhcp", "/etc/dhcp"]

EXPOSE 67/udp

ENTRYPOINT ["/usr/sbin/dhcpd", "-d", "--no-pid"]