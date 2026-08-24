---
name: register-screening-decision
description: Finalize and record the provenance of a paper-screening decision using the reviewer, date, decision, exclusion reason, and notes fields from the Triagem worksheet. Use after screening evaluation, not to reassess the paper.
---

# Register Screening Decision

## Purpose

Persist a completed screening assessment without changing its evidential basis.

## Input

- `research/notes/screening/<paper-id>.md`
- the completed assessment produced by the screening workflow;
- the accountable reviewer identity supplied by the researcher.

## Fields to finalize

```markdown
Critério de Inclusão (Y/N):
Critério de Exclusão (Y/N):
Motivo da Exclusão:
Situação (Título-Resumo/Texto Completo):
Decisão (Incluir/Excluir/Dúvida):
Revisor(a):
Data da Decisão:
Notas:
```

## Validation

- `Incluir` must not have an unexplained satisfied exclusion criterion.
- `Excluir` must have an objective exclusion reason tied to a predefined
  criterion.
- `Dúvida` must state what information is missing or what conflict remains.
- `Data da Decisão` is the date the accountable decision was made, preferably
  `YYYY-MM-DD`; it is not the paper publication date.
- `Revisor(a)` identifies the accountable reviewer. Do not invent a name or
  attribute an AI-assisted assessment to a person who has not validated it.
- `Notas` may disclose AI assistance, disagreements, unavailable full text, or
  other context needed to audit the decision.

## Rules

- Preserve the assessment supplied by `screen-paper`; if it is inconsistent,
  report the inconsistency instead of silently correcting it.
- Never backdate a decision.
- Do not replace the original decision without preserving the prior decision,
  date, reviewer, and reason in the note history or `Notas`.
- Do not extract evidence or promote the paper to the wiki.
