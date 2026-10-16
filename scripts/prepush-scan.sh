#!/usr/bin/env bash
# Pre-push safety scan. Run before every push; exits non-zero on any finding.
#  1. gitleaks over the full git history and the working tree.
#  2. Pattern check for network identifiers (IPv4, MAC, VPN tailnet names).
#  3. Local-only denylist (.git/info/sensitive-terms, never committed): real
#     hostnames, usernames, domains — one term per line, case-insensitive.
set -euo pipefail
cd "$(git rev-parse --show-toplevel)"
fail=0
DOCKER=docker
docker info >/dev/null 2>&1 || DOCKER="sudo docker"

echo "== gitleaks (history)"
$DOCKER run --rm -v "$PWD:/repo:ro" zricethezav/gitleaks:v8.18.4 \
  detect --source /repo --redact --no-banner || fail=1
echo "== gitleaks (working tree)"
$DOCKER run --rm -v "$PWD:/repo:ro" zricethezav/gitleaks:v8.18.4 \
  detect --source /repo --no-git --redact --no-banner || fail=1

files=$(git ls-files; git ls-files --others --exclude-standard)

echo "== network identifiers"
# IPv4 (excluding version-like strings is not attempted: any dotted quad fails)
if grep -nE '\b([0-9]{1,3}\.){3}[0-9]{1,3}\b' $files; then fail=1; fi
# MAC addresses
if grep -niE '\b([0-9a-f]{2}[:-]){5}[0-9a-f]{2}\b' $files; then fail=1; fi
# Tailscale tailnet names / CGNAT-range VPN addresses
if grep -niE 'ts\.net|tail[0-9a-f]{6}' $files; then fail=1; fi

echo "== local denylist"
deny=.git/info/sensitive-terms
if [[ -s $deny ]]; then
  if grep -niwF -f "$deny" $files; then fail=1; fi
else
  echo "WARNING: $deny missing or empty"; fail=1
fi

if (( fail )); then echo "SCAN FAILED"; exit 1; fi
echo "SCAN CLEAN"
