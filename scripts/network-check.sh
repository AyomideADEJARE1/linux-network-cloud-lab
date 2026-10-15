#!/usr/bin/env bash
set -u

HOST="${1:-example.com}"

echo "=== NETWORK CONNECTIVITY CHECK ==="
echo "Target: $HOST"
echo
echo "=== IP ADDRESSES ==="
hostname -I 2>/dev/null || true
echo
echo "=== ROUTING TABLE ==="
ip route 2>/dev/null || true
echo
echo "=== DNS RESOLUTION ==="
if command -v getent >/dev/null 2>&1; then
  getent ahosts "$HOST" || echo "DNS lookup failed for $HOST"
else
  echo "Install DNS utilities if getent is unavailable."
fi
echo
echo "=== HTTP CONNECTIVITY ==="
if command -v curl >/dev/null 2>&1; then
  curl -sS -I --connect-timeout 5 "https://$HOST" \
    | head -n 5 || true
else
  echo "curl is not installed."
fi
echo
echo "=== LISTENING PORTS ==="
if command -v ss >/dev/null 2>&1; then
  ss -lnt
else
  echo "Install iproute2 to inspect listening ports."
fi
