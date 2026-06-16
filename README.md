# 📡 Yukon-for-Cact

<p align="center">
  <img src="https://img.shields.io/badge/version-2.0.0-green.svg?style=for-the-badge" alt="Version: 2.0.0">
  <img src="https://img.shields.io/badge/license-GPLv3-blue.svg?style=for-the-badge" alt="License: GPLv3">
  <img src="https://img.shields.io/badge/arch-i686-red.svg?style=for-the-badge" alt="Arch: i686">
  <img src="https://img.shields.io/badge/format-cctk-green.svg?style=for-the-badge" alt="Output: yukon.cctk">
  <img src="https://img.shields.io/badge/bus-PCI-blue.svg?style=for-the-badge" alt="PCI">
  <img src="https://img.shields.io/badge/irq-MSI--X-brightgreen.svg?style=for-the-badge" alt="MSI-X">
</p>

<p align="center">
  <strong>English.</strong> Out-of-tree <strong>Yukon</strong> Ethernet driver → <strong><code>yukon.cctk</code></strong>.<br>
  <strong>2.0.0:</strong> include paths updated — <code>Cact/kernel/net</code> → <code>Cact/net</code> to match kernel 2.0.0 directory layout.<br>
  <strong>Русский.</strong> Драйвер <strong>Yukon</strong> → <strong><code>yukon.cctk</code></strong>.<br>
  <strong>2.0.0:</strong> пути включения обновлены под новую структуру ядра.
</p>

---

## 🔨 Building

**Recommended — full workspace**

```sh
make -C CactOS-x86_32 iso
```

**Standalone**

```sh
make install   # auto-detects ../CactKernel-x86_32 and ../LocalRepoCactOS
make clean
```

Override paths if needed: `make KERN_ROOT=/custom/path LOCAL_REPO=/custom/path install`.
