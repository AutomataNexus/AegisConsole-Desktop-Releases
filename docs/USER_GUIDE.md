# AegisConsole Desktop — User Guide

AegisConsole Desktop gives you the complete AegisConsole experience on your own
machine, talking directly to an AegisDB node you run. This guide covers everyday
use.

## Contents

1. [Concepts](#concepts)
2. [First launch](#first-launch)
3. [Connecting to your node](#connecting-to-your-node)
4. [The workspace](#the-workspace)
5. [Working with data](#working-with-data)
6. [The paradigms](#the-paradigms)
7. [Upgrading to the cloud](#upgrading-to-the-cloud)
8. [Privacy & security](#privacy--security)
9. [Troubleshooting](#troubleshooting)

## Concepts

- **Local mode** — on-prem, the app runs without an account. It opens straight into
  the console as the local owner. Everything you do happens against *your* node.
- **Your node** — an AegisDB instance you operate (default `http://127.0.0.1:9090`).
  The app is a client; it stores and reads nothing except through your node.
- **Cloud upgrade** — an optional, one-click path to AutomataNexus managed hosting.

## First launch

Start your AegisDB node, then launch AegisConsole. It opens directly to the
**Overview**. If your node is on the default `http://127.0.0.1:9090` and needs no
auth, you're ready to go.

## Connecting to your node

If your node is elsewhere or requires credentials, open the **Connect** dialog and
set:

| Field | Example |
|---|---|
| Node URL | `http://127.0.0.1:9090` or `http://10.0.0.5:9090` |
| Username | your node user |
| Password | your node password |

These are saved **locally on your device only** and are sent only to the node you
specify. They are never transmitted to AutomataNexus.

## The workspace

- **Overview** — node health and a snapshot of your collections and activity.
- **Explorer** — browse collections and documents.
- **Query** — run AegisQL/SQL, document, time-series, KV, and graph queries.
- **Key-Value**, **Graph**, **Schema** — manage those stores directly.
- **Paradigms** — dedicated pages for each of the seven post-v1 engines.
- **Metrics / Streams** — live observability for your node.
- **Node / Settings** — node info and app preferences.

Pages that only apply to managed/multi-tenant cloud deployments (billing, team
management, platform admin) are hidden in local mode.

## Working with data

- **Create a collection**: Explorer → **New collection** → name it.
- **Insert a document**: open a collection → **Insert** → paste JSON.
- **Query**: Query page → pick a language → write your query → **Run**. SQL runs
  against your local database namespace.
- **Key-Value**: set, view, and delete keys on the Key-Value page.
- **Graph**: add nodes and edges and explore relationships on the Graph page.

## The paradigms

Each paradigm has its own page where you create and manage containers and run
operations:

| Paradigm | Use it for |
|---|---|
| Vector | similarity search / embeddings |
| Full-Text | keyword and phrase search |
| Geospatial | location and region queries |
| Columnar | analytical scans |
| Object Store | blobs and files |
| Wide-Column | large sparse tables |
| Ledger | append-only, verifiable history |

## Upgrading to the cloud

When a single on-prem node isn't enough, click **Link to Cloud** in the sidebar.
This opens the hosted signup and checkout in your system browser. After you sign up
and (if applicable) complete payment, your managed account and organization are
provisioned for you automatically — sign in to the cloud console to pick up where
you left off.

The app only opens official AutomataNexus pages for this; the handoff carries no
secrets (your node password is never included).

## Privacy & security

- The app sends your data only to the node you configure. See the
  [Privacy Policy](../PRIVACY.md).
- Releases are reproducibly built and carry SLSA Provenance L3 — verify any
  download per [INSTALL.md](INSTALL.md#verifying-your-download).

## Troubleshooting

**The console shows no data / "node unreachable".**
Confirm your node is running and reachable at the URL in **Connect**. For a local
node, `curl http://127.0.0.1:9090/api/v1/...` from the same machine should respond.

**Authentication errors.**
Re-enter your node username/password in the **Connect** dialog.

**A cloud-only page is missing.**
That's expected in local mode — billing, team, and platform pages appear only in the
managed cloud.

**Need help?**
Open an [issue](https://github.com/AutomataNexus/AegisConsole-Desktop-Releases/issues)
or email support@automatanexus.com.
