# Dev Skills Share

A curated collection of **34 AI agent skills** for Cursor, Claude Code, and Codex — installed globally (USER level) so they're available in **every project** you open.

## What's Included

Skills are sourced from top open-source repos and organized for immediate use:

### Browser Automation
| Skill | Source | Description |
|-------|--------|-------------|
| **agent-browser** | [vercel-labs/agent-browser](https://github.com/vercel-labs/agent-browser) | Browser automation CLI — open sites, fill forms, click, screenshot, scrape data |

### Code Security & Analysis (Trail of Bits)
| Skill | Source | Description |
|-------|--------|-------------|
| **differential-review** | [trailofbits/skills](https://github.com/trailofbits/skills) | Security-focused code review on git diffs |
| **insecure-defaults** | [trailofbits/skills](https://github.com/trailofbits/skills) | Detect hardcoded secrets, fail-open patterns, weak auth |
| **modern-python** | [trailofbits/skills](https://github.com/trailofbits/skills) | Modern Python tooling — uv, ruff, ty, pytest |
| **codeql** | [trailofbits/skills](https://github.com/trailofbits/skills) | CodeQL static analysis queries |
| **semgrep** | [trailofbits/skills](https://github.com/trailofbits/skills) | Semgrep static analysis with parallel subagents |
| **sarif-parsing** | [trailofbits/skills](https://github.com/trailofbits/skills) | Parse and analyze SARIF security scan results |

### Testing Handbook (Trail of Bits)
| Skill | Source | Description |
|-------|--------|-------------|
| **coverage-analysis** | [trailofbits/skills](https://github.com/trailofbits/skills) | Code coverage analysis and reporting |
| **harness-writing** | [trailofbits/skills](https://github.com/trailofbits/skills) | Write fuzz test harnesses |
| **atheris** | [trailofbits/skills](https://github.com/trailofbits/skills) | Python fuzzing with Atheris |
| **aflpp** | [trailofbits/skills](https://github.com/trailofbits/skills) | AFL++ fuzzing |
| **libfuzzer** | [trailofbits/skills](https://github.com/trailofbits/skills) | libFuzzer integration |
| **libafl** | [trailofbits/skills](https://github.com/trailofbits/skills) | LibAFL fuzzing framework |
| **cargo-fuzz** | [trailofbits/skills](https://github.com/trailofbits/skills) | Rust fuzzing with cargo-fuzz |
| **ruzzy** | [trailofbits/skills](https://github.com/trailofbits/skills) | Ruby fuzzing with Ruzzy |
| **address-sanitizer** | [trailofbits/skills](https://github.com/trailofbits/skills) | AddressSanitizer for memory bugs |
| **constant-time-testing** | [trailofbits/skills](https://github.com/trailofbits/skills) | Detect timing side-channels |
| **fuzzing-dictionary** | [trailofbits/skills](https://github.com/trailofbits/skills) | Create fuzzing dictionaries |
| **fuzzing-obstacles** | [trailofbits/skills](https://github.com/trailofbits/skills) | Overcome fuzzing blockers |
| **ossfuzz** | [trailofbits/skills](https://github.com/trailofbits/skills) | OSS-Fuzz integration |
| **wycheproof** | [trailofbits/skills](https://github.com/trailofbits/skills) | Wycheproof crypto test vectors |
| **testing-handbook-generator** | [trailofbits/skills](https://github.com/trailofbits/skills) | Generate testing handbook content |

### React / Frontend (Vercel)
| Skill | Source | Description |
|-------|--------|-------------|
| **react-best-practices** | [vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills) | 40+ React/Next.js performance rules from Vercel Engineering |
| **web-design-guidelines** | [vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills) | 100+ UI rules — accessibility, UX, performance |
| **composition-patterns** | [vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills) | React composition patterns that scale |
| **react-native-skills** | [vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills) | React Native / Expo best practices |
| **vercel-deploy-claimable** | [vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills) | Deploy apps to Vercel from conversations |

### Development Workflow (Superpowers)
| Skill | Source | Description |
|-------|--------|-------------|
| **using-git-worktrees** | [obra/superpowers](https://github.com/obra/superpowers) | Isolated git worktrees for feature work |
| **test-driven-development** | [obra/superpowers](https://github.com/obra/superpowers) | TDD workflow — write tests before implementation |
| **executing-plans** | [obra/superpowers](https://github.com/obra/superpowers) | Execute implementation plans with review checkpoints |
| **writing-plans** | [obra/superpowers](https://github.com/obra/superpowers) | Write multi-step implementation plans before coding |
| **systematic-debugging** | [obra/superpowers](https://github.com/obra/superpowers) | Systematic debugging before proposing fixes |
| **verification-before-completion** | [obra/superpowers](https://github.com/obra/superpowers) | Verify work before committing / creating PRs |
| **finishing-a-development-branch** | [obra/superpowers](https://github.com/obra/superpowers) | Clean integration when implementation is complete |

---

## Installation

### Quick Install (recommended)

**Windows (PowerShell):**

```powershell
.\install.ps1
```

**macOS / Linux (Bash):**

```bash
chmod +x install.sh && ./install.sh
```

### Manual Install

1. Clone this repo:
   ```bash
   git clone https://github.com/royavrahami/dev-skills-share.git
   ```

2. Copy skills to your global skills directory:

   **Cursor:**
   ```bash
   # macOS / Linux
   cp -r dev-skills-share/skills/* ~/.cursor/skills/

   # Windows (PowerShell)
   Copy-Item -Path "dev-skills-share\skills\*" -Destination "$env:USERPROFILE\.cursor\skills\" -Recurse -Force
   ```

   **Codex:**
   ```bash
   cp -r dev-skills-share/skills/* ~/.codex/skills/
   ```

3. Restart your IDE to pick up the new skills.

### Choosing Specific Skills

Don't want all 34? Copy only what you need:

```bash
# Example: only workflow + security skills
cp -r dev-skills-share/skills/using-git-worktrees ~/.cursor/skills/
cp -r dev-skills-share/skills/differential-review ~/.cursor/skills/
cp -r dev-skills-share/skills/modern-python ~/.cursor/skills/
```

---

## How It Works

Skills are markdown files (`SKILL.md`) that teach AI agents specialized workflows. When installed in the global skills directory, the agent can use them in **any project** you open.

```
~/.cursor/skills/          # Cursor global skills (USER level)
├── agent-browser/
│   └── SKILL.md           # Browser automation instructions
├── using-git-worktrees/
│   └── SKILL.md           # Git worktree workflow
├── modern-python/
│   └── SKILL.md           # Python tooling standards
│   └── references/        # Supporting docs (loaded on-demand)
└── ...
```

Each skill has:
- **SKILL.md** — Main instructions (auto-loaded by the agent)
- **references/** — Detailed docs loaded only when needed (optional)
- **scripts/** — Helper scripts for automation (optional)

---

## Updating

Pull the latest skills:

```bash
cd dev-skills-share
git pull
# Then re-run install script or copy manually
```

---

## Credits

Skills are curated from these excellent open-source projects:

- [vercel-labs/agent-browser](https://github.com/vercel-labs/agent-browser) — Browser automation CLI
- [trailofbits/skills](https://github.com/trailofbits/skills) — Security research skills
- [vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills) — React/Next.js/UI skills
- [obra/superpowers](https://github.com/obra/superpowers) — Development workflow skills

---

## License

Individual skills retain their original licenses. This collection is for sharing convenience.
