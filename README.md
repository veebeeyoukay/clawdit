# 🎬 Clawdit — The Black Box Recorder for AI Agents

**See what your AI actually did.**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

---

## The Problem

You're running OpenClaw, Claude Code, or another AI agent on your machine. It has access to your files, your shell, your API keys. But when something goes wrong — or when compliance asks what happened — you have no record. No audit trail. No proof.

Nobody is watching what your agent actually does once it's running.

## The Solution

Clawdit is an open-source CLI tool that captures every tool call, decision, and output your AI agent makes — locally, on your machine, in an immutable audit log you can query and report on.

**One binary. No cloud. No account. No infrastructure.**

Install it. Point it at your agent. Know exactly what happened.

## What It Does

- **Captures everything** — every tool invocation, input, output, timestamp, and agent identity
- **Queries instantly** — `clawdit query --tool file_export --since monday`
- **Generates compliance reports** — HTML reports mapped to OWASP Agentic AI Top 10 & AIUC-1
- **Detects anomalies** — frequency spikes, credential leaks, file access boundary violations
- **Replays decisions** — `clawdit replay --event-id 12345`
- **Scans before you install** — `clawdit scan --target ./my-skill/`

## Quick Start

```bash
# Install
brew install clawdit/tap/clawdit
# or
go install github.com/veebeeyoukay/clawdit/cmd/clawdit@latest

# Start capturing (auto-discovers your agents)
clawdit capture --auto

# Query what happened
clawdit query --since 1h

# Generate a compliance report
clawdit report --format html --open

# Scan a skill before installing
clawdit scan --target ./my-skill/
```

## How It Works

```
Developer                    Clawdit                     Agent + Tools
    |                           |                              |
    |--- runs agent through --->|                              |
    |                           |--- intercepts tool calls --->|
    |                           |<-- captures responses -------|
    |                           |--- logs to SQLite            |
    |                           |                              |
    |--- clawdit query -------->|                              |
    |<-- instant results -------|                              |
```

Clawdit runs as a lightweight local proxy between your agent and its tools. Zero code changes required. Works with any MCP-compatible framework.

## Compliance Mapping

Every finding maps to industry standards:

- **OWASP Top 10 for Agentic AI** (2025) — ASI01 through ASI10
- **AIUC-1** (2025) — First certification standard for AI agents

## Tech Stack

| Component | Choice | Why |
|-----------|--------|-----|
| Language | Go | Single binary, cross-platform, zero dependencies |
| Storage | SQLite | Ships with the binary, no setup, queryable |
| Rules | YAML | Human-readable, community-contributable |
| Reports | HTML / SARIF | Browser-viewable, CI/CD-compatible |

## Roadmap

- [x] Project scaffolding
- [ ] **Phase 1 — MVP**: Local audit capture, CLI query, HTML reports
- [ ] **Phase 2 — Policy Engine**: YAML rules, community rule registry
- [ ] **Phase 3 — Integrations**: OpenClaw, Claude Code, Cursor native configs
- [ ] **Phase 4 — Teams**: Self-hosted server, SIEM export, compliance dashboards

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines, especially for YAML rule contributions.

## Security

See [SECURITY.md](SECURITY.md) for our vulnerability disclosure policy.

## License

MIT — see [LICENSE](LICENSE)

---

*VirusTotal catches malicious skills. Clawdit catches malicious behavior.* ⚔️
