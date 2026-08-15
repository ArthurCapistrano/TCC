---
name: verify-citation
description: Verify whether an academic citation actually supports a manuscript claim by tracing the claim back through research evidence to the original paper.
---

# Verify Citation

## Purpose

Determine whether a citation used or proposed in the manuscript supports the associated claim.

## Input

- manuscript claim;
- citation;
- corresponding evidence note;
- original paper when necessary.

## Verification flow

claim
→ citation
→ evidence note
→ original paper

## Evaluate

Determine whether the claim is:

- SUPPORTED
- PARTIALLY SUPPORTED
- OVERSTATED
- NOT SUPPORTED
- SOURCE NOT FOUND

## Check

- Does the paper actually discuss the subject?
- Does it make the attributed claim?
- Is the manuscript stronger than the source?
- Is important context missing?
- Is the source being generalized beyond its scope?

## Rules

- Never invent replacement citations.
- Never silently modify a claim to make a citation fit.
- Never rely solely on `literature-map.md`.
- When uncertainty remains, inspect the original paper.
- Prefer uncertainty over unsupported confidence.

## Output

Report:

- claim;
- citation;
- verdict;
- supporting evidence;
- explanation;
- recommended action.