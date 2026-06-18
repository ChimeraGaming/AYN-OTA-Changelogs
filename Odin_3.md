# AYN Odin 3 - Software Changelog

## 2026
<details>
<summary>View 2026 updates</summary>

### Odin 3 OTA Update (2026-06-17)
<details>
<summary>View changes</summary>

1. Updated the GPU driver to version 800.72, addressing GPU hang issues in graphics-intensive titles such as Zenless Zone Zero.
2. Resolved an issue where the microphone remained silent during WeChat voice calls.
3. Corrected abnormal resolution display when connecting to AR glasses.
4. Fixed random crashes encountered while launching PUBG Mobile.
5. Addressed a bug preventing the input method pop-up from appearing during wireless Shizuku pairing.
6. Corrected inaccurate battery cutoff current readings in specific apps like Battery Monitor.apk.

</details>

### Odin 3 v1.0.0.151 (2026-02-04)
<details>
<summary>View changes</summary>

- Added **Ultra Dark Mode** in Odin Settings to reduce color shift in low-brightness, low-gray-scale, and dark environments.
- Resolved multiple SD card performance issues:
  - Reduced folder loading time in the File app when many files are present.
  - Significantly improved ROM loading speed in the Pegasus frontend.
  - Improved slow transfer speeds when copying from internal storage to SD card.
  - Fixed extremely slow read speeds (300 KB/s to 6 MB/s) on some exFAT-formatted SD cards.
- Fixed low benchmark scores and frame drops when the device was not connected to power.
- Fixed an issue where the Dock failed to output video via DisplayPort if power was connected before docking the unit.
- Fixed temporary white line artifacts when using shaders/filters in emulators.
- Optimized joystick calibration functionality.
- Fixed missing vibration during game streaming sessions.
- Added custom fan control functionality.

</details>
</details>

---

## 2025
<details>
<summary>View 2025 updates</summary>

### Odin 3 OTA Update (2025-12-04)
<details>
<summary>View changes</summary>

- Added support for Charge Separation and Charge Limit to improve battery longevity.
  - Supported limits: 80% charge limit, 9V3A charge limit, and 5V3A charge limit.
- Added OLED anti-image retention and burn-in protection (enabled by default).
- Added built-in pixel shifter for OLED longevity.
- Added built-in pixel refresher capable of clearing transient image retention in ~9 seconds.

</details>
</details>