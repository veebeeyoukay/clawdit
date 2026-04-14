# Clawdit — Developer Context

## What Is This?

Clawdit is a black box recorder for AI agents. It sits as a transparent MCP proxy between an agent (OpenClaw, Claude Code, Cursor) and its tools, capturing every tool call into a local SQLite audit log.

## Architecture

```
Agent → Clawdit (stdio/SSE proxy) → MCP Server/Tool
                ↓
        SQLite (local, tamper-evident)
                ↓
        Query / Report / Replay / Scan
```

## Tech Stack

- **Go 1.22+** — single static binary
- **SQLite** via `modernc.org/sqlite` (pure Go, no CGO)
- **Cobra** for CLI
- **YAML** for rules (like Nuclei templates)
- **HTML** reports (single-file, self-contained)
- **SARIF 2.1.0** for CI/CD integration

## Directory Structure

```
cmd/clawdit/          — Entry point
internal/cli/         — Cobra command definitions
internal/proxy/       — stdio + SSE/HTTP interceptors
internal/capture/     — Session lifecycle + orchestration
internal/store/       — SQLite read/write layer
internal/rules/       — YAML policy engine
internal/detect/      — Anomaly detection (frequency, secrets, boundaries)
internal/scan/        — Static scanner (MCP configs, skills)
internal/report/      — HTML + SARIF generators
internal/config/      — Config file loader
pkg/models/           — Shared data types
rules/builtin/        — OWASP + AIUC-1 rule packs
rules/scan/           — Malicious pattern rules
docs/                 — Documentation
```

## Key Design Decisions

1. **Pure Go SQLite** — no CGO for clean cross-compilation
2. **ULIDs** for IDs — sortable, unique, URL-safe
3. **SHA-256 tamper-evident hashing** on every log row
4. **Buffered batch inserts** — flush every 100 records or 500ms
5. **Default action is ALLOW** — audit first, block opt-in
6. **Config backup/restore** — safety net for MCP config rewrites

## Coding Conventions

- Standard Go error handling (`if err != nil`)
- `internal/` for private packages, `pkg/` for shared types
- Table-driven tests with `testify/assert`
- No global state — dependency injection via constructors
- All SQL queries use parameterized statements (no string concat)

## Compliance References

- OWASP Top 10 for Agentic AI (2025)
- AIUC-1 certification standard (2025)
- Findings map to ASI categories and AIUC controls

## Performance Targets

- Proxy latency: < 5ms p99
- Write throughput: > 5,000 inserts/sec
- Query over 100K records: < 500ms
- Binary size: < 20MB
```
