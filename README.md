# linux-tips-and-tricks
Linux tips and tricks

## Set Static IP
```
iface eth0 inet static
  address 10.0.0.X
  netmask 255.255.255.0
  network 10.0.0.0
  broadcast 10.0.0.255
  gateway 10.0.0.X
  dns-nameservers 10.0.0.X X.X.X.X
```

## Enable auto login
```bash
sudo systemctl edit getty@tty1.service
```
#### Add
```
[Service]
ExecStart=
ExecStart=-/sbin/agetty --noissue --autologin alexandre %I $TERM
Type=idle
```

## Turn off screen
```bash
#! /bin/bash
setterm -blank force
```
## Turn on screen
```bash
#! /bin/bash
setterm -blank poke
```
