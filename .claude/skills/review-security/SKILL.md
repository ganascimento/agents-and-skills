---
name: review-security
description: Performs a security-focused audit of the code. Use when you want to identify vulnerabilities, sensitive data exposure, or specific security issues.
allowed-tools: Bash, Read, Grep, Glob
---

Execute a security audit on the specified code (file, directory, or current diff).

## Analysis focus

Focus exclusively on:

### OWASP Top 10
- Injection (SQL, NoSQL, OS, LDAP)
- Broken Authentication
- Sensitive Data Exposure
- XXE (XML External Entities)
- Broken Access Control
- Security Misconfiguration
- XSS (Cross-Site Scripting)
- Insecure Deserialization
- Using Components with Known Vulnerabilities
- Insufficient Logging & Monitoring

### Secrets and credentials
- Hardcoded API keys, tokens, passwords
- Committed `.env` files
- Strings that look like hashes or tokens

### Input validation
- User inputs used without sanitization
- File uploads without type/size validation
- URL parameters used directly in queries

### Dependencies
- Check `package.json`, `requirements.txt`, `go.mod`, `Gemfile`, etc.
- Identify outdated dependencies or ones with known CVEs

## Response format

```
## Security Audit — <scope>

### Critical vulnerabilities
- [SEVERITY: HIGH] [FILE:LINE] Description + hypothetical exploit + fix

### Medium vulnerabilities
- [SEVERITY: MEDIUM] [FILE:LINE] Description + fix

### Warnings
- [SEVERITY: LOW] [FILE:LINE] Description + recommendation

### No issues found in
- List areas that were checked and are OK
```

Be specific about how each vulnerability can be exploited so the developer understands the urgency.
