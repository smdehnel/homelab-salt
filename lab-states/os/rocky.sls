rocky-base:
  pkg.installed:
    - pkgs:
      - vim
      - curl
      - net-tools
      - dnf-plugins-core

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
