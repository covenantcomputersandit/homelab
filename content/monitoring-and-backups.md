# Monitoring, alerting and backups

## Monitoring

| Layer | What's watched |
|---|---|
| Disks | SMART health on every disk |
| Storage array | Alerts on any degraded state, plus a monthly full consistency check |
| System | Real-time metrics, and health snapshots every minute for the fleet dashboard |
| Network | Automatic detection of and recovery from upstream link loss |
| Power | UPS monitoring with coordinated, automatic shutdown across machines |
| Services | Container health checks, plus agent check-ins every few hours |
| Build server | Temperature, memory, disk and service watchers that alert on state changes |
| Fleet | A daily audit by Gabriel; push alerts to the owner's phone |

## Backups

The **backup system is being rebuilt.** Storage sits on a RAID 6 array,
which keeps data available through disk failures. The rebuilt backup
layer adds:

1. **Versioned local backups:** nightly, deduplicated and kept on a
   separate disk, with daily, weekly and monthly retention.
2. **An encrypted off-site copy,** following the 3-2-1 rule: three copies,
   on two kinds of media, with one off-site.
3. **Regular restore tests,** each one logged.
4. **Alerting** when a backup fails or doesn't run.

The mini-rack project's dedicated storage makes a natural local target.
See [projects-and-roadmap.md](projects-and-roadmap.md).
