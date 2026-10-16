# Services

What ran on the home server at the October 2026 audit, and what each
service is for. Everything is containerized and managed from a single
compose setup, except the system-level services listed at the end.

| Service | Purpose | Audience |
|---|---|---|
| File sync | Self-hosted file sync and share on the redundant array. It also syncs the agent fleet's shared notes | Internal |
| LazarusOS | In-house business management app for the repair side: tickets, invoices, customers, checklists. Web, desktop and mobile | Internal (staff) |
| MotorLog | Vehicle and equipment maintenance SaaS with paying users. Separate beta and production channels | Public product |
| Business website | The company's marketing site, plus a staging copy and a contact-form service | Public website |
| Business email | Business mail | Internal |
| DNS filtering | Network-wide ad and tracker blocking | Internal |
| Push alerts | Fleet notifications to the owner's phone | Internal |
| Software package archive | Signed package archive for the CovenantOS phone-OS project | Internal |
| Client church website | Release candidate for a client, awaiting its production hardware | Preview |

**System-level:** routing and firewall, the router admin interface, UPS
monitoring and coordinated shutdown, system metrics, disk-health and array
monitoring, and the Nehemiah agent. Nehemiah is a persistent Claude Code
session started at boot.

## In-house software

Most of the business software is built in-house by the agent fleet with
the owner:

- **LazarusOS:** the business's internal management app.
- **MotorLog:** a SaaS product. A written beta-to-production promotion
  process gates each release.
- **Business website:** static, with accessibility testing on every
  release.
- **Router admin interface:** staged changes with automatic rollback.
- **CovenantOS:** an experimental Debian-based phone OS.

Status for each project is in [projects-and-roadmap.md](projects-and-roadmap.md).
