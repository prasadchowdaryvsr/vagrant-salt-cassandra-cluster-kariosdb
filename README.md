Vagrant-salt Setup for KairosDB/Cassandra cluster setup
======================

This is a simple Vagrant setup for installing Cassandra 1.2.9 and kairosdb 1.1.2 on   Ubuntu Xenial 64 servers.


Install [VirtualBox](https://www.virtualbox.org/)
Install [Vagrant](http://downloads.vagrantup.com/) (you need at least 1.3.0 or better)
Install Deep Merge plugin: `vagrant plugin install deep_merge`
Install reload plugin: `vagrant plugin install vagrant-reload`
Install vbguest plugin: `vagrant plugin install vagrant-vbguest`
Startup Vagrant by executing `sudo vagrant up`
Connect to the server by executing `vagrant ssh cassandra1`
Connect to your Cassandra cluster `cqlsh 10.10.8.100`

## Notes

By default cluster of four machines is brought up. You can change the IP addresses of the machines, and the number of machines by modifying following map:

    servers = {
      :vcas01t => '10.10.8.101',
      :vcas02t => '10.10.8.102',
      :vcas03t => '10.10.8.103'
    }

kairosdb server - vmgmt01t => 10.10.8.100

    
