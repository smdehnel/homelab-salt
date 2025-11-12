# /srv/homelab-salt/lab-states/roles/pihole/init.sls

{% set pihole = pillar.get('pihole', {}) %}

include:
  - common

pihole-base:
  pkg.installed:
    - pkgs:
      - curl
      - net-tools
      - lighttpd
      - php
      - php-common
      - php-cli
      - php-sqlite3
      - dnsutils
      - iproute2
      - netcat
    - refresh: True
    - ignore_missing: True

/etc/hosts:
  file.managed:
    - source: salt://roles/pihole/files/hosts.tmpl
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - context:
        hostname: {{ grains['id'] }}
        ip: {{ grains['fqdn_ip4'][0] }}

/etc/resolv.conf:
  file.managed:
    - source: salt://roles/pihole/files/resolv.conf
    - user: root
    - group: root
    - mode: 644

/etc/dnsmasq.d/50-lab.conf:
  file.managed:
    - source: salt://roles/pihole/files/50-lab.conf
    - user: root
    - group: root
    - mode: 644
    - makedirs: True

# drop the installer script
/srv/pihole/install-pihole.sh:
  file.managed:
    - source: salt://roles/pihole/files/install-pihole.sh
    - user: root
    - group: root
    - mode: 755
    - makedirs: True

# run the installer ONLY if pi-hole isn't installed yet
install-pihole:
  cmd.run:
    - name: /srv/pihole/install-pihole.sh {{ pihole.get('web_password', '') }}
    - unless: test -f /etc/pihole/setupVars.conf
    - require:
      - file: /srv/pihole/install-pihole.sh
      - pkg: pihole-base
