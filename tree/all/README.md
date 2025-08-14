---
markmap:
  color:
    - blue
  initialExpandLevel: 4
  # other options
---


---
<!-- work -->
---
# now
## work.bb.pure
## work.d.pure
## work.d.pure2


<!-- opensync -->
# ovsh <!-- markmap: foldAll -->
## show
### simple
- `ovsh s Manager`
### filter rows
- `ovsh s Manager is_connected`
- `ovsh s Manager is_connected status`
### get value
- `ovsh s Manager is_connected status -r`
### json
- `ovsh s Manager is_connected -j`
### filter name and value
- `ovsh s Manager -w is_connected==true is_connected status`
## update
## Manager
## AWLAN_Nodes
## Netfilters
## IPv4_Neighbors
---
# opensync v6.4
---
# FRV 4.0.0
## cloud
### bssid
- `cloud home-bssids-get`
  - Get 2.4G / 5G bssid: mac address form
## client
### connect
- wifi 
  - `client connect --bssid <gw_node_bssid> w1`
- eth
  - `client eth-connect l1 e2`
### ssh
- `client ssh w1`
- `client ssh e2`
## test case
### case id: 2451393 (port forwarding: pass)
### case id: 2476779 (upnp: failed)
#### w1 connect to home-ap
- w1 connect to gw
  - `cloud home-bssids-get`
  - `client connect --bssid <gw_node_bssid> w1`
- e2 connect to l1
  - `client eth-connect l1 e2`
- e2 send upnp port forward
  - `client ssh e2`
    - `ip -4 -br a`
    - `upnpc -a <client_e2_ip> 5469 5469 TCP`
    - `upnpc -a <client_e2_ip> 5469 5469 UDP`
- check sttaus
  - `ssh leaf1`
    - `wpa_cli -i wl0 status`
---
# osrt1 <!-- markmap: foldAll -->
## env
- IP: `192.168.188.101`
## config/locations
- PBL-6201_OSRT1_DEV.yaml
## config/model_properties

# ssdp / upnp
## tcpdump
- `tcpdump -i br0 udp port 1900 -vvv`
## interface offloading
- `ethtool -K br0 tx off`
## ssh x tcpdump x wireshark x vncserver
- vncserver
  - `realpath $(which vncserver)`
  - `vncpasswd`
  - `vncserver :99`
    - port: 5900 + <display number>
      - 5999
  - macbook
    - `cmd + space`
    - search `screen sharing`
    - vnc://192.168.2.33:5999
  - `vncserver -kill :99`
- ssh x tcpdump x wireshark
  - `DISPLAY=:99 ssh rpi4 tcpdump -i  eth0 -U -w  - 'not port 22' | wireshark -k -i -`


# opensync
## ssid
- home ap ssid
  - wl*
- we.piranha
  - wl*.2 
- we.backhaul
  - wl*.3 
## list bridge
- `ovs-vsctl list-br`
## hostapd
- `hostapd_cli -p /var/run/hostapd-wl0 interface`
- `hostapd_cli -p /var/run/hostapd-wl0 -i wl0.3 get_config`
- dirs / files
  - `/var/run/hostapd-wl*/`
  - `/var/run/hostapd-wl*.config`
  - `/var/run/hostapd-wl*.pskfile`
## we.backhaul (testing...)
### config  pskfile
- `cat hostapd-wl*.3.config`
- `cat hostapd-wl*.3.pslfile`
### test
- sta pc
  - `rfkill`
  - `rfkill unlock`
  - `rfkill unlock 1 -o SOFT`
  - `sudo iw phy phy0 add interface sta0 type station`
  - `ovsh s Wifi_VIF_Config -w if_name==wl0.3 wpa_psks`
  - `ovsh u Wifi_VIF_Config -w if_name==wl0.3 wpa_psks:='["map", [["key--1", "newpasswd"]]]'`
  - `ovsh u Wifi_VIF_Config -w if_name==wl1.3 wpa_psks:='["map", [["key--1", "newpasswd"]]]'`
  - `hostapd_cli -p /var/run/hostapd-wl1 -i wl1.3 status | grep bssid`

---
<!-- English -->
---
# weather news report
- sunny, windy, cloudy, rainy, snowy
- temperature
- wind
- cloud

---
<!-- home --> 
---
# home <!-- markmap: foldAll -->
## Ralph
## Elly
## Stanley
## Jamie
# [FRV_4.0.0](FRV_4.0.0/index.html)
## [test-case](FRV_4.0.0/test-case/index.html)
### [upnp](FRV_4.0.0/test-case/upnp/index.html)
### [port-forwarding](FRV_4.0.0/test-case/port-forwarding/index.html)
#### [2476779](FRV_4.0.0/test-case/port-forwarding/2476779/index.html)
##### [003-e2-send-upnp-port-forward](FRV_4.0.0/test-case/port-forwarding/2476779/003-e2-send-upnp-port-forward/index.html)
##### [004-check-status](FRV_4.0.0/test-case/port-forwarding/2476779/004-check-status/index.html)
##### [001-w1-connect-to-gw](FRV_4.0.0/test-case/port-forwarding/2476779/001-w1-connect-to-gw/index.html)
##### [002-e2-connect-to-l1](FRV_4.0.0/test-case/port-forwarding/2476779/002-e2-connect-to-l1/index.html)
