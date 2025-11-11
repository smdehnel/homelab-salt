{# /srv/homelab-salt/lab-states/os/rocky.sls #}
rocky-base:
  pkg.installed:
    - pkgs:
      - vim-enhanced
      - curl
      - net-tools
      - dnf-plugins-core
    - ignore_missing: True  

dnf-update:
  pkg.uptodate:
    - refresh: True

{% if pillar.get('selinux', {}).get('mode') == 'permissive' %}
disable-selinux:
  cmd.run:
    - name: |
        if selinuxenabled; then
          setenforce 0
          sed -i 's/^SELINUX=enforcing/SELINUX=permissive/' /etc/selinux/config
        fi
    - unless: getenforce | grep -qi permissive
{% endif %}
