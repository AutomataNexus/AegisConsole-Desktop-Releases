# Self-hosting the AegisConsole web console (Docker / Kubernetes)

Prefer not to install a desktop app? Run the **same obfuscated console UI** as a
container and point it at your AegisDB node. nginx serves the UI and proxies the
console's `/api/v1/*` calls to your node (same-origin — no CORS setup).

> This is a thin web client. It bundles **no backend, no SIEM, and no secrets
> store** — your AegisDB node, your network security, and your data all stay in
> your environment.

## Docker

```bash
docker run -d --name aegisconsole -p 8080:80 \
  -e AEGIS_NODE_URL="http://your-aegisdb-host:9090" \
  ghcr.io/automatanexus/aegisconsole-desktop:latest
# open http://localhost:8080
```

Or with Compose (`deploy/docker-compose.yml`):

```bash
docker compose -f deploy/docker-compose.yml up -d
```

| Env var | Purpose | Default |
|---|---|---|
| `AEGIS_NODE_URL` | where nginx proxies `/api/v1/*` (server-side) | `http://aegisdb:9090` |
| `AEGIS_NODE_USER` | optional node username for the in-browser login | — |
| `AEGIS_NODE_PASS` | optional node password for the in-browser login | — |

## Kubernetes

```bash
kubectl apply -f deploy/k8s/aegisconsole.yaml
```

Then:
1. Edit the `aegisconsole-config` ConfigMap `AEGIS_NODE_URL` to your node Service.
2. Set the Ingress `host` to your domain (add TLS via your ingress/cert-manager).
3. (Optional) populate the `aegisconsole-node-creds` Secret.

## Security notes

- **Put the console behind your own authentication / ingress.** It is a console to
  your database — treat access to it as access to your node.
- **Node credentials:** if you set `AEGIS_NODE_USER/PASS`, they are delivered to the
  browser so the console can log in to the node. That is acceptable for a trusted,
  access-controlled internal deployment. If you don't want credentials in the
  browser, run the console without them and keep the node reachable **only** through
  the console's proxy on a private network, or front the node with your own auth.
- The node should not be exposed publicly; only the console proxy needs to reach it.

## Want managed security / vaulting?

AegisConsole Desktop deliberately ships **without** NexusShield (SIEM/threat
detection) or NexusVault (secrets vaulting) — those run in your environment, not in
this client. If you'd like local secret vaulting or a managed security/SIEM layer
for your on-prem deployment, reach out: **devops@automatanexus.com**.

## Verifying the image

Container images are published with build provenance. Verify before deploying:

```bash
gh attestation verify oci://ghcr.io/automatanexus/aegisconsole-desktop:<tag> \
  --owner AutomataNexus
```
