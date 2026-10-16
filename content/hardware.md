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
coding and business work. It is not a deployment target: features are
built and tested here, then packaged and shipped to the home server.
Live-audited by Bezalel.

| Component | Detail |
|---|---|
| CPU | AMD, 2 cores (low-power mobile chip with integrated graphics) |
| RAM | ~29 GiB |
| Disk | ~900 GB SSD, under a fifth used |
| OS | Debian Linux, with GNOME and KDE Plasma desktops both available at login, both in the company's theme |
| Dev tooling | Git, containers, Node.js, Python, VS Code with Claude Code, terminal multiplexer, media tools |

## Planned: 10U 3D-printed mini rack

Designed by Habakkuk. See
[projects-and-roadmap.md](projects-and-roadmap.md#10u-printed-mini-rack).
