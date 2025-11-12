# Homelab Salt Changelog

All notable changes to this project will be documented here.  
This file follows [Semantic Versioning](https://semver.org/) and each version matches a Git tag.

---

## [v1.0.0] - 2025-11-11
### Added
- Initial Salt project structure using `/srv/lab-states` and `/srv/lab-pillar`
- Role-based directory layout (`roles/pihole`, `roles/wireguard`, etc.)
- Pi-hole automation:
  - Auto-install script with unattended setup
  - Salt-managed `/etc/hosts` template for lab DNS
  - Salt-managed `/etc/dnsmasq.d/50-lab.conf`
  - Per-host pillar configuration for `web_password`
- Rocky/Ubuntu OS base states with safe package handling
- Git version control and tagging baseline (`v1.0.0`)

### Notes
- Pi-hole upgrade-safe configuration (Salt does not manage Pi-hole core files)
- WireGuard and Zabbix states planned for next version

---

## [Unreleased]
### Planned
- WireGuard full automation and template sync
- Zabbix agent deployment and PSK integration
- Core homelab backup/restore state
