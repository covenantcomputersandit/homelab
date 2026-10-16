# Network design

This page covers design principles and plans only. Addresses, layout,
access methods and product specifics are left out on purpose.

## Today

- The home server handles routing, the firewall, DHCP and network-wide
  DNS ad blocking for the house. The ISP's router is retired and kept as
  a spare.
- Routing is deliberately independent of the application stack and the
  storage array, so a problem with one doesn't take down the other.
- Router changes go through a self-hosted admin interface. Every change is
  staged and rolls back automatically unless it's confirmed, so a mistake
  can't lock anyone out.
- Administration happens only over private, authenticated channels. Admin
  tools are not published to the internet.

## Where it's going

A dedicated router appliance is part of the [mini-rack
project](projects-and-roadmap.md#10u-printed-mini-rack). With routing on
its own box, server maintenance and network uptime are independent of
each other. The current setup stays as a tested fallback.

## Planned segmentation

The network will be split into separate segments by trust level:

| Segment | Who's on it | Policy |
|---|---|---|
| Main | Owner's computers, phones, servers, home hub | Full access |
| Work | Business devices | Kept apart from household traffic |
| IoT | Cloud-only smart devices | Internet only |
| Guest | Visitors | Internet only, with client isolation |
| Cameras | Future security cameras | No internet access; recorder and owner viewing only |

Design principles:
- **Carve devices out; don't rebuild.** Existing devices stay put, and
  new segments are added one at a time. Every step can be reversed.
- **Apple Home and Matter devices stay together with the phones.** That
  avoids the fragile multicast and IPv6 relaying cross-segment smart-home
  setups need.
- **Log first, then enforce.** New firewall rules start in logging mode,
  so hidden dependencies show up before anything breaks.
- **Management stays on the trusted segment**, so the network gear can't
  be locked out.
