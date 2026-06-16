#!/bin/sh
# Runs AFTER nginx's envsubst step (20-). Fills the resolver placeholder from the
# container's own /etc/resolv.conf (portable across Docker + k8s), and renders the
# browser runtime config.
#
# The console connects SAME-ORIGIN (nodeUrl="") so the browser hits /api/v1/* and
# nginx proxies it to $AEGIS_NODE_URL. Optionally inject node credentials for the
# in-browser login flow (see deploy/DEPLOY.md for the security note).
set -eu
HTML="/usr/share/nginx/html"
CONF="/etc/nginx/conf.d/default.conf"

# Resolver: every nameserver from resolv.conf (127.0.0.11 in Docker; kube-dns in k8s).
RESOLVERS="$(awk '/^nameserver/ {print $2}' /etc/resolv.conf | tr '\n' ' ')"
[ -n "$RESOLVERS" ] || RESOLVERS="127.0.0.11"
sed -i "s/__AEGIS_RESOLVER__/${RESOLVERS}/" "$CONF"

# Browser runtime config.
{
  echo 'window.AEGIS_DESKTOP = window.AEGIS_DESKTOP || {};'
  echo 'window.AEGIS_DESKTOP.nodeUrl = "";'   # same-origin → nginx proxy
  [ -n "${AEGIS_NODE_USER:-}" ] && printf 'window.AEGIS_DESKTOP.nodeUser = "%s";\n' "$AEGIS_NODE_USER"
  [ -n "${AEGIS_NODE_PASS:-}" ] && printf 'window.AEGIS_DESKTOP.nodePass = "%s";\n' "$AEGIS_NODE_PASS"
} > "$HTML/aegis-runtime-config.js"

# Load the config right after the obfuscated runtime bundle (idempotent).
if ! grep -q "aegis-runtime-config.js" "$HTML/index.html"; then
  sed -i 's#<script src="runtime.min.js"></script>#<script src="runtime.min.js"></script>\n<script src="aegis-runtime-config.js"></script>#' "$HTML/index.html"
fi

echo "aegis: resolver=[${RESOLVERS}] node=[${AEGIS_NODE_URL:-unset}] config rendered"
