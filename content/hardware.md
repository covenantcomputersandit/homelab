# Hardware inventory

Audited in October 2026. Serial numbers, network identifiers and software
versions are left out on purpose.

## Home server (always on)

Live-audited by Nehemiah, the agent that runs on it.

| Component | Detail |
|---|---|
| CPU | Intel Core i7, 4 cores / 8 threads |
| RAM | 32 GB |
| GPU | Discrete AMD GPU. The machine runs headless; the GPU is reserved for future video decoding |
| OS disk | NVMe SSD |
| Data array | 4 HDDs in RAID 6 (survives any two failing), about 1.8 TB usable |
| OS | Debian Linux |
| Power | Tower UPS, with coordinated shutdown of the fleet |

## Build / compute server

Hosts the Gabriel, Habakkuk and Oholiab agents, the fleet dashboards
(including local voice control), phone-OS builds and the mini-rack design
work. It is also a daily-use desktop. Live-audited by Habakkuk; summary in
[audit-build-server-2026-10.md](audit-build-server-2026-10.md).

| Component | Detail |
|---|---|
| CPU | AMD Ryzen 5, 6 cores / 12 threads |
| RAM | 32 GB |
| GPU | NVIDIA RTX, 6 GB |
| Storage | NVMe SSD (OS) plus a SATA SSD |
| OS | Debian Linux, KDE Plasma |

## Development laptop

Runs the Bezalel agent inside VS Code, and is the owner's main machine for
coding and business work.

> **Not live-audited.** The laptop was offline during this audit. The details below come from existing documentation.

| Component | Detail |
|---|---|
| CPU | AMD, 2 cores |
| RAM | ~29 GiB |
| OS | Debian Linux |

## Planned: 10U 3D-printed mini rack

Designed by Habakkuk. See
[projects-and-roadmap.md](projects-and-roadmap.md#10u-printed-mini-rack).
