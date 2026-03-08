# codex-skills

User-defined Codex skills, versioned in Git.

## 1. Structure

Follow OpenAI's official guidance for skill structure and conventions:

- <https://platform.openai.com/docs/guides/skills>

Repository layout used here:

- `<skill-name>/SKILL.md`
- `<skill-name>/scripts/...` (optional)
- `link.sh` (symlinks skills into `~/.codex/skills`)

## 2. Install / Sync

```bash
cd ~/code/codex-skills
./link.sh
```

What this does:

- Creates `~/.codex/skills` if needed
- Symlinks each skill directory from this repo into `~/.codex/skills`
- Keeps `~/.codex/skills/.system` untouched

## 3. How We Work

Standard flow:

1. For bug investigations, run `$debug` first to perform strict, step-by-step root-cause analysis.
2. Make changes (or run `$refactor` for behavior-preserving structural cleanup)
3. Run `$review`
4. Fix changes if needed
5. Run `$commit`
6. Accept commit message
7. Run `$create-pull-request`
8. Continue if everything looks good

If you want a mostly hands-off flow, run `$lazy` to create a branch, implement the change, review it, commit it, push it, and open or update a draft PR.

## 4. Notes

- This repo should only contain user-defined skills.
- Do not modify `~/.codex/skills/.system` manually.
- Prefer small, focused commits.
- Re-run `./link.sh` after adding a new skill folder.

## 5. Skills

- `commit`: Generate and optionally apply a Conventional Commit from staged changes (`commit/SKILL.md`)
- `create-pull-request`: Create or update a draft PR from git diff (title + body) (`create-pull-request/SKILL.md`)
- `debug`: Strict debugging that starts from a user-specified file, requires a clear problem statement, and follows execution flow layer by layer until root cause is proven or missing evidence is explicitly identified (`debug/SKILL.md`)
- `lazy`: Run the end-to-end delivery flow from a fresh branch through validation, commit, push, and draft PR (`lazy/SKILL.md`)
- `refactor`: Propose minimal, safe code improvements without changing behavior (`refactor/SKILL.md`)
- `review`: Review staged or unstaged changes for bugs, risks, and minimal risk-reducing fixes (`review/SKILL.md`)
