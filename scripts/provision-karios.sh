#!/bin/sh
cd /scripts
sudo apt-get purge openjdk-*
sudo add-apt-repository ppa:openjdk-r/ppa
sudo apt-get update
sudo apt-get install -f -y openjdk-8-jre-headless
rm -f kairosdb_1.1.2-1_all.deb
wget https://github.com/kairosdb/kairosdb/releases/download/v1.1.2/kairosdb_1.1.2-1_all.deb
sudo dpkg -i kairosdb_1.1.2-1_all.deb
rm -f kairosdb_1.1.2-1_all.deb
sudo apt-get install -f -y openjdk-8-jre-headless
sed -ie 's/kairosdb.service.datastore=org.kairosdb.datastore.h2.H2Module/#kairosdb.service.datastore=org.kairosdb.datastore.h2.H2Module/g' /opt/kairosdb/conf/kairosdb.properties
sed -ie 's/#kairosdb.service.datastore=org.kairosdb.datastore.cassandra.CassandraModule/kairosdb.service.datastore=org.kairosdb.datastore.cassandra.CassandraModule/g' /opt/kairosdb/conf/kairosdb.properties
sed -ie 's/kairosdb.datastore.cassandra.host_list=localhost:9160/kairosdb.datastore.cassandra.host_list=vcas01t.foocorp.test:9160,vcas02t.foocorp.test:9160,vcas03t.foocorp.test/g' /opt/kairosdb/conf/kairosdb.properties
sudo echo "10.10.8.101 vcas01t.foocorp.test" >> /etc/hosts
sudo echo "10.10.8.102 vcas02t.foocorp.test" >> /etc/hosts
sudo echo "10.10.8.103 vcas03t.foocorp.test" >> /etc/hosts
sudo /opt/kairosdb/bin/kairosdb.sh start
/scripts/testpush.sh

echo "############# ${HOST} SETUP COMPLETE #####################"