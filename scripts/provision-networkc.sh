#!/bin/sh
sed -ie 's/GRUB_CMDLINE_LINUX="\(.*\)"/GRUB_CMDLINE_LINUX="net.ifnames=0 biosdevname=0 \1"/g' /etc/default/grub;
update-grub;
sudo cp /scripts/provision-cassandra.sh /etc/init.d/
sudo update-rc.d provision-cassandra.sh defaults