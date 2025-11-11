# /srv/homelab-salt/lab-states/common/init.sls
base-pkgs:
  pkg.installed:
    - pkgs:
      - vim-enhanced
      - curl
      - git
    - ignore_missing: True
