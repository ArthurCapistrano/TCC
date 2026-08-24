---
name: screen-paper
description: Evaluate a registered paper against predefined eligibility criteria and complete the decision fields from the Triagem worksheet. Use for title-abstract or full-text screening, not bibliographic registration or evidence extraction.
---

# Screen Paper

## Input

`research/notes/screening/<paper-id>.md`

and the corresponding RAW paper.

## Fields to evaluate

Critério de Inclusão (Y/N):

Critério de Exclusão (Y/N):

Motivo da Exclusão:

Situação:
- Título-Resumo
- Texto Completo

Decisão:
- Incluir
- Excluir
- Dúvida

Notas:

## Process

1. Locate the predefined inclusion and exclusion criteria. Do not derive them
   from the paper being screened.
2. Identify the current screening stage and use only information legitimately
   available at that stage.
3. Apply each relevant inclusion criterion and each relevant exclusion
   criterion.
4. Record the consolidated Y/N fields and identify the specific criterion IDs
   in `Notas` when the protocol defines more than one criterion.
5. Explain exclusion with an objective reason traceable to the protocol.
6. Assign the decision. Use `Dúvida` when the available material cannot support
   a defensible decision.
7. Hand the completed assessment to `register-screening-decision` when reviewer
   identity and decision date need to be finalized.

## Rules

- Do not use agreement with the research hypothesis as an inclusion criterion.
- Contradictory papers must not be excluded because they contradict the project.
- Use `Dúvida` when the available evidence is insufficient.
- Exclusion reasons must be objective and traceable to predefined criteria.
- Do not claim to be the accountable human reviewer. If the evaluation was
  AI-assisted, preserve that fact for `Notas` and require researcher validation
  before a final human decision is attributed.
