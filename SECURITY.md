# Security Policy

## Reporting a Vulnerability

If you discover a security vulnerability in Clawdit, please report it responsibly.

**Email:** security@clawdit.ai

**What to include:**
- Description of the vulnerability
- Steps to reproduce
- Impact assessment
- Suggested fix (if any)

**Response timeline:**
- Acknowledgment: within 48 hours
- Assessment: within 7 days
- Fix (if confirmed): within 30 days for critical/high, 90 days for medium/low

## Scope

In scope:
- SQL injection in query interface
- Path traversal in config/file handling
- Information leakage (secrets in logs, error messages)
- Proxy security (data corruption, unauthorized forwarding)
- Binary tampering / supply chain

Out of scope:
- Denial of service against local SQLite
- Issues requiring physical access to the machine
- Social engineering

## Security Design

Clawdit is a security tool. We hold ourselves to the same standards we help enforce:

- All SQL queries use parameterized statements
- File paths are validated and canonicalized
- Secrets in logs are redacted (first/last 4 chars)
- Config directory permissions: 700
- Every release binary includes SHA-256 checksums
- No network calls home — ever

## Supported Versions

| Version | Supported |
|---------|-----------|
| latest  | ✅         |
| < latest | ❌        |

We only support the latest release. Update frequently.
