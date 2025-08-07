---
markmap:
  color:
    - blue
  initialExpandLevel: 2
  # other options
---

# wifi
# iw
## dev
## phy
## ap
## sta
## monitor
# wl
## cli
### vap
- `wl -i wl0 down; wl -i wl0 ssid -C 0 ""`
### country code
- `wl -i wl0 down; wl -i wl0 country US/857`
