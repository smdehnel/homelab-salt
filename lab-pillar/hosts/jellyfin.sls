include:
  - common.hosts_map
hostname: jellyfin.lab
ip_address: 10.1.1.14
wireguard:
  interface:
    name: wg0
    address: 10.0.69.4/32
    private_key: aGmr7FBT9H8om1Psb6qBbvm8J7aMNOpNSq2KXeq4UVQ=
  peer:
    public_key: o7LrTmG9b9IdYl8XxvLpUGsd/sdUQwxEDEnI88r0eWM=
    endpoint: 10.1.1.10:51820
    allowed_ips:
      - 10.0.69.0/24
    persistent_keepalive: 21
