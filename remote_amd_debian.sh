cd /home/admin
apt update
apt install wget -y
apt install tar -y
apt install -y xfce4 xfce4-goodies xorg dbus-x11 x11-xserver-utils
apt install -y xrdp
adduser xrdp ssl-cert
systemctl restart xrdp
wget https://github.com/fatedier/frp/releases/download/v0.34.2/frp_0.34.2_linux_amd64.tar.gz
tar -zxvf frp_0.34.2_linux_amd64.tar.gz
cd /home/admin/frp_0.34.2_linux_amd64
sed -i '4i\token = 51247864' frpc.ini
sed -i '6c\[13389]' frpc.ini
sed -i '9c\local_port = 3389' frpc.ini
sed -i '10c\remote_port = 13389' frpc.ini
echo 'token = 51247864' >> /home/admin/frp_0.34.2_linux_amd64/frps.ini
mkdir /etc/frp
cp /home/admin/frp_0.34.2_linux_amd64/frpc /etc/frp
cp /home/admin/frp_0.34.2_linux_amd64/frpc.ini /etc/frp
cp /home/admin/frp_0.34.2_linux_amd64/frpc_full.ini /etc/frp
cp /home/admin/frp_0.34.2_linux_amd64/frps /etc/frp
cp /home/admin/frp_0.34.2_linux_amd64/frps.ini /etc/frp
# cp /home/admin/frp_0.34.2_linux_arm64/frps_full.ini /etc/frp
cp /home/admin/frp_0.34.2_linux_amd64/frps_full.ini /etc/frp
cp /home/admin/frp_0.34.2_linux_amd64/systemd/frpc.service /etc/systemd/system
cp /home/admin/frp_0.34.2_linux_amd64/systemd/frps.service /etc/systemd/system
chmod 754 /etc/systemd/system/frpc.service
chmod 754 /etc/systemd/system/frps.service
systemctl enable /etc/systemd/system/frpc.service
systemctl enable /etc/systemd/system/frps.service
cp /home/admin/frp_0.34.2_linux_amd64/frpc /usr/bin
chmod +x /usr/bin/frpc
systemctl start frpc
ps -ef|grep frpc
cp /home/admin/frp_0.34.2_linux_amd64/frps /usr/bin
chmod +x /usr/bin/frps
systemctl start frps
ps -ef|grep frps
