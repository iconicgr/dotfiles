Fixing local resolution to 127.0.1.1

``` sh
configure
set system ip override-hostname-ip 192.168.100.1
set system static-host-mapping host-name Berg-RNT-RT-1 inet 192.168.100.1
commit
save
exit
```
