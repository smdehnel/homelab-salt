wireguard-pkg:
  pkg.installed:
    - name: wireguard

/etc/wireguard:
  file.directory:
    - user: root
    - group: root
    - mode: 700

/etc/wireguard/wg0.conf:
  file.managed:
    - source: salt://roles/wireguard/wg0.conf.jinja
    - template: jinja
    - user: root
    - group: root
    - mode: 600
    - context:
        wg: {{ pillar.get('wireguard', {}) }}

/etc/systemd/system/wg-quick@wg0.service.d/override.conf:
  file.managed:
    - makedirs: True
    - contents: |
        [Unit]
        After=network-online.target
        Wants=network-online.target

wg-quick@wg0:
  service.running:
    - enable: True
    - require:
      - file: /etc/wireguard/wg0.conf
      - pkg: wireguard-pkg
