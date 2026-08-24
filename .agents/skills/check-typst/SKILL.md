---
name: check-typst
description: Validate whether the Typst manuscript compiles and diagnose source, bibliography, or asset errors. Use for build checks on article/main.typ, not for assessing scientific evidence or rewriting the manuscript.
---

# Check Typst

## Purpose

Check the manuscript build without changing its scientific content.

## Inputs

- `article/main.typ`
- `article/references.bib`
- local assets referenced by the manuscript, when present.

## Process

1. Inspect the manuscript entry point and referenced local files.
2. Verify that the Typst executable is available.
3. Compile the manuscript to a temporary output outside the repository when a
   build check is requested.
4. Report the first actionable diagnostics with their file and line when Typst
   provides them.
5. Modify source files only when the user explicitly asks for a fix, then run
   the build check again.

## Rules

- A successful compilation validates the build, not the scientific argument,
  citation fidelity, or factual correctness.
- Do not alter `research/papers/` or other source evidence.
- Do not invent bibliography entries to silence missing-citation errors.
- Preserve user changes and avoid writing generated PDFs into the repository
  unless the user requests an output artifact there.
