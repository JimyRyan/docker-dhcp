FROM alpine:latest

MAINTAINER JimyRyan <JimyRyan@gmail.com>

RUN apk --update add dhcp \
	&& touch /var/lib/dhcp/dhcpd.leases

VOLUME ["/etc/dhcp"]

EXPOSE 67/udp 67/tcp

CMD ["/usr/sbin/dhcpd", "-f", "-d", "--no-pid", "-cf", "/etc/dhcp/dhcpd.conf"]
