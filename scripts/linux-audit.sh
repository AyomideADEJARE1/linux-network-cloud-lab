#!/usr/bin/env bash
set -u

echo "=== LINUX SYSTEM AUDIT ==="
echo "Date: $(date)"
echo "Hostname: $(hostname)"
echo "User: $(whoami)"
echo "Groups: $(id -nG)"
echo "OS:"
cat /etc/os-release | grep -E '^(PRETTY_NAME|VERSION)='
echo
echo "=== FILESYSTEM ==="
df -h /
echo
echo "=== MEMORY ==="
free -h 2>/dev/null || true
echo
echo "=== RUNNING PROCESSES ==="
ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 10
echo
echo "=== NETWORK INTERFACES ==="
ip -brief address 2>/dev/null || hostname -I
echo
echo "=== ROUTES ==="
ip route 2>/dev/null || true
echo
echo "=== DNS CONFIGURATION ==="
cat /etc/resolv.conf 2>/dev/null || true
echo
echo "=== SSH DIRECTORY PERMISSIONS ==="
if [ -d "$HOME/.ssh" ]; then
  ls -ld "$HOME/.ssh"
  find "$HOME/.ssh" -maxdepth 1 -type f \
    -printf '%M %f\n' 2>/dev/null || true
else
  echo "No SSH directory found for this user."
fi
echo
echo "=== SERVICE STATUS ==="
for service in nginx apache2 ssh; do
  if command -v systemctl >/dev/null 2>&1; then
    systemctl is-active "$service" 2>/dev/null \
      || echo "$service: not active or unavailable"
  fi
done
