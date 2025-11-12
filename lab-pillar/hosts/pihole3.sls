include:
  - common.hosts_map
roles:
  - pihole

pihole:
  interface: eth0
  web_password: "ChangeThisLater"
  dns_upstreams:
    - 1.1.1.1
    - 8.8.8.8
  static_ip: 10.1.1.21
  gateway: 10.1.1.1
