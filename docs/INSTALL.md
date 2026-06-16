# Installation

Download the installer for your platform from the
[Releases](https://github.com/AutomataNexus/AegisConsole-Desktop-Releases/releases/latest)
page.

## Windows

1. Download `AegisConsole_<version>_x64-setup.exe`.
2. Run it. If SmartScreen appears, choose **More info → Run anyway** (the binary is
   unsigned by a commercial cert but carries SLSA provenance — see below).
3. Launch **AegisConsole** from the Start menu.

## macOS (Apple Silicon)

1. Download `AegisConsole_<version>_aarch64.dmg`.
2. Open the `.dmg` and drag **AegisConsole** to Applications.
3. First launch: right-click the app → **Open** (Gatekeeper prompt for apps
   distributed outside the App Store).

## Linux

**Debian / Ubuntu:**

```bash
sudo apt install ./aegis-console-desktop_<version>_amd64.deb
```

**Portable (AppImage):**

```bash
chmod +x aegis-console-desktop_<version>_amd64.AppImage
./aegis-console-desktop_<version>_amd64.AppImage
```

AppImage requires FUSE; on minimal systems install `libfuse2`.

## Verifying your download

Every release is built by CI and published with a SLSA Provenance level 3
attestation (`*.intoto.jsonl`). To verify an installer was produced by this
project's pipeline and not tampered with, use
[`slsa-verifier`](https://github.com/slsa-framework/slsa-verifier):

```bash
slsa-verifier verify-artifact <downloaded-file> \
  --provenance-path <the .intoto.jsonl from the release> \
  --source-uri github.com/AutomataNexus/AegisConsole-Desktop-Releases
```

A successful verification prints `PASSED: Verified SLSA provenance`.

## Uninstall

- **Windows**: Settings → Apps → AegisConsole → Uninstall.
- **macOS**: drag AegisConsole from Applications to the Trash.
- **Linux (deb)**: `sudo apt remove aegis-console-desktop`. AppImage: delete the file.

Your local AegisDB node and its data are never touched by installing or removing
this app.
