# Install Photon OS


# Configure Network
root - changeme
cd /etc/systemd/network/
cp 99-dhcp-en.network 10-static-en.network
vi 10-static-en.network
---------------------------
[Match]
Name=e*

[Network]
DHCP=no
IPv6AcceptRA=no
Address=x.x.x.x/24
Gateway=x.x.x.x
DNS=x.x.x.x y.y.y.y
---------------------------

chmod 644 10-static-en.network
systemctl restart systemd-networkd
systemctl restart systemd-resolved
updatedb


# Set hostname
hostnamectl set-hostname <hostname>


# Disable CloudInit
touch /etc/cloud/cloud-init.disabled


# Update
tdnf update --assumeyes
reboot


# Remove PWD expiration policy
chage -l root
chage -m 0 -M 9999 root

