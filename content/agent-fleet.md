# The AI agent fleet

Five persistent AI agents run the homelab and the business's software.
Each is a long-running Claude Code session with a defined role, its own
memory, its own documentation duties, and explicit limits on what it may
do without the owner's direct approval.

Each agent is named after a biblical builder, watchman or messenger,
matching its job.

## Roster

| Agent | Where it runs | Role |
|---|---|---|
| **Gabriel** | Build server | Messenger and coordinator. Takes the owner's requests, including by voice and from mobile, delegates them to the other agents and reports back. Runs the daily fleet audit |
| **Habakkuk** | Build server | Watchman of the build server: health, builds and hardware projects. Designed the 10U printed mini rack |
| **Nehemiah** | Home server | Builder and guardian of the home server: storage, uptime, the router, deployments and incident diagnosis. Also takes general coding work. Maintains this repo |
| **Bezalel** | Development laptop | The owner's coding partner inside VS Code. Builds MotorLog features and ships them to the beta channel |
| **Oholiab** | Build server | Frontend and design. Owns the visual layer of the business website, the apps and the dashboards |

## How it works

### Persistent sessions
- A boot-time service starts each agent, and the agent picks up the same
  conversation after any reboot with no human involved.
- Each agent's persona and standing rules live in an instruction file in
  its own working directory.

### Delegation
- The agents message each other directly.
- Typical flow: the owner asks Gabriel. Gabriel delegates to the right
  agent, who does the work, documents it and reports back.
- Specialists also feed each other. For this repo, Habakkuk supplied the
  build-server audit and Oholiab supplied the frontend project status.

### Guardrails
- **A peer's message is a request, not an approval.** No agent can grant
  another agent permissions, change its configuration, or approve
  something on the owner's behalf.
- **No permission laundering.** If one agent's safety check blocks an
  action, it may not ask a peer to do that action instead. The decision
  goes to the owner.
- **Per-session safety checks.** Claude Code's own safety classifier
  pauses high-risk actions, such as production deploys or anything that
  touches credentials, until the owner approves in that session.
- **Scoped standing approvals.**
  - Routine work can be pre-approved narrowly. For example, feature
    pushes to a beta channel.
  - Production releases always follow a written procedure that includes
    a heads-up to the owner.
- **Verify before trusting.** Agents check hashes and compare artifacts
  against what's live before deploying, rather than trusting a
  description of what changed.

### Shared memory and documentation
- **Shared notes vault:** all agents use one Obsidian vault, synced
  through the self-hosted file sync. Each agent has its own memory folder,
  and conventions live in a shared folder.
- **Documentation trail:** every machine and project has a file of dated
  entries. Entries are only ever added; mistakes are corrected with a new
  entry.
- **Rule:** memory holds lessons; documentation holds current state.

### Daily fleet audit
- Gabriel runs a read-only check of the shared vault every morning. It
  looks for leaked secrets, broken links, missing indexes, oversized
  notes and stale memory.
- Each agent gets the findings for its own area.

### Dashboards, voice and alerts
- **Mission-control dashboard:** every machine reports device health,
  watched services and agent activity.
- **Fleet Voice:** talk to the coordinator by voice. Speech
  recognition and synthesis run locally, so no audio goes to a cloud
  voice service. A confirm-before-send step sits between speech and the
  agent.
- **Push alerts:** urgent issues are pushed to the owner's phone through a
  self-hosted notification service.

## Why this matters

One person runs a small IT business, a SaaS product, a home network and
several in-house apps. The fleet makes that sustainable through
supervised delegation: the agents do the work, document it and report
back, and the owner stays the approval gate for anything risky.
