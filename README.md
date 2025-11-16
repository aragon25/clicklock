# clicklock

Lightweight screen locker for touch kiosk devices (inspired by `slock`). Designed to ignore the first accidental touch on a blanked touchscreen.

## 📌 Features

- Ignore first touch event to avoid blind clicks on a sleeping touchscreen
- Minimal dependencies, intended for kiosk environments

---

## 📂 Installation

### Install via .deb package

The latest `.deb` installer can be found in the repository’s **Releases** section.

1. Download the latest release package:
   ```bash
   wget https://github.com/aragon25/clicklock/releases/download/v0.1-3/clicklock_0.1-3_all.deb
   ```

2. Install the package:
   ```bash
   sudo apt install ./clicklock_0.1-2_all.deb
   ```

---

## ⚙️ Running

Start the locker from your session startup or manually:

```bash
xssstart clicklock
```

Use your display/session manager to call `xssstart clicklock` at screensaver or on-demand.

---

## ⚠️ Safety / Packaging notes

- The repository contains packaging hooks under `deploy/config/`. Always inspect `preinst`/`postinst` scripts before installing packages on production systems.
- Test `.deb` installers in a disposable VM or container — avoid running untrusted installers on critical hosts.

---

## Examples

Run manually:
```bash
xssstart clicklock
```
