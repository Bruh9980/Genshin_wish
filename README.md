# 🌠 Genshin Wish Link Extractor (Termux)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Platform: Android](https://img.shields.io/badge/Platform-Android-brightgreen.svg)](#)
[![Tool: ADB](https://img.shields.io/badge/Tool-ADB%20Wireless-blue.svg)](#)

A powerful and automated shell script for **Termux** to extract your Genshin Impact Wish History link using **ADB Wireless Debugging**. No Root required! 

This tool captures the link directly from the game's log and automatically copies it to your clipboard for easy use on trackers like **Paimon.moe**.

---

## ✨ Features
- 🚀 **Auto-Installation**: Handles all dependencies (`android-tools`, `termux-api`) automatically.
- 🧠 **Smart Memory**: Remembers your last used connection port for faster access.
- ⚡ **Auto-Connect**: Detects existing ADB sessions and skips setup if already connected.
- 📋 **Auto-Clipboard**: Automatically copies the extracted link to your Android clipboard.
- 🛡️ **Safe & Clean**: No root access needed, uses official Android developer tools.

---

## 🛠️ Prerequisites

1.  **Termux**: Install via [F-Droid](https://f-droid.org/en/packages/com.termux/) (Play Store version is outdated).
2.  **Termux:API App**: Install via [F-Droid](https://f-droid.org/en/packages/com.termux.api/).
3.  **Wireless Debugging**: 
    - Enable **Developer Options** on your phone.
    - Turn on **Wireless Debugging**.

---

## 📥 Installation

Copy and paste the following command into your Termux:

```bash
git clone https://github.com/Bruh9980/Genshin_wish.git && cd REPO_NAME && chmod +x install.sh && ./install.sh
