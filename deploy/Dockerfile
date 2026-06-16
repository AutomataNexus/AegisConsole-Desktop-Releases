# AegisConsole — self-hosted web console image.
#
# Serves the SAME obfuscated console UI as the desktop app (ui-dist/) via nginx,
# and reverse-proxies the console's API calls to the AegisDB node you point it at.
# Teams who prefer not to install a desktop app can run this in Docker or k8s.
#
# ui-dist/ is produced by the release pipeline (obfuscated; no readable source).
# Build context must contain ui-dist/ and deploy/.
FROM nginx:1.27-alpine

LABEL org.opencontainers.image.title="AegisConsole" \
      org.opencontainers.image.description="Self-hosted AegisConsole web UI for an on-prem AegisDB node" \
      org.opencontainers.image.vendor="AutomataNexus LLC" \
      org.opencontainers.image.source="https://github.com/AutomataNexus/AegisConsole-Desktop-Releases" \
      org.opencontainers.image.licenses="LicenseRef-Proprietary"

# Obfuscated UI assets.
COPY ui-dist/ /usr/share/nginx/html/

# nginx config is rendered from this template at start via the official
# envsubst mechanism (${AEGIS_NODE_URL} is substituted).
COPY deploy/nginx.conf.template /etc/nginx/templates/default.conf.template

# Inject the browser runtime config (same-origin node, optional creds) at start.
COPY deploy/docker-entrypoint.d/25-aegis-config.sh /docker-entrypoint.d/25-aegis-config.sh
RUN chmod +x /docker-entrypoint.d/25-aegis-config.sh

# The node the console proxies to (server-side). Override at run time.
ENV AEGIS_NODE_URL="http://aegisdb:9090"

EXPOSE 80
HEALTHCHECK --interval=30s --timeout=3s --retries=3 \
  CMD wget -qO- http://127.0.0.1/ >/dev/null 2>&1 || exit 1
