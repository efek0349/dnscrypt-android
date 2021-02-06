#!/system/bin/sh
iptables -t nat -A OUTPUT -p tcp --dport 53 -j DNAT --to-destination 127.0.0.1:5354
iptables -t nat -A OUTPUT -p udp --dport 53 -j DNAT --to-destination 127.0.0.1:5354
#iptables -t nat -A OUTPUT -p tcp ! -d 91.239.100.100 --dport 53 -j DNAT --to-destination 127.0.0.1:5354
#iptables -t nat -A OUTPUT -p udp ! -d 91.239.100.100 --dport 53 -j DNAT --to-destination 127.0.0.1:5354
# ip6tables -t nat -A OUTPUT -p tcp ! -d 91.239.100.100 --dport 53 -j DNAT --to-destination [::1]:5354
# ip6tables -t nat -A OUTPUT -p udp ! -d 91.239.100.100 --dport 53 -j DNAT --to-destination [::1]:5354
