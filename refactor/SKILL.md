---
name: refactor
description: Propose minimal, safe code improvements without changing behavior
---

Use this skill when the user wants to improve structure, clarity, or maintainability without altering functionality.

────────────────────────────────
USAGE (required)

- `$refactor staged`
- `$refactor changes`
- `$refactor <file-path>`

If argument is missing:
Print ONLY:
`Usage: $refactor staged | $refactor changes | $refactor <file-path>`
Exit.

────────────────────────────────
MODE BEHAVIOR

If argument is `staged`:

- Run: `git diff --cached --stat`
- Run: `git diff --cached`

If argument is `changes`:

- Run: `git diff --stat`
- Run: `git diff`

If argument is a file path:

- Verify file exists.
- Read the full file content.
- Refactor ONLY that file.
- Do NOT inspect other files.

────────────────────────────────
REFACTOR PRINCIPLES

- Preserve behavior exactly.
- No logic changes.
- No feature additions.
- No bug fixes (unless purely structural and behavior-neutral).
- Prefer small diffs.
- Improve:
  - Naming clarity
  - Function size
  - Duplication
  - Dead code
  - Readability
  - Type safety (non-breaking only)
  - Consistency

DO NOT:

- Change public APIs
- Modify unrelated files
- Run tests
- Create commits
- Open pull requests
- Trigger CI
- Invoke other skills
- Introduce new architecture
- Refactor broadly beyond the provided scope

────────────────────────────────
OUTPUT FORMAT

1. Summary
   - Short description of improvement

2. Refactor Plan
   - Bullet list of exact structural changes

3. Proposed Patch
   - Minimal patch or full updated file (if file mode)

4. Risk Level
   - low | medium | high

After printing the analysis, print exactly:

Type "continue" to apply this refactor.
Anything else cancels.

────────────────────────────────
APPLY PHASE

Only if the next user message is exactly:

continue

Then:

- Apply ONLY the described refactor.
- Modify ONLY:
  - staged files (if staged mode)
  - changed files (if changes mode)
  - specified file (if file mode)
- Do NOT refactor anything else.
- Do NOT run tests.
- Do NOT create commits.
- Do NOT open pull requests.
- Do NOT trigger CI.
- Do NOT invoke other skills.
- Stop immediately after applying.

Then print:

- `git status --short`
- `git diff --stat`
