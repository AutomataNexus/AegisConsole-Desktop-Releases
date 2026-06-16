# Privacy Policy

**AegisConsole Desktop** — AutomataNexus LLC
Last updated: 2026-06-15

This Privacy Policy explains how the AegisConsole Desktop application (the
"Software") handles information. AegisConsole Desktop is an on-premises client: by
design, it keeps your data local.

## 1. Data the Software does NOT collect

AutomataNexus does **not** collect, receive, or have access to:

- the contents of your AegisDB node (collections, documents, vectors, keys,
  time-series, graphs, or any data you store or query);
- your node connection settings (URL, username, password) — these are stored only
  on your device (in the app's local storage) and are sent only to the node you
  configure;
- usage analytics or telemetry. The Software contains no analytics SDKs and phones
  no home server during normal local operation.

## 2. Local storage on your device

The Software stores, locally on your machine:

- your node URL and credentials (so you don't re-enter them);
- UI preferences (such as theme).

This information never leaves your device except as part of the requests the
Software makes to the node **you** designate.

## 3. Optional "Link to Cloud" upgrade

If you choose to upgrade to the AutomataNexus managed cloud, the Software opens a
hosted signup and checkout page in your system browser. The handoff URL may
include non-sensitive context to streamline signup — for example, a flag
indicating the request came from the desktop app, your current (free) tier, and
the host portion of your node address (e.g. `127.0.0.1:9090`). It does **not**
include your node password or any stored data.

Any information you then submit on the hosted pages (such as your email and payment
details) is processed by the cloud service and its payment processor under the
[Terms of Service](TERMS.md) and the privacy policy published for that service. The
desktop Software is not involved in, and does not receive, that information.

## 4. Network connections

During normal use, the Software connects only to:

- the **local AegisDB node** you configure; and
- public CDNs for UI runtime assets (fonts and JavaScript libraries) and, only if
  you initiate it, the official AutomataNexus upgrade page.

## 5. Children

The Software is a developer/operator tool and is not directed to children under 13.

## 6. Changes

We may update this Policy; material changes will be reflected by the "Last updated"
date above and in the [changelog](CHANGELOG.md).

## 7. Contact

AutomataNexus LLC — privacy@automatanexus.com
