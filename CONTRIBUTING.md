# Contributing to Clawdit

Thanks for your interest in making AI agents more transparent and accountable.

## Ways to Contribute

### 1. YAML Detection Rules (Most Needed!)

Clawdit uses YAML rules like Nuclei uses templates. Community rules are our biggest force multiplier.

**How to contribute a rule:**

1. Create a YAML file in `rules/scan/` or `rules/builtin/`
2. Follow the schema in `docs/rules-authoring.md`
3. Include:
   - Unique `id`
   - `severity` (critical/high/medium/low/info)
   - `description` with context
   - `references` (CVE, blog post, research URL)
   - `tags` mapping to OWASP ASI categories or AIUC-1 controls
4. Test your rule against sample payloads
5. Open a PR

**Inspiration sources:**
- [ClawHavoc Report](https://koik.io/blog/clawhavoc) — 824+ malicious ClawHub skills
- [OWASP Agentic AI Top 10](https://owasp.org/www-project-top-10-for-agentic-applications/)
- [VirusTotal ClawHub scanning](https://blog.virustotal.com/)
- Your own discoveries!

### 2. Code Contributions

- Fork → branch → PR against `main`
- Run `make test` and `make lint` before submitting
- Follow existing Go idioms (see `CLAUDE.md` for conventions)
- Add tests for new functionality

### 3. Bug Reports

Use the GitHub issue template. Include:
- OS and architecture
- Clawdit version (`clawdit version`)
- Steps to reproduce
- Expected vs. actual behavior

### 4. Documentation

Docs live in `docs/`. Improvements always welcome.

## Code of Conduct

Be respectful. Be constructive. We're building security tools to protect people — act accordingly.

## License

By contributing, you agree your contributions are licensed under MIT.
