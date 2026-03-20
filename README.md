# GhostProbe v2.1 - Automated Vulnerability Scanner

**Production validated**: Discovered [HackerOne MTA-STS subdomain takeovers](https://github.com/EUMFMgfriedline/hacker0x01) (3x high-severity).

## 🚀 Quickstart
```bash
chmod +x ghostprobe.sh
./ghostprobe.sh example.com

⚙️ Workflow
Subfinder → httpx → Nuclei (high/crit) → JSON/CSV reports

📈 Features
16+ live subdomains/hour (4GB droplet)
H1/Bugcrowd formatted reports
Ethical takeover POC workflow
Rate-limited (abuse-proof)
Mass scan excluded (enterprise only)
🛡️ Production Proof
$ ./ghostprobe.sh hackerone.com
✅ mta-sts.managed.hackerone.com [GitHub takeover]
✅ mta-sts.hackerone.com [GitHub takeover]
✅ mta-sts.forwarding.hackerone.com [GitHub takeover]

Full POC: hacker0x01
💰 Freemium
TierFeaturesPrice
Free
1k scans/day, community templates
$0
Pro
Unlimited + AI triage
$29/mo
Enterprise
Custom agents + mass scan
Contact
📄 License
MIT - See LICENSE

## ⚠️ Disclaimer
GhostProbe is intended for **authorized security research only**.

- Always verify findings manually before reporting
- Only scan targets you have **explicit permission** to test
- Bug bounty programs have defined scope—**respect it**
- False positives possible—**confirm before submitting**
- Authors not liable for misuse

**Responsible disclosure only.** 🛡️

⭐ Star if GhostProbe finds bounties!
