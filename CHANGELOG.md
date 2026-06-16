# Changelog

All notable changes to AegisConsole Desktop are documented here.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- **On-prem desktop app** (Windows / macOS / Linux) built with Tauri — runs the
  full AegisConsole UI locally against an AegisDB node you run yourself.
- **Local connector** that intercepts the console's API calls and routes them to
  your local node, with single-tenant namespacing so data shapes match the cloud.
- **Account-less local mode** — the app opens straight into the console; no login.
- **Link to Cloud** — one click opens hosted signup / checkout in your system
  browser to upgrade to the managed cloud; your account is provisioned after
  payment. The connection target is restricted to an allow-list of official hosts.
- **In-app Connect dialog** to point the app at your node URL and credentials
  (persisted locally; never transmitted anywhere but your node).
- **Hardening**: release binaries are symbol-stripped with link-time optimization
  and compile-time string/control-flow obfuscation; the bundled UI is minified and
  identifier-mangled; runtime anti-tamper / anti-debugger guards lock the app on
  detection.
- **Reproducible releases**: CI publishes signed builds with **SLSA provenance
  level 3** attestation over every installer.

### Security
- The external-link guard matches the destination host exactly (no prefix/suffix
  spoofing) on both the UI and native sides.

[Unreleased]: https://github.com/AutomataNexus/AegisConsole-Desktop/commits/main
