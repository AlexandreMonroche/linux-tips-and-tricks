#! /bin/bash
#-----------------------
#--Required Packages-
#-ufw
#-fail2ban
#-net-tools

# --- Setup SSH
# --- Setup UFW rules
#ufw limit 22/tcp
#ufw allow 80/tcp
#ufw allow 443/tcp
ufw default deny incoming
ufw default allow outgoing
ufw enable

# --- Harden /etc/sysctl.conf
sysctl kernel.modules_disabled=1
sysctl -a
sysctl -A
sysctl mib
sysctl net.ipv4.conf.all.rp_filter
sysctl -a --pattern 'net.ipv4.conf.(eth|wlan)0.arp'

# --- PREVENT IP SPOOFS
cat <<EOF > /etc/host.conf
order bind,hosts
multi on
EOF

# --- Enable fail2ban
systemctl enable fail2ban
systemctl start fail2ban

# --- Display listening ports
echo "listening ports"
netstat -tunlp
