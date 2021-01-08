admin@edgerouter# sudo -i
root@edgerouter:~# curl -s https://install.zerotier.com | sudo bash

*** ZeroTier One Quick Install for Unix-like Systems

*** Tested distributions and architectures:
***   MacOS (10.7+) on x86_64 (just installs ZeroTier One.pkg)
***   Debian (7+) on x86_64, x86, arm, and arm64
***   RedHat/CentOS (6+) on x86_64 and x86
***   Fedora (16+) on x86_64 and x86
***   SuSE (12+) on x86_64 and x86
***   Mint (18+) on x86_64, x86, arm, and arm64

*** Please report problems to contact@zerotier.com and we will try to fix.

*** Detecting Linux Distribution

*** Found Debian "stretch" (or similar), creating /etc/apt/sources.list.d/zerotier.list
OK

*** Installing zerotier-one package...
<cut>
*** Enabling and starting zerotier-one service...
Synchronizing state of zerotier-one.service with SysV service script with /lib/systemd/systemd-sysv-install.
Executing: /lib/systemd/systemd-sysv-install enable zerotier-one

*** Waiting for identity generation...

*** Success! You are ZeroTier address [ 5fca9e9471 ].

If the install successful you will get a ZeroTier address. If not, take a look at your firewall logs/settings. If successful you can join your ZeroTier network.

Persistent after firmware upgrade
To make ZeroTier config persistent after firmware updates, we need to move the /var/lib/zerotier to /config/script.

root@edgerouter:/etc# cd /var/lib
root@edgerouter:/var/lib# mv /var/lib/zerotier-one /config/scripts/
root@edgerouter:/var/lib# ln -s /config/scripts/zerotier-one
Possible after a firmware upgrade you may need to recreate the symlink again. But your ZeroTier networks will be preserved.

Map your ZeroTier interface
The part below is not necessary any more if you install my package to use the EdgeOS CLI.

The EdgeOS won't show and interact with your ZeroTier interface properly. This because it doesn't know how the handle a ztxxxxx interface. To work around we need to change the ztxxxxx interface name to a ethx name. To do this create a new file /var/lib/zerotier-one/devicemap with the following content.

Replace <zerotiernetworkid> with your ZeroTier network. If you have more network's then create a entry for each network with a unique ethx interface.

<zerotiernetworkid>=eth4
If you have an other Edgerouter model with more then 3 ethx ports, then increase the number 4 to a free one.
Then restart ZeroTier to create the new mapped interface.

root@edgerouter:~# /etc/init.d/zerotier-one restart
[ ok ] Restarting zerotier-one (via systemctl): zerotier-one.service.
root@edgerouter:~# ifconfig eth4
eth4: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 2800
        inet 10.122.12.95  netmask 255.255.255.0  broadcast 10.147.17.255
        inet6 fe80::6cb5:75ff:fe9a:e2  prefixlen 64  scopeid 0x20<link>
        ether 6e:b5:75:9a:00:e2  txqueuelen 1000  (Ethernet)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 7  bytes 738 (738.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
Enable new ethx interface in EdgeOS
Then to enable the interface in EdgeOS, do the following per interface. And change the description to your network id.

admin@edgerouter# set interfaces ethernet eth4 description "ZeroTier 1d73947417ceeb6e"
[edit]
admin@edgerouter# commit
[edit]
admin@edgerouter# save
Saving configuration to '/config/config.boot'...
Done
