{# /srv/lab-states/os/debian.sls #}
debian-base:
  pkg.installed:
    - pkgs:
      - vim
      - curl
      - ca-certificates

{% set osrelease = grains.get('osrelease', '') %}
{% if osrelease not in ['23.10', 'mantic'] %}

apt-update:
  pkg.uptodate:
    - refresh: True

{% else %}
skip-apt-update-mantic:
  test.show_notification:
    - text: "Skipping apt update on EOL mantic host"
{% endif %}
