---
name: extract-evidence
description: Extract structured evidence from an included paper using exactly the information required by the project's evidence extraction spreadsheet.
---

# Extract Evidence

## Source

`research/papers/<paper-id>...`

Only papers classified as `Include` should normally reach this stage.

## Destination

`research/notes/evidence/<paper-id>.md`

## Output structure

# Evidence Extraction

## Identification

ID:
Use exactly the same ID assigned during screening.

## Study Type

Study Type:

Suggested values:
- Experimental
- Quasi-experimental
- Observational
- Survey
- Case Study
- Systematic Review
- Integrative Review
- Meta-analysis
- Theoretical/Conceptual
- Other

## Method

Method:
- Quantitative
- Qualitative
- Mixed
- NOT IDENTIFIED

## Study Objective

Study Objective:

Describe the objective stated by the authors.
Do not reinterpret the objective according to this TCC.

## Research Questions / Hypotheses

Research Questions / Hypotheses:

Record the questions or hypotheses explicitly presented by the paper.

If none are explicitly stated:

NOT IDENTIFIED

## Sample / Size / Population

Sample / Size / Population:

Describe the analyzed population, dataset, systems, repositories,
organizations or other units of analysis.

## Context / Sector / Country

Context / Sector / Country:

Identify:
- application context;
- sector/domain;
- country or geographical scope when relevant.

## Variables / Constructs

Variables / Constructs:

Identify the central variables, concepts or constructs evaluated.

For software/data engineering papers, this may include concepts such as:
- schema changes;
- failures;
- compatibility;
- resilience;
- data quality;
- pipeline behavior.

Do not force these examples if they are not present in the paper.

## Tools / Techniques

Tools / Techniques:

Record technologies, frameworks, algorithms, architectures,
experimental techniques or analytical methods used.

## Metrics / Evaluation

Metrics / Evaluation:

Record how the proposed approach or phenomenon was evaluated.

Examples may include:
- accuracy;
- execution time;
- failure rate;
- compatibility;
- number of detected changes.

Only include metrics actually used by the study.

## Main Results

Main Results:

Record the main findings reported by the authors.

Do not strengthen conclusions.

## Contributions

Contributions:

Record the contributions explicitly presented or clearly demonstrated
by the study.

Separate author claims from project interpretation.

## Limitations

Limitations:

Prioritize limitations explicitly acknowledged by the authors.

If additional limitations are inferred, label them:

PROJECT INTERPRETATION

## Implications

Theoretical / Practical Implications:

Record implications discussed by the study.

## Article Keywords

Keywords:

Prefer the keywords supplied by the original paper.

---

# Traceability

For important extracted information, record when possible:

Source Page:
Source Section:
Source Table/Figure:

---

# Rules

- Never fabricate missing information.
- Use `NOT IDENTIFIED` when the paper does not provide the requested information.
- Do not fill fields merely because they are required by the spreadsheet.
- Preserve negative and contradictory findings.
- Distinguish source information from project interpretation.
- Do not update the research wiki directly.