base:
  'G@os:Rocky':
    - os.rocky
  'G@os_family:Debian':
    - os.debian

  'jellyfin.lab':
    - roles.wireguard
    - common
  'pihole1.lab':
    - roles.pihole
    - common
  '*':
    - common
